# alias
alias c="clear"
alias gcl="git clone"
alias gp="git push"
alias gc="git add . && git commit -m"
alias gst="git status"
alias gi="git status --ignored"
alias lg="lazygit"
alias ..="cd .."
alias ...="cd .. && cd .."
alias nv="nvim"
alias ls="ls -a"
alias tma="tmux attach"
alias tml="tmux ls"
alias tmk="tmux kill-server"
alias tm="tmux"
alias pl="pip list"
alias p="python"
alias sv="source venv/bin/activate"
alias pi="pip install"
alias pv="python -m venv venv"
alias pf="pip freeze > requirements.txt"
alias ff="ls | grep -i"

# pkg-config setup
export PKG_CONFIG_PATH=/opt/homebrew/lib/pkgconfig:$PKG_CONFIG_PATH

# flutter stuff
export PATH="$HOME/dev/flutter/bin:$PATH"

# firebase stuff
export PATH="$PATH":"$HOME/.pub-cache/bin"

# ruby stuff
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# python stuff
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/Users/dallasgere/.ghcup/env" ] && . "/Users/dallasgere/.ghcup/env" # ghcup-env

# prompt stuff
# autoload -Uz vcs_info
# precmd() { vcs_info }
# zstyle ':vcs_info:git:*' formats '%b '
# setopt PROMPT_SUBST
# PROMPT='%F{green}%~%f %F{blue}${vcs_info_msg_0_}%f$ '
# Catppuccin Mocha ZSH Prompt Configuration
# Add this to your ~/.zshrc file

# Catppuccin Mocha ZSH Prompt Configuration
# Add this to your ~/.zshrc file

# Enable prompt substitution
setopt PROMPT_SUBST

# Catppuccin Mocha Color Palette
typeset -A catppuccin_mocha
catppuccin_mocha=(
    rosewater "#f5e0dc"
    flamingo  "#f2cdcd"
    pink      "#f5c2e7"
    mauve     "#cba6f7"
    red       "#f38ba8"
    maroon    "#eba0ac"
    peach     "#fab387"
    yellow    "#f9e2af"
    green     "#a6e3a1"
    teal      "#94e2d5"
    sky       "#89dceb"
    sapphire  "#74c7ec"
    blue      "#89b4fa"
    lavender  "#b4befe"
    text      "#cdd6f4"
    subtext1  "#bac2de"
    subtext0  "#a6adc8"
    overlay2  "#9399b2"
    overlay1  "#7f849c"
    overlay0  "#6c7086"
    surface2  "#585b70"
    surface1  "#45475a"
    surface0  "#313244"
    base      "#1e1e2e"
    mantle    "#181825"
    crust     "#11111b"
)

# Helper function to wrap text in color
catppuccin_color() {
    echo "%F{$catppuccin_mocha[$1]}$2%f"
}

# Git status function
git_prompt_info() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        local git_status=""
        
        # Check for uncommitted changes
        if ! git diff --quiet 2>/dev/null; then
            git_status+="$(catppuccin_color yellow " ●")"
        fi
        
        # Check for staged changes
        if ! git diff --cached --quiet 2>/dev/null; then
            git_status+="$(catppuccin_color green " ●")"
        fi
        
        # Check for untracked files
        if [[ -n $(git ls-files --others --exclude-standard 2>/dev/null) ]]; then
            git_status+="$(catppuccin_color red " ●")"
        fi
        
        # Check if ahead/behind remote
        local ahead_behind=$(git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null)
        if [[ -n $ahead_behind ]]; then
            local ahead=$(echo $ahead_behind | cut -f1)
            local behind=$(echo $ahead_behind | cut -f2)
            [[ $ahead -gt 0 ]] && git_status+="$(catppuccin_color sky "↑")"
            [[ $behind -gt 0 ]] && git_status+="$(catppuccin_color pink "↓")"
        fi
        
        echo " $(catppuccin_color mauve "")$(catppuccin_color lavender "$branch")$git_status"
    fi
}

# Directory path with home shortening
prompt_dir() {
    local dir=${PWD/#$HOME/~}
    echo "$(catppuccin_color blue "$dir")"
}

# Username and hostname (only show hostname if SSH)
prompt_user() {
    local user_color="green"
    [[ $EUID -eq 0 ]] && user_color="red"  # Red for root
    
    local user_host="$(catppuccin_color $user_color "%n")"
    [[ -n $SSH_CONNECTION ]] && user_host+="$(catppuccin_color subtext0 "@")$(catppuccin_color teal "%m")"
    
    echo "$user_host"
}

# Exit code indicator
prompt_status() {
    echo "%(?.$(catppuccin_color green "❯").$(catppuccin_color red "❯"))"
}

# Python virtual environment
prompt_venv() {
    [[ -n $VIRTUAL_ENV ]] && echo " $(catppuccin_color peach "")"
}

# Node.js version (if using nvm/node)
prompt_node() {
    if command -v node >/dev/null 2>&1 && [[ -f package.json ]]; then
        local node_version=$(node --version 2>/dev/null | sed 's/v//')
        echo " $(catppuccin_color green "")$(catppuccin_color subtext1 "$node_version")"
    fi
}

# Main prompt construction
PROMPT='
$(catppuccin_color surface2 "╭─") $(prompt_user) $(catppuccin_color subtext0 "in") $(prompt_dir)$(git_prompt_info)$(prompt_venv)$(prompt_node)
$(catppuccin_color surface2 "╰─")$(prompt_status) '

# Right-side prompt with timestamp
RPROMPT='$(catppuccin_color overlay0 "%D{%H:%M:%S}")'

# Optional: Add a newline before each prompt for better readability
precmd() {
    print ""
}

# Auto-completion styling to match theme
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
