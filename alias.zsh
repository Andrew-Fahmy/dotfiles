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
# alias gpushsu='git push --set-upstream '
alias gb='git branch'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -am'

alias @@='source ~/.zshrc'
alias vim=nvim

alias rr='bash ~/dotfiles/roll.sh'

export EDITOR=nvim
export PAGER=less
export BROWSER=firefox
