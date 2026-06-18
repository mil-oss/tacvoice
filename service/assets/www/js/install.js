// Native Browser Install Support
// We no longer intercept 'beforeinstallprompt' with preventDefault(), so the browser
// will show its standard install UI (mini-infobar on mobile, icon in header on desktop).

window.addEventListener('appinstalled', () => {
    console.log('PWA was installed');
});
