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

# prompt stuff
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{yellow}%~%f %F{magenta}${vcs_info_msg_0_}%f$ '

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
