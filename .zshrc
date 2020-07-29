neofetch

autoload -Uz compinit
zstyle ':completion:*' menu select
compinit


HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v


autoload -Uz vcs_info
precmd() {
    vcs_info
}
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats ' (%u%b%c)'


setopt prompt_subst
PROMPT='%B'
PROMPT+='%F{red}%n'
PROMPT+='%F{white}@'
PROMPT+='%F{green}%M'
PROMPT+='%F{white}:'
PROMPT+='%F{yellow}%1~'
PROMPT+='%F{blue}${vcs_info_msg_0_}'
PROMPT+='%F{white}% $'
PROMPT+='%b%f '

source $HOME/dotfiles/alias.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null