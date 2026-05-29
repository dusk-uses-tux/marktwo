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
%* $(path_with_icons)
> '

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
alias ff='fastfetch'
alias pf='pfetch'
alias gc='git clone'
alias ,/='zsh '
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
echo
pfetch
