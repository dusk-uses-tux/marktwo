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
