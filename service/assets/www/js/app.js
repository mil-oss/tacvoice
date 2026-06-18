// TacVoice browser app: WASM-driven form rendering, submission, and logging.
// Loads the tacvoice WASM module, wires UI controls, and bridges Vosk transcription.

import init, {
    init_panic_hook,
    TacVoiceGrpcClient,
    render_form_json,
    render_message_form,
    cancel_form,
    refresh_form_outputs,
    apply_transcript_to_form,
} from './pkg/tacvoice.js';

const MODEL_PATH = 'vosk/vosk-model.tar.gz';
const SAMPLE_RATE = 16000;

function auth() {
    if (!window.TacVoiceAuth) {
        throw new Error('TacVoiceAuth not loaded; include js/auth-oidc.js before app.js');
    }
    return window.TacVoiceAuth;
}

let grpc = null;
let wasmReady = false;
let catalogGroups = [];
let listening = false;
let sessionTranscript = '';
let voskModel = null;
let recognizer = null;
let audioContext = null;
let mediaStream = null;
let processor = null;
const messageLog = [];
let selectedLogId = null;

const COLORS = ['blue', 'red', 'green', 'yellow', 'white', 'gray', 'grey'];

function formatLogTime(iso) {
    try {
        return new Date(iso).toLocaleString();
    } catch {
        return iso;
    }
}

function formatLogLabel(entry) {
    const when = formatLogTime(entry.submittedAt);
    return `${entry.messageNumber} — ${entry.messageName} (${when})`;
}

function formatLogDetail(entry) {
    const lines = [
        `${entry.messageNumber}: ${entry.messageName}`,
        `Callsign: ${entry.callsign}`,
        `Submitted: ${formatLogTime(entry.submittedAt)}`,
        '',
        '--- Radio ---',
        entry.radio,
        '',
        '--- Chat ---',
        entry.chat,
    ];
    return lines.join('\n');
}


function renderMessageLog() {
    const list = document.getElementById('message-log-list');
    const detail = document.getElementById('message-log-detail');
    if (!list) return;
    list.innerHTML = '';
    for (const entry of messageLog) {
        const item = document.createElement('li');
        item.textContent = formatLogLabel(entry);
        item.dataset.id = entry.id;
        if (entry.id === selectedLogId) item.classList.add('selected');
        item.addEventListener('click', () => {
            selectedLogId = entry.id;
            renderMessageLog();
        });
        list.appendChild(item);
    }
    if (detail) {
        const selected = messageLog.find((e) => e.id === selectedLogId);
        detail.value = selected ? formatLogDetail(selected) : '';
    }
}

function addMessageLogEntry(entry) {
    messageLog.unshift(entry);
    selectedLogId = entry.id;
    renderMessageLog();
}
const NUMBER_WORDS = {
    one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8,
    nine: 9, ten: 10, eleven: 11, twelve: 12, thirteen: 13, fourteen: 14,
    fifteen: 15, sixteen: 16,
};

function setStatus(text) {
    const el = document.getElementById('status');
    if (el) el.textContent = text;
}

function getCallsign() {
    const el = document.getElementById('callsign');
    const value = el ? el.value.trim() : '';
    return value || 'UNKNOWN';
}

// Detects a "COLOR NUMBER" message id (e.g. "blue three" -> "BLUE 3") in text.
function detectMessageNumber(text) {
    const tokens = text.toLowerCase().replace(/[^a-z0-9 ]/g, ' ').split(/\s+/).filter(Boolean);
    for (let i = 0; i < tokens.length; i++) {
        const color = tokens[i] === 'grey' ? 'gray' : tokens[i];
        if (!COLORS.includes(tokens[i])) continue;
        const next = tokens[i + 1];
        if (!next) continue;
        let num = null;
        if (/^\d+$/.test(next)) num = parseInt(next, 10);
        else if (NUMBER_WORDS[next] !== undefined) num = NUMBER_WORDS[next];
        if (num !== null) return `${color.toUpperCase()} ${num}`;
    }
    return null;
}

// Builds the message-number dropdown from catalog groups.
function fillMessageSelect(groups) {
    const select = document.getElementById('message-number');
    if (!select) return 0;
    select.innerHTML = '<option value="">Select a message...</option>';
    let count = 0;
    for (const group of groups) {
        const optgroup = document.createElement('optgroup');
        optgroup.label = `${group.color} (${group.kind})`;
        for (const message of group.messages) {
            const option = document.createElement('option');
            option.value = message.number;
            option.textContent = `${message.number} - ${message.name}`;
            optgroup.appendChild(option);
            count += 1;
        }
        select.appendChild(optgroup);
    }
    return count;
}

// Loads catalog groups from HTTP JSON, falling back to gRPC-Web.
async function fetchCatalogGroups() {
    const resp = await auth().authFetch('messages/catalog.json');
    if (resp.ok) {
        return resp.json();
    }
    if (!grpc) {
        throw new Error(`catalog HTTP ${resp.status}`);
    }
    const json = await grpc.get_catalog();
    return JSON.parse(json);
}

