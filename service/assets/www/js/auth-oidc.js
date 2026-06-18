// Native OIDC Authorization Code + PKCE (classic script; no ES module required).
// Exposes window.TacVoiceAuth for app.js and voskload.js.
(function () {
    const STORAGE_ACCESS = 'tacvoice_access_token';
    const STORAGE_REFRESH = 'tacvoice_refresh_token';
    const STORAGE_PKCE = 'tacvoice_pkce_verifier';
    const STORAGE_STATE = 'tacvoice_pkce_state';
    const CONFIG_PATH = '.well-known/tacvoice/oidc.json';

    let oidcConfig = null;
    let loginDisplayName = null;

    function base64Url(bytes) {
        let binary = '';
        for (let i = 0; i < bytes.length; i += 1) {
            binary += String.fromCharCode(bytes[i]);
        }
        return btoa(binary).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
    }

    function randomVerifier() {
        const bytes = new Uint8Array(32);
        crypto.getRandomValues(bytes);
        return base64Url(bytes);
    }

    function pkceChallenge(verifier) {
        const data = new TextEncoder().encode(verifier);
        return crypto.subtle.digest('SHA-256', data).then((digest) => base64Url(new Uint8Array(digest)));
    }

    function redirectUri() {
        const path = window.location.pathname.endsWith('/')
            ? window.location.pathname
            : `${window.location.pathname}/`;
        return `${window.location.origin}${path}`;
    }

    function issuerBase(issuer) {
        return issuer.replace(/\/+$/, '');
    }

    function parseJwtClaims(token) {
        try {
            const payload = token.split('.')[1];
            if (!payload) return null;
            const padded = payload.replace(/-/g, '+').replace(/_/g, '/');
            return JSON.parse(atob(padded));
        } catch {
            return null;
        }
    }

    function inferUdsOidcConfig() {
        const host = window.location.hostname;
        const match = host.match(/^tacvoice\.(.+)$/);
        if (!match) return null;
        return {
            enforce: true,
            issuer: `https://sso.${match[1]}/realms/uds`,
            clientId: 'uds-tac-tacvoice',
        };
    }

    function getAccessToken() {
        return sessionStorage.getItem(STORAGE_ACCESS);
    }

    function clearSession() {
        sessionStorage.removeItem(STORAGE_ACCESS);
        sessionStorage.removeItem(STORAGE_REFRESH);
        sessionStorage.removeItem(STORAGE_PKCE);
        sessionStorage.removeItem(STORAGE_STATE);
        loginDisplayName = null;
    }

    async function loadOidcConfig() {
        if (oidcConfig) return oidcConfig;
        try {
            const resp = await fetch(CONFIG_PATH, { cache: 'no-store' });
            if (resp.ok) {
                oidcConfig = await resp.json();
                return oidcConfig;
            }
        } catch (e) {
            console.warn('oidc config fetch failed:', e);
        }
        const inferred = inferUdsOidcConfig();
        if (inferred) {
            oidcConfig = inferred;
            return oidcConfig;
        }
        oidcConfig = { enforce: false };
        return oidcConfig;
    }

    function rememberTokens(tokenResponse) {
        if (tokenResponse.access_token) {
            sessionStorage.setItem(STORAGE_ACCESS, tokenResponse.access_token);
            const claims = parseJwtClaims(tokenResponse.access_token);
            loginDisplayName = claims?.preferred_username || claims?.name || claims?.sub || null;
        }
        if (tokenResponse.refresh_token) {
            sessionStorage.setItem(STORAGE_REFRESH, tokenResponse.refresh_token);
        }
    }

    async function exchangeCode(cfg, code, verifier) {
        const body = new URLSearchParams({
            grant_type: 'authorization_code',
            client_id: cfg.clientId,
            code,
            redirect_uri: redirectUri(),
            code_verifier: verifier,
        });
        const resp = await fetch(`${issuerBase(cfg.issuer)}/protocol/openid-connect/token`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body,
        });
        if (!resp.ok) {
            const detail = await resp.text();
            throw new Error(`token exchange failed (${resp.status}): ${detail}`);
        }
        return resp.json();
    }

    async function refreshAccessToken(cfg) {
        const refresh = sessionStorage.getItem(STORAGE_REFRESH);
        if (!refresh) return false;
        const body = new URLSearchParams({
            grant_type: 'refresh_token',
            client_id: cfg.clientId,
            refresh_token: refresh,
        });
        const resp = await fetch(`${issuerBase(cfg.issuer)}/protocol/openid-connect/token`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body,
        });
        if (!resp.ok) {
            clearSession();
            return false;
        }
        rememberTokens(await resp.json());
        return Boolean(getAccessToken());
    }

    function stripAuthQuery() {
        const url = new URL(window.location.href);
        url.searchParams.delete('code');
        url.searchParams.delete('state');
        url.searchParams.delete('session_state');
        url.searchParams.delete('iss');
        window.history.replaceState({}, document.title, `${url.pathname}${url.search}${url.hash}`);
    }

    function beginLogin(cfg) {
        const verifier = randomVerifier();
        const state = randomVerifier();
        sessionStorage.setItem(STORAGE_PKCE, verifier);
        sessionStorage.setItem(STORAGE_STATE, state);
        pkceChallenge(verifier).then((challenge) => {
            const params = new URLSearchParams({
                client_id: cfg.clientId,
                redirect_uri: redirectUri(),
                response_type: 'code',
                scope: 'openid profile email',
                state,
                code_challenge: challenge,
                code_challenge_method: 'S256',
            });
            window.location.assign(
                `${issuerBase(cfg.issuer)}/protocol/openid-connect/auth?${params}`,
            );
        });
    }

    async function handleCallback(cfg) {
        const params = new URLSearchParams(window.location.search);
        const error = params.get('error');
        if (error) {
            throw new Error(params.get('error_description') || error);
        }
        const code = params.get('code');
        if (!code) return false;

        const state = params.get('state');
        const expected = sessionStorage.getItem(STORAGE_STATE);
        const verifier = sessionStorage.getItem(STORAGE_PKCE);
        sessionStorage.removeItem(STORAGE_STATE);
        sessionStorage.removeItem(STORAGE_PKCE);
        if (!verifier || !expected || state !== expected) {
            throw new Error('OIDC state mismatch');
        }

        rememberTokens(await exchangeCode(cfg, code, verifier));
        stripAuthQuery();
        return true;
    }

    async function ensureAuthenticated() {
        const cfg = await loadOidcConfig();
        if (!cfg.enforce || !cfg.issuer || !cfg.clientId) {
            return { enforced: false };
        }

        if (await handleCallback(cfg)) {
            return { enforced: true, user: loginDisplayName };
        }

        const token = getAccessToken();
        if (!token && !(await refreshAccessToken(cfg))) {
            beginLogin(cfg);
            return { enforced: true, redirecting: true };
        }

        if (!loginDisplayName && token) {
            const claims = parseJwtClaims(token);
            loginDisplayName = claims?.preferred_username || claims?.name || claims?.sub || null;
        }

        return { enforced: true, user: loginDisplayName };
    }

    async function authFetch(url, options) {
        const opts = options || {};
        const cfg = await loadOidcConfig();
        const headers = new Headers(opts.headers || {});
        const token = getAccessToken();
        if (token) {
            headers.set('Authorization', `Bearer ${token}`);
        }
        let resp = await fetch(url, { ...opts, headers, cache: opts.cache || 'no-store' });

        if (resp.status === 401 && cfg.enforce) {
            if (await refreshAccessToken(cfg)) {
                headers.set('Authorization', `Bearer ${getAccessToken()}`);
                resp = await fetch(url, { ...opts, headers, cache: opts.cache || 'no-store' });
            }
            if (resp.status === 401) {
                clearSession();
                beginLogin(cfg);
                throw new Error('session expired; redirecting to login');
            }
        }
        return resp;
    }

    async function logout() {
        const cfg = await loadOidcConfig();
        clearSession();
        if (!cfg.issuer || !cfg.clientId) {
            window.location.reload();
            return;
        }
        const params = new URLSearchParams({
            client_id: cfg.clientId,
            post_logout_redirect_uri: redirectUri(),
        });
        window.location.assign(
            `${issuerBase(cfg.issuer)}/protocol/openid-connect/logout?${params}`,
        );
    }

    window.TacVoiceAuth = {
        ensureAuthenticated,
        authFetch,
        logout,
        getAccessToken,
        getLoginDisplayName: () => loginDisplayName,
    };
})();
