const textUI = document.getElementById('textui');
const box = document.querySelector('.r1-textui');
const actionsList = document.getElementById('actionsList');
let activeFontStyle = null;

window.addEventListener('message', function(event) {
    const data = event.data;

    if (data.action === 'show') {
        showTextUI(data);
    }

    if (data.action === 'hide') {
        hideTextUI();
    }
});

function showTextUI(data) {
    const position = data.position || 'center-left';
    const style = data.style || 'red';
    const mainColor = data.mainColor || '#ff003c';

    applyConfiguredFont(data.fontFile, data.fontFamily);

    textUI.className = position;
    textUI.classList.remove('hidden', 'hideAnim');

    box.className = `r1-textui ${style}`;
    box.style.setProperty('--main-color', mainColor);

    actionsList.innerHTML = '';

    const actions = Array.isArray(data.actions) ? data.actions : [];

    actions.forEach(action => {
        const item = document.createElement('div');
        item.className = 'action-item';
        item.style.setProperty('--action-color', action.color || mainColor);

        item.innerHTML = `
            <div class="action-line">
                <div class="action-icon-box">
                    <i class="${escapeAttr(action.icon || 'fa-solid fa-hand-pointer')}"></i>
                </div>
                <span class="action-key">${escapeHtml(action.key || 'E')}</span>
                <span class="action-separator">|</span>
                <span class="action-text">${escapeHtml(action.text || 'Interactuar')}</span>
            </div>
        `;

        actionsList.appendChild(item);
    });
}

function hideTextUI() {
    textUI.classList.add('hideAnim');

    setTimeout(() => {
        textUI.classList.add('hidden');
        textUI.classList.remove('hideAnim');
    }, 220);
}

function escapeHtml(text) {
    return String(text)
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#039;');
}

function escapeAttr(text) {
    return String(text)
        .replaceAll('"', '')
        .replaceAll("'", '')
        .replaceAll('<', '')
        .replaceAll('>', '');
}

function applyConfiguredFont(fontFile, fontFamily) {
    const cleanFile = String(fontFile || '').trim();
    const cleanFamily = String(fontFamily || 'R1CustomFont').trim() || 'R1CustomFont';

    if (!cleanFile) {
        document.documentElement.style.setProperty('--r1-font-family', "'Segoe UI', sans-serif");
        if (activeFontStyle) {
            activeFontStyle.remove();
            activeFontStyle = null;
        }
        return;
    }

    const safeFile = cleanFile.replaceAll('\\', '/').split('/').pop();
    const safeFamily = cleanFamily.replaceAll('"', '').replaceAll("'", '');
    const encodedFile = encodeURIComponent(safeFile).replaceAll('%20', ' ');

    if (activeFontStyle) {
        activeFontStyle.remove();
        activeFontStyle = null;
    }

    activeFontStyle = document.createElement('style');
    activeFontStyle.id = 'r1-custom-font-style';
    activeFontStyle.innerHTML = `
        @font-face {
            font-family: '${safeFamily}';
            src: url('fonts/${encodedFile}') format('truetype');
            font-display: swap;
        }
    `;

    document.head.appendChild(activeFontStyle);
    document.documentElement.style.setProperty('--r1-font-family', `'${safeFamily}', 'Segoe UI', sans-serif`);
}
