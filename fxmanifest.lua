fx_version 'cerulean'
game 'gta5'

author 'R1 Scripts'
description 'R1_TEXTUI - Modern Text UI system for FiveM'
version '1.0.0'

lua54 'yes'

shared_scripts {
    'shared/config.lua'
}

client_scripts {
    'client.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/fonts/*.ttf',
    'html/fonts/*.otf',
    'html/fonts/*.woff',
    'html/fonts/*.woff2'
}