// Returns the catalog hex color for a message number (e.g. BLUE 1 -> #9999ff).
function lookupHex(number) {
    const prefix = number.split(/\s+/)[0]?.toUpperCase();
    if (!prefix) return '';
    const group = catalogGroups.find((g) => g.color?.toUpperCase() === prefix);
    return group?.hex || '';
}

// Populates the message-number dropdown from the server catalog.
async function populateMessageSelect() {
    const select = document.getElementById('message-number');
    if (!select) return;
    setStatus('Loading message list...');
    try {
        const groups = await fetchCatalogGroups();
        catalogGroups = groups;
        const count = fillMessageSelect(groups);
        setStatus(count > 0 ? `${count} messages loaded` : 'No messages in catalog');
    } catch (e) {
        console.warn('populateMessageSelect failed:', e);
        setStatus('Message list unavailable');
    }
}

async function loadForm(number) {
    if (!number) return;
    const select = document.getElementById('message-number');
    if (select && select.value !== number) {
        select.value = number;
        sessionTranscript = '';
    }
    setStatus(`Loading ${number}...`);
    const hex = lookupHex(number);
    try {
        const params = new URLSearchParams({ number });
        const resp = await auth().authFetch(`messages/form.json?${params}`);
        if (resp.ok) {
            const message = await resp.json();
            render_form_json(JSON.stringify(message), hex);
            refreshFormOutputs();
            updateSubmitButtonState();
            setStatus(`Loaded ${number}`);
            return;
        }
        await render_message_form(number, hex);
        refreshFormOutputs();
        updateSubmitButtonState();
        setStatus(`Loaded ${number}`);
    } catch (e) {
        setStatus(`Form ${number} not found`);
        console.warn('loadForm failed:', e);
    }
}

function refreshFormOutputs() {
    try {
        refresh_form_outputs();
    } catch (e) {
        console.warn('refresh_form_outputs failed:', e);
    }
}

function clearFormDisplay() {
    const root = document.getElementById('form-root');
    if (root) root.innerHTML = '';
    updateSubmitButtonState();
}

function hasLoadedForm() {
    return Boolean(document.getElementById('tacvoice-form'));
}

function updateSubmitButtonState() {
    const submitBtn = document.getElementById('submit-btn');
    if (submitBtn) submitBtn.disabled = !hasLoadedForm();
}

function captureSubmissionMeta() {
    const form = document.getElementById('tacvoice-form');
    if (!form) return null;
    refreshFormOutputs();
    const radioEl = document.getElementById('radio-output');
    const chatEl = document.getElementById('chat-output');
    return {
        messageName: form.getAttribute('data-name') || '',
        messageNumber: form.getAttribute('data-number') || '',
        radio: radioEl ? radioEl.value : '',
        chat: chatEl ? chatEl.value : '',
    };
}

async function handleSubmit() {
    if (!wasmReady) {
        setStatus('Still loading; try again in a moment');
        return;
    }
    const meta = captureSubmissionMeta();
    if (!meta) {
        setStatus('Submit failed — load a form first');
        return;
    }

    clearFormDisplay();

    addMessageLogEntry({
        id: crypto.randomUUID(),
        submittedAt: new Date().toISOString(),
        callsign: getCallsign(),
        messageName: meta.messageName,
        messageNumber: meta.messageNumber,
        radio: meta.radio,
        chat: meta.chat,
    });

    sessionTranscript = '';
    const transcript = document.getElementById('transcript');
    if (transcript) transcript.textContent = '';
    const select = document.getElementById('message-number');
    if (select) select.value = '';

    setStatus('Submitted');

    if (grpc) {
        try {
            await grpc.log_submission(
                meta.messageName,
                meta.messageNumber,
                meta.radio,
                meta.chat,
            );
        } catch (e) {
            console.warn('log_submission failed (submission kept locally):', e);
        }
    }
}

function bindFormOutputRefresh() {
    const root = document.getElementById('form-root');
    if (!root || root.dataset.outputRefreshBound === '1') return;
    root.dataset.outputRefreshBound = '1';
    const onFormChange = () => refreshFormOutputs();
    root.addEventListener('input', onFormChange);
    root.addEventListener('change', onFormChange);
}

function tryFillTranscript(text) {
    if (!text) return 0;
    try {
        const filled = apply_transcript_to_form(text);
        if (filled > 0) {
            refreshFormOutputs();
            setStatus(`Filled ${filled} line field(s)`);
        }
        return filled;
    } catch (e) {
        console.warn('apply_transcript_to_form failed:', e);
        return 0;
    }
}

