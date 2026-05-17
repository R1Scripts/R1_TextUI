Config = {}

Config.DefaultPosition = 'center-left'

Config.DefaultStyle = 'tactical'

Config.DefaultColor = '#ff003c'

-- Fuente personalizada para la NUI.
-- Debe existir dentro de html/fonts/ y puede ser .ttf, .otf, .woff o .woff2.
-- Si lo dejas en nil o '', usará Segoe UI.
Config.FontFile = 'STRIGER.ttf'
Config.FontFamily = 'R1CustomFont'

Config.Positions = {
    ['top-left'] = true,
    ['top-center'] = true,
    ['top-right'] = true,
    ['center-left'] = true,
    ['center-right'] = true,
    ['bottom-left'] = true,
    ['bottom-center'] = true,
    ['bottom-right'] = true
}

Config.Styles = {
    ['red'] = {
        mainColor = '#ff003c',
        background = 'dark',
        border = true,
        glow = true
    },

    ['blue'] = {
        mainColor = '#00aaff',
        background = 'blue',
        border = true,
        glow = false
    },

    ['purple'] = {
        mainColor = '#b266ff',
        background = 'purple',
        border = true,
        glow = true
    },

    ['gold'] = {
        mainColor = '#ffb300',
        background = 'gold',
        border = true,
        glow = true
    }
}
