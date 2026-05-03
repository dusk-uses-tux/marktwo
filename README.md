# marktwo

> dotfiles, refined.

<p align="center">
  <img src="https://raw.githubusercontent.com/dusk-uses-tux/marktwo/refs/heads/main/screenshot.png" width="500"/>
</p>

## Features

- Optional **Dynamic theming** via Matugen — generates a expressive color palette from your wallpaper
- **Niri** — scrollable-tiling Wayland compositor
- **Waybar** — highly customizable status bar
- **Alacritty** — GPU-accelerated terminal
- **SwayNC** — notification daemon
- **Wofi** — application launcher
- **Fastfetch** — system info display
- **Firefox** — userChrome styling included

## Dependencies

| Tool | Purpose |
|------|---------|
| [niri](https://github.com/niri-wm/niri) | Window manager |
| [waybar](https://github.com/Alexays/Waybar) | Status bar |
| [alacritty](https://github.com/alacritty/alacritty) | Terminal emulator |
| [swaync](https://github.com/ErikReider/SwayNotificationCenter) | Notifications |
| [wofi](https://hg.sr.ht/~scoopta/wofi) | App launcher |
| [matugen](https://github.com/InioX/matugen) | Color generation |
| [fastfetch](https://github.com/fastfetch-cli/fastfetch) | System info |

## Installation

```sh
git clone https://github.com/dusk-uses-tux/marktwo.git
cd marktwo
```

Then copy the files into place:

```sh
# Config files → ~/.config
cp -r dots/* ~/.config/

# Root files → ~/
cp userChrome.css ~/
```

> **Note:** Place `userChrome.css` in your Firefox profile's `chrome/` directory to apply the browser styling.

## Structure

```
marktwo/
├── dots/
│   ├── alacritty/      # Terminal config + colors
│   ├── fastfetch/      # System info + ASCII art
│   ├── matugen/        # Theme generation + templates
│   ├── niri/           # Window manager config
│   ├── swaync/         # Notification styling
│   ├── waybar/         # Status bar config + styles
│   └── wofi/           # Launcher config + styles
├── userChrome.css      # Firefox UI styling
└── screenshot.png
```

## Post-install

1. Set a wallpaper
2. Enable Firefox userChrome:
   - Navigate to `about:config`
   - Set `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`
   - Create `chrome/` directory in your Firefox profile and place `userChrome.css` inside
```
