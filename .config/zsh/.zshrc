fastfetch

autoload -Uz compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
setopt nocaseglob
compinit

HISTFILE=$XDG_CACHE_HOME/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:git:*' formats '%F{white}on %F{red}%b (%u%c) '

autoload -Uz vcs_info
autoload -Uz edit-command-line;



function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]]; then
        echo -ne '\e[2 q'
    else
        echo -ne '\e[6 q'
    fi
}


zle -N edit-command-line
zle -N zle-keymap-select

bindkey -v
bindkey '^e' edit-command-line
bindkey -v '^?' backward-delete-char
export KEYTIMEOUT=1


_fix_cursor() {
    echo -ne '\e[6 q'
}
_vcs_info() {
    vcs_info
}

precmd_functions+=(_fix_cursor)
precmd_functions+=(_vcs_info)


setopt prompt_subst
PROMPT='%B'
PROMPT+='%F{blue} %2~ '
PROMPT+='${vcs_info_msg_0_}'
PROMPT+='%F{white}%# '

PROMPT+='%b%f'


RPROMPT=''
RPROMPT+='%*'


alias ls='ls -F --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -lA --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .......='cd ../../../../..'

alias grep='grep --color=auto'
alias diff='diff --color=auto'

alias mv='mv -i'
alias rm='rm -i'

alias yeet='rm -rf'
alias please='sudo $(fc -ln -1)'

alias gs='git status'
alias gd='git diff'

alias gl='git log --oneline --graph'
alias gpull='git pull'
alias gpush='git push'

alias gb='git branch'
alias gco='git checkout'
alias gcb=git-change-branch

alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -am'

alias vim='nvim'
alias xclip='xclip -sel clip'

alias t='$XDG_CONFIG_HOME/tmux/default.sh'
alias install='dnf list | fzf -m | awk "{print $1}"'


function git-change-branch {
    if git rev-parse; then
        git branch -a | fzf --height 50% --reverse | xargs git checkout
    fi
}


typeset -U path
path+=$HOME/.local/bin
path+=$HOME/.npm-global/bin

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  2> /dev/null
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null
source /usr/share/fzf/shell/key-bindings.zsh 2> /dev/null

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
