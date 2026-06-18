// Bootstrap: load app + WASM first; Vosk loads in parallel for voice/transcription only.

const loadVosk = async () => {
    if (window.Vosk) {
        console.log('Vosk version:', window.Vosk.version || 'unknown');
        return window.Vosk;
    }

    try {
        await new Promise((resolve, reject) => {
            const script = document.createElement('script');
            script.src = 'js/vosk.js';
            script.type = 'text/javascript';

            script.onload = () => {
                if (window.Vosk) {
                    resolve(window.Vosk);
                } else {
                    reject(new Error('Vosk loaded but not available in window.Vosk'));
                }
            };

            script.onerror = (error) => {
                reject(new Error(`Failed to load Vosk from local file: ${error.message || 'Unknown error'}`));
            };

            document.head.appendChild(script);
        });

        if (window.Vosk) {
            return window.Vosk;
        }
    } catch (localError) {
        console.warn('Local Vosk not found or error loading:', localError.message);
    }

    if (!window.Vosk) {
        throw new Error('Vosk library not found after all loading attempts');
    }

    return window.Vosk;
};

window.isModule = true;

function runInitApp() {
    if (typeof window.initApp !== 'function') {
        console.error('initApp function not found on window object');
        return;
    }
    const start = () => {
        if (window.TacVoiceAuth) {
            window.TacVoiceAuth.ensureAuthenticated().then((authResult) => {
                if (authResult.redirecting) return;
                window.initApp();
            }).catch((err) => {
                console.error('OIDC bootstrap failed:', err);
                document.getElementById('status').textContent = 'Login failed; see console';
            });
            return;
        }
        window.initApp();
    };
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', start);
    } else {
        start();
    }
}

(async () => {
    try {
        await import('./app.js');
        runInitApp();

        void loadVosk()
            .then((Vosk) => {
                window.Vosk = Vosk;
            })
            .catch((err) => {
                console.warn('Vosk failed to load; voice features unavailable until reload:', err);
            });
    } catch (error) {
        console.error('Failed to initialize application:', error);
        const appElement = document.getElementById('app');
        if (appElement) {
            appElement.innerHTML = `
                <div class="error-message">
                    <h2>Error Loading Application</h2>
                    <p>${error.message || 'Failed to initialize the application'}</p>
                    <p>Please check the console for more details and refresh the page to try again.</p>
                </div>
            `;
        }
    }
})();
