local isOpen = false

local function ValidatePosition(position)
    if position and Config.Positions[position] then
        return position
    end

    return Config.DefaultPosition
end

local function ValidateStyle(style)
    if style and Config.Styles[style] then
        return style
    end

    return Config.DefaultStyle
end

local function ShowTextUI(data)
    if type(data) ~= 'table' then return end

    local position = ValidatePosition(data.position)
    local style = ValidateStyle(data.style)
    local styleData = Config.Styles[style]

    isOpen = true

    SendNUIMessage({
        action = 'show',
        title = data.title or 'INTERACCIÓN',
        subtitle = data.subtitle or '',
        icon = data.icon or 'fa-solid fa-circle-info',
        position = position,
        style = style,
        mainColor = data.color or styleData.mainColor or Config.DefaultColor,
        actions = data.actions or {
            {
                key = 'E',
                text = 'Interactuar',
                icon = 'fa-solid fa-hand-pointer',
                color = data.color or styleData.mainColor or Config.DefaultColor
            }
        }
    })
end

local function HideTextUI()
    if not isOpen then return end

    isOpen = false

    SendNUIMessage({
        action = 'hide'
    })
end

exports('ShowTextUI', ShowTextUI)
exports('HideTextUI', HideTextUI)

RegisterNetEvent('R1_TEXTUI:client:Show', function(data)
    ShowTextUI(data)
end)

RegisterNetEvent('R1_TEXTUI:client:Hide', function()
    HideTextUI()
end)

RegisterCommand('r1textuitest', function()
    ShowTextUI({
        position = 'center-left',
        style = 'red',
        title = 'R SCRIPTS',
        subtitle = 'Sistema de interacción avanzado',
        icon = 'fa-solid fa-bolt',
        actions = {
            {
                key = 'E',
                text = 'Tirar billetes',
                icon = 'fa-solid fa-money-bill-wave',
                color = '#00ff88'
            }
        }
    })

    SetTimeout(7000, function()
        HideTextUI()
    end)
end)