// Renders the detected form and logs the recording metadata (callsign + size).
async function handleTranscript(text) {
    sessionTranscript = sessionTranscript ? `${sessionTranscript} ${text}` : text;
    const transcript = document.getElementById('transcript');
    if (transcript) transcript.textContent = sessionTranscript;
    if (grpc) {
        try {
            const payload = JSON.stringify({ callsign: getCallsign(), text: sessionTranscript });
            await grpc.publish_transcription(payload);
        } catch (e) {
            console.warn('publish_transcription failed:', e);
        }
    }
    const number = detectMessageNumber(text);
    if (number) {
        await loadForm(number);
    }
    tryFillTranscript(text);
    if (sessionTranscript !== text) {
        tryFillTranscript(sessionTranscript);
    }
    if (!number) return;
    if (grpc) {
        try {
            await grpc.log_recording(getCallsign(), text.length);
        } catch (e) {
            console.warn('log_recording failed:', e);
        }
    }
}

async function startListening() {
    if (listening) return;
    if (!window.Vosk) {
        setStatus('Voice engine still loading; try again shortly');
        return;
    }
    try {
        setStatus('Loading voice model...');
        if (!voskModel) voskModel = await window.Vosk.createModel(MODEL_PATH);
        recognizer = new voskModel.KaldiRecognizer(SAMPLE_RATE);
        recognizer.on('result', (msg) => {
            const text = msg.result && msg.result.text ? msg.result.text : '';
            if (text) void handleTranscript(text);
        });
        recognizer.on('partialresult', (msg) => {
            const partial = msg.result && msg.result.partial ? msg.result.partial : '';
            const transcript = document.getElementById('transcript');
            if (transcript && partial) {
                transcript.textContent = sessionTranscript
                    ? `${sessionTranscript} ${partial}`
                    : partial;
                tryFillTranscript(partial);
                if (sessionTranscript) {
                    tryFillTranscript(`${sessionTranscript} ${partial}`);
                }
            }
        });

        mediaStream = await navigator.mediaDevices.getUserMedia({
            audio: { echoCancellation: true, noiseSuppression: true, channelCount: 1, sampleRate: SAMPLE_RATE },
            video: false,
        });
        audioContext = new (window.AudioContext || window.webkitAudioContext)({ sampleRate: SAMPLE_RATE });
        const source = audioContext.createMediaStreamSource(mediaStream);
        processor = audioContext.createScriptProcessor(4096, 1, 1);
        processor.onaudioprocess = (event) => {
            try {
                recognizer.acceptWaveform(event.inputBuffer);
            } catch (e) {
                console.warn('acceptWaveform failed:', e);
            }
        };
        source.connect(processor);
        processor.connect(audioContext.destination);

        listening = true;
        const btn = document.getElementById('listen-btn');
        if (btn) btn.textContent = 'Stop Listening';
        setStatus('Listening...');
    } catch (e) {
        setStatus('Microphone or model unavailable');
        console.error('startListening failed:', e);
    }
}

function stopListening() {
    listening = false;
    sessionTranscript = '';
    if (processor) { processor.disconnect(); processor = null; }
    if (audioContext) { void audioContext.close(); audioContext = null; }
    if (mediaStream) { mediaStream.getTracks().forEach((t) => t.stop()); mediaStream = null; }
    if (recognizer) { try { recognizer.remove(); } catch (e) { /* ignore */ } recognizer = null; }
    const btn = document.getElementById('listen-btn');
    if (btn) btn.textContent = 'Start Listening';
    setStatus('Stopped');
}

function wireControls() {
    bindFormOutputRefresh();

    const select = document.getElementById('message-number');
    if (select) {
        select.addEventListener('change', () => {
            const number = select.value.trim();
            if (number) void loadForm(number);
        });
    }

    const listenBtn = document.getElementById('listen-btn');
    if (listenBtn) {
        listenBtn.addEventListener('click', () => {
            if (listening) stopListening();
            else void startListening();
        });
    }

    const submitBtn = document.getElementById('submit-btn');
    if (submitBtn) {
        submitBtn.addEventListener('click', () => {
            void handleSubmit();
        });
    }
    updateSubmitButtonState();

    const cancelBtn = document.getElementById('cancel-btn');
    if (cancelBtn) {
        cancelBtn.addEventListener('click', () => {
            try {
                cancel_form();
                sessionTranscript = '';
                updateSubmitButtonState();
                setStatus('Cleared');
            } catch (e) {
                console.warn('cancel_form failed:', e);
            }
        });
    }

    const logoutBtn = document.getElementById('logout-btn');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', () => {
            void auth().logout();
        });
    }
}

// Initializes the WASM module, logs startup, and wires the UI controls.
async function initApp() {
    const userEl = document.getElementById('user-label');
    if (userEl) {
        const name = auth().getLoginDisplayName();
        userEl.textContent = name ? `Signed in as ${name}` : '';
    }
    const logoutBtn = document.getElementById('logout-btn');
    if (logoutBtn) {
        logoutBtn.hidden = !auth().getAccessToken();
    }

    try {
        await init();
        init_panic_hook();
        wasmReady = true;
        grpc = new TacVoiceGrpcClient();
        wireControls();
        await populateMessageSelect();
        setStatus('Ready');
    } catch (e) {
        console.error('WASM init failed:', e);
        wireControls();
        setStatus('Ready (forms need WASM)');
    }
}

window.initApp = initApp;

export { initApp };
