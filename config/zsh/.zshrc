neofetch

autoload -Uz compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
compinit


HISTFILE=$XDG_CACHE_HOME/zsh/.histfile
HISTSIZE=10000
SAVEHIST=1000

bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

autoload -Uz vcs_info
precmd() {
    vcs_info
}
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats ' (%b%u%c)'


setopt prompt_subst
PROMPT='%B'
PROMPT+='%F{blue} %2~'
PROMPT+='%F{yellow}${vcs_info_msg_0_}'
PROMPT+='%F{red} ▶ '
PROMPT+='%b%f'

RPROMPT=''
RPROMPT+='%*'


alias ls='ls -F --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -lA --color=auto'
alias ..='cd ..'

alias grep='grep --color=auto'

alias mv='mv -i'
alias rm='rm -i'

alias yeet='rm -rf'
alias please='sudo $(fc -ln -1)'

alias gs='git status'

alias gl='git log --oneline --graph'
alias gpull='git pull'
alias gpush='git push'
alias gb='git branch'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gco='git checkout'

alias vim=nvim


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null
