# My Dotfiles

My personal Linux desktop configuration.

Built around a lightweight Wayland setup with **Niri**, **Waybar**, **Wofi**, **SwayNC**, and dynamic theming through **Matugen**. The goal is a clean, responsive desktop that stays relatively close to upstream applications while still feeling cohesive.

## Preview

<p align="center">
  <img src="https://raw.githubusercontent.com/dusk-uses-tux/marktwo/refs/heads/main/screenshot.png" width="600"/>
</p>

## Components

| Component | Purpose                  |
| --------- | ------------------------ |
| Niri      | Wayland compositor       |
| Waybar    | Status bars              |
| Wofi      | Application launcher     |
| SwayNC    | Notification center      |
| Alacritty | Terminal emulator        |
| Zellij    | Terminal multiplexer     |
| Pfetch/Fastfetch | System information       |
| adw-gtk   | Application theming      |
| Matugen   | Dynamic color generation |

## Features

* Dynamic color scheme generation using Matugen
* Matching GTK, Waybar, Wofi, SwayNC and terminal colors
* Dual Waybar configuration
* Custom Fastfetch configuration
* Firefox userChrome tweaks
* Minimal Wayland-focused setup

## Installation

Clone the repository:

```bash
git clone https://github.com/dusk-uses-tux/marktwo/
cd marktwo
```

Copy the contents of `dots/` into your configuration directory:

```bash
cp -r dots/* ~/.config/
```

Install the required applications through your distribution's package manager.

## Structure

```text
dots/
├── alacritty/
├── fastfetch/
├── gtk-3.0/
├── gtk-4.0/
├── matugen/
├── niri/
├── swaync/
├── waybar/
├── wofi/
└── zellij/
```

Additional files:

```text
userChrome.css        Firefox customization
reload-mark.desktop   Utility desktop entry
dump.txt              Miscellaneous notes/assets
```

## Theming

Colors are generated through Matugen templates and propagated to:

* GTK
* Waybar
* Wofi
* SwayNC
* Alacritty

## Notes

These dotfiles are tailored to my workflow and hardware. Feel free to copy ideas, steal snippets, or modify anything for your own setup.
