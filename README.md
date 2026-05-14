# marktwo

> dotfiles
, refined.

A minimal, sharp-edged Linux desktop built on [Niri](https://github.com/YaLTeR/niri)
<p align="center">
  <img src="https://raw.githubusercontent.com/dusk-uses-tux/marktwo/refs/heads/main/screenshot.png" width="600"/>
</p>

---

## ✦ Features

- **Dynamic theming** — Matugen extracts a Material You palette from your wallpaper and propagates it across the entire stack: terminal, bar, launcher, and notifications
- **Niri** — scrollable-tiling Wayland compositor with spring-based animations
- **Waybar** — minimal status bar with workspaces, clock, volume, CPU, memory, and battery; includes a secondary side taskbar
- **Alacritty** — GPU-accelerated terminal, themed automatically on wallpaper change
- **SwayNC** — notification daemon with control center, volume/backlight sliders, MPRIS widget, and quick-toggle grid
- **Wofi** — slim left-aligned application launcher
- **Firefox** — custom userChrome: RTL tab strip, tab hover shift animation, ripple-on-hover
- **Zsh** — icon-decorated path prompt, autosuggestions, syntax highlighting, eza integration
- **Hyprlock** — lock screen themed to match the active wallpaper

---

## ✦ Design Philosophy

- **No rounded corners.** Anywhere. Everything is squared off.
- **Keyboard-driven.** Every action has a keybind. The mouse is optional.

---

## ✦ Dependencies

### Core

| Tool | Purpose |
|------|---------|
| [pfetch](https://github.com/dylanaraps/pfetch) | Smaller info display |
| [niri](https://github.com/YaLTeR/niri) | Window manager |
| [waybar](https://github.com/Alexays/Waybar) | Status bar |
| [alacritty](https://github.com/alacritty/alacritty) | Terminal emulator |
| [swaync](https://github.com/ErikReider/SwayNotificationCenter) | Notifications |
| [wofi](https://hg.sr.ht/~scoopta/wofi) | App launcher |
| [matugen](https://github.com/InioX/matugen) | Dynamic color generation |
| [awww](https://codeberg.org/LGFae/awww) | Wallpaper daemon |
| [hyprlock](https://github.com/hyprwm/hyprlock) | Screen lock |
| [eza](https://github.com/eza-community/eza) | `ls` replacement with icons |

### System & Audio

| Tool | Purpose |
|------|---------|
| [pipewire](https://pipewire.org/) + wireplumber | Audio/video framework |
| [playerctl](https://github.com/altdesktop/playerctl) | Media key control |
| [brightnessctl](https://github.com/Hummer12007/brightnessctl) | Backlight control |
| [wpctl](https://gitlab.freedesktop.org/pipewire/wireplumber) | PipeWire volume CLI |
| [nwg-bar](https://github.com/nwg-piotr/nwg-bar) | Power/session menu |
| [btop](https://github.com/aristocratos/btop) | System monitor |

### Shell

| Tool | Purpose |
|------|---------|
| [zsh](https://www.zsh.org/) | Shell |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Inline command suggestions |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | Real-time syntax colors |

### Fonts

| Font | Usage |
|------|-------|
| [GoMono Nerd Font](https://www.nerdfonts.com/) | Primary UI font — bar, terminal, notifications |
---

## ✦ Keybinds

> Modifier key: `Super` (Mod)

### Launchers

| Bind | Action |
|------|--------|
| `Mod+T` | Open terminal |
| `Mod+Q` | Open Firefox |
| `Alt+Space` | Wofi |
| `Mod+E` | Nautilus file manager |
| `Mod+X` | Emoji picker |
| `Mod+L` | Lock screen |
| `Mod+Escape` | Power menu |
| `Mod+N` | Toggle notification center |

### Windows & Columns

| Bind | Action |
|------|--------|
| `Mod+W` | Close window |
| `Mod+F` | Maximize column |
| `Mod+Shift+F` | Fullscreen |
| `Mod+C` | Center column |
| `Mod+V` | Toggle floating |
| `Mod+D` | Cycle column width preset |
| `Mod+Comma` | Consume into column |
| `Mod+Period` | Expel from column |
| `Mod+Minus` / `Equal` | Shrink / grow column width |
| `Mod+Shift+Minus` / `Equal` | Shrink / grow window height |
| `Mod+BracketLeft` / `Right` | Consume / expel window left/right |

### Navigation

| Bind | Action |
|------|--------|
| `Mod+←↓↑→` | Focus column / window |
| `Mod+Ctrl+←↓↑→` | Move column / window |
| `Mod+1–9` | Focus workspace |
| `Mod+Ctrl+1–9` | Move column to workspace |
| `Mod+PageUp/Down` | Switch workspace |
| `Mod+Ctrl+PageUp/Down` | Move column to adjacent workspace |
| `Mod+Home` / `End` | Focus first / last column |
| `Mod+Tab` | Focus previous workspace |
| `Mod+O` | Toggle overview |

### Monitors

| Bind | Action |
|------|--------|
| `Mod+Shift+←↑↓→` | Focus monitor |
| `Mod+Shift+Ctrl+←↑↓→` | Move column to monitor |

### Media & System

| Bind | Action |
|------|--------|
| `Volume keys` | Volume ±10% |
| `Mute key` | Toggle mute |
| `Mic mute key` | Toggle microphone |
| `Brightness keys` | Backlight ±10% |
| `Play / Pause / Next / Prev` | Media playback |
| `Mod+Shift+S` | Screenshot |

---

## ✦ Theming

Matugen generates Material You colors from the current wallpaper and writes them to:

| Output | Consumed by |
|--------|-------------|
| `~/.config/alacritty/colors.toml` | Alacritty |
| `~/.config/waybar/colors.css` | Waybar |
| `~/.config/wofi/colors.css` | Wofi |
| `~/.config/swaync/colors.css` | SwayNC |

All templates live in `dots/matugen/templates/`. Edit them to remap which Material color tokens go where. Unused templates for Kitty, Hyprland, GTK4, and Qt5/6 are included but commented out in `dots/matugen/config.toml`.

---

## ✦ Installation

```sh
git clone https://github.com/dusk-uses-tux/marktwo.git
cd marktwo
```

Copy everything into place:

```sh
# App configs → ~/.config
cp -r dots/* ~/.config/

# Shell & startup → ~/
cp .zshrc ~/
cp .waybarrc ~/

# Firefox userChrome → see post-install
```

---

## ✦ File Structure

```
marktwo/
├── .waybarrc                          # Waybar startup script (main + side bar)
├── .zshrc                             # Shell config, prompt, aliases, plugins
├── userChrome.css                     # Firefox UI styling
├── screenshot.png
└── dots/
    ├── alacritty/
    │   ├── alacritty.toml             # Terminal config
    │   └── colors.toml                # Generated colors (auto-managed)
    ├── fastfetch/
    │   ├── config.jsonc               # System info layout
    │   └── ascii/alpine.txt           # Alpine ASCII art
    ├── matugen/
    │   ├── config.toml                # Matugen settings & template paths
    │   └── templates/
    │       ├── alacritty.toml         # Terminal color template
    │       ├── colors.conf            # Generic RGB color template
    │       ├── colors.scss            # SCSS color template
    │       ├── gtk-colors.css         # GTK/Waybar/SwayNC/Wofi color template
    │       ├── hyprlock.conf          # Lock screen color template
    │       ├── kitty.conf             # Kitty color template (unused)
    │       └── qt-colors.conf         # Qt color template (unused)
    ├── niri/
    │   └── config.kdl                 # Window manager config & keybinds
    ├── swaync/
    │   ├── config.json                # Notification center config
    │   ├── style.css                  # Notification styling
    │   └── colors.css                 # Generated colors (auto-managed)
    ├── waybar/
    │   ├── config.jsonc               # Top bar modules
    │   ├── configbottom.jsonc         # Side taskbar modules
    │   ├── style.css                  # Top bar styling
    │   ├── stylebottom.css            # Side taskbar styling
    │   └── colors.css                 # Generated colors (auto-managed)
    └── wofi/
        ├── config                     # Launcher config
        ├── style.css                  # Launcher styling
        └── colors.css                 # Generated colors (auto-managed)
```

---

## ✦ Post-Install

1. **Set a wallpaper** — use `matugen image <path>`
2. **Firefox userChrome:**
   - Go to `about:config` and set `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`
   - Find your [profile directory](https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data) (`about:support` → Profile Folder)
   - Create a `chrome/` folder inside it and place `userChrome.css` there
3. **Zsh plugins** — clone into `~/.zsh/`:
   ```sh
   git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
   ```
4. **Install fonts** — download [GoMono Nerd Font](https://www.nerdfonts.com/font-downloads), [Cousine Nerd Font](https://www.nerdfonts.com/font-downloads), and [Rubik](https://fonts.google.com/specimen/Rubik)
5. **Make waybar script executable** — `chmod +x ~/.waybarrc`

---

## ✦ License

Do whatever you want with it ig idk
