# R1_TextUI

**R1_TextUI** is a custom TextUI system for FiveM with a modern NUI design, smooth animations, multiple positions, FontAwesome icons and simple usage through exports or events.

Created by **R1 Scripts**.

<img width="992" height="222" alt="image" src="https://github.com/user-attachments/assets/e4f44feb-9e19-48c7-a308-47da4c98eb77" />

---

## Features

- Modern NUI TextUI
- Smooth animations
- Multiple positions
- FontAwesome icons
- Custom colors
- Custom styles
- Single action TextUI
- Multiple actions in one TextUI
- Easy exports
- Client events
- No framework required

---

## Installation

1. Place `R1_TextUI` inside your `resources` folder.
2. Rename folder `R1_TextUI-main` to `R1_TextUI` if you downloaded it from GitHub.
3. Add this to your `server.cfg`:

```cfg
ensure R1_TextUI
```

---

## Usage

Client Export
```
exports['R1_TextUI']:ShowTextUI({
    position = 'top-center',
    style = 'tactical',
    actions = {
        {
            key = 'E',
            text = 'Interact',
            icon = 'fa-solid fa-hand-pointer',
            color = '#22c55e'
        }
    }
})
```

Client Event
```
TriggerEvent('R1_TextUI:client:Show', {
    position = 'top-center',
    style = 'tactical',
    actions = {
        {
            key = 'E',
            text = 'Interact',
            icon = 'fa-solid fa-hand-pointer',
            color = '#22c55e'
        }
    }
})
```

---

Hide Event
```
⟡ Multiple Actions Example
exports['R1_TextUI']:ShowTextUI({
    position = 'top-center',
    style = 'tactical',
    actions = {
        {
            key = 'G',
            text = 'Throw money',
            icon = 'fa-solid fa-money-bill-wave',
            color = '#22c55e'
        },
        {
            key = 'X',
            text = 'Cancel',
            icon = 'fa-solid fa-xmark',
            color = '#ef4444'
        }
    }
})

⟡ Example of an action
exports['R1_TextUI']:ShowTextUI({
    position = 'top-center',
    style = 'tactical',
    actions = {
        {
            key = 'G',
            text = 'Throw money',
            icon = 'fa-solid fa-money-bill-wave',
            color = '#22c55e'
        }
    }
})
```

--- 

Credits

Developed By R1 SCRIPTS: https://r1-scripts.tebex.io/
