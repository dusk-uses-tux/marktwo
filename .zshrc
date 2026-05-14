# ---------------------------------
# Options
# ---------------------------------
setopt prompt_subst
setopt append_history
setopt share_history
setopt auto_menu

# ---------------------------------
# History
# ---------------------------------
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$HOME/.zsh_history"

# ---------------------------------
# PATH
# ---------------------------------
path=(
    "$HOME/.cargo/bin"
    "$HOME/.opencode/bin"
    $path
)

# ---------------------------------
# Icons
# ---------------------------------
typeset -A ICONS

ICONS=(
    "~"              ""
    ".config"        ""
    ".cache"         "󰃨"
    ".mozilla"       ""
    ".npm"           ""
    ".minecraft"     "󰍳"

    "Desktop"        ""
    "Documents"      "󰈙"
    "Downloads"      "󰉍"
    "Music"          "󰝚"
    "Pictures"       "󰉏"
    "Videos"         "󰕧"
    "Projects"       "󰲋"
    "Games"          "󰊗"
    "Notes"          "󱞎"
    "Work"           "󰖷"

    "bin"            ""
    "etc"            ""
    "lib"            "󰯂"
    "tmp"            "󰪺"
    "var"            "󰀼"
)

# ---------------------------------
# Path formatter
# ---------------------------------
path_with_icons() {
    local path="${PWD/#$HOME/~}"
    local parts result="" icon

    local IFS='/'
    parts=(${=path})

    for part in "${parts[@]}"; do
        [[ -z "$part" ]] && continue

        icon="${ICONS[$part]}"

        if [[ -n "$icon" ]]; then
            result+="$icon "
        else
            result+="$part "
        fi

        result+="/ "
    done

    print -r -- "${result% / }"
}

# ---------------------------------
# Prompt
# ---------------------------------
PROMPT='
[  ][ %* ][ $(path_with_icons) ]
$ '

# ---------------------------------
# Completion
# ---------------------------------
autoload -Uz compinit
compinit

fpath=(
    ~/.zsh/zsh-completions
    $fpath
)

# ---------------------------------
# Plugins
# install manually once, not here
# ---------------------------------
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---------------------------------
# Aliases
# ---------------------------------
alias ys='yay -S'
alias ff='fastfetch'
alias pf='pfetch'
alias gc='git clone'

alias ls='eza --icons'
alias l='eza --icons'

alias clock='tty-clock -c -C 7 -t -B'

# ---------------------------------
# Keybinds
# ---------------------------------
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

# ---------------------------------
# Startup
# ---------------------------------
clear
pfetch
setopt prompt_subst
# icon mapping
typeset -A ICONS
ICONS=(
".config" ""
"Documents" "󰏢"
"Downloads" ""
"Desktop" ""
"Pictures" ""
"Music" ""
"Videos" ""
"Templates" ""
"Public" ""
"Projects" ""
"Archives" ""
"Games" ""
".cache" ""
".mozilla" ""
".npm" ""
".local/share" ""
"Projects" ""
"Work" ""
"Games" ""
"Notes" ""
"/"                ""      # root
"bin"             ""      # binaries
"sbin"            ""      # system binaries
"usr"             ""      # user stuff
"usr/bin"         ""
"usr/sbin"        ""
"usr/local"       ""
"etc"             ""      # configs
"var"             ""      # logs/data
"var/log"         ""
"var/tmp"         ""
"tmp"             ""
"home"            ""
"Documents" ""
"Music"    ""
"Videos"   ""
"Pictures" ""
"lib"             ""      # libraries
"lib64"           ""
"opt"             ""      # optional apps
"mnt"             ""      # mounts
"media"           ""
"srv"             ""      # services
"dev"             ""      # devices
"proc"            ""      # process info
"sys"             ""      # sys info
".minecraft" "󰍳"
)

# build path with icons
path_with_icons() {
  local path="${PWD/#$HOME/~}" segments=() seg out=() result
  IFS='/' read -r -A segments <<< "$path"

  for seg in "${segments[@]}"; do
    [[ -z "$seg" ]] && continue
    out+=("${ICONS[$seg]:-$seg}")
  done

  # join manually with slashes
  result=""
  for seg in "${out[@]}"; do
    [[ -n "$result" ]] && result+="/"
    result+="$seg"
  done

  echo "$result"
}

# actual prompt
PROMPT='[  ][ %* ][ $(path_with_icons) ]
$ '

# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt append_history   # add new commands instead of overwriting
setopt share_history    # share history across terminals

# Autocomplete
autoload -Uz compinit
compinit
setopt AUTO_MENU

# -----------------------------
# Plugins (clone once if missing)
# -----------------------------
[[ ! -d ~/.zsh/zsh-autosuggestions ]] && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
[[ ! -d ~/.zsh/zsh-syntax-highlighting ]] && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
[[ ! -d ~/.zsh/zsh-completions ]] && \
    git clone https://github.com/zsh-users/zsh-completions ~/.zsh/zsh-completions

# Source plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(~/.zsh/zsh-completions $fpath)

# -----------------------------
# Aliases
# -----------------------------
alias ys='yay -S'
alias ff='fastfetch'
alias pf='pfetch'
alias clock='tty-clock -c -C 7 -t -B'
alias gc='git clone'
alias ls='eza --icons'
alias l='eza --icons'
# -----------------------------
# Clear terminal on startup
# -----------------------------
clear
pfetch
