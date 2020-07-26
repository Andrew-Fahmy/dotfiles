#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -lA'
alias ..='cd ..'

alias grep='grep --color=auto'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias gs='git status'


export EDITOR=vim


bold=$(tput bold)
reset=$(tput sgr0)
black=$(tput setaf 0)
blue=$(tput setaf 39)
cyan=$(tput setaf 44)
green=$(tput setaf 82)
orange=$(tput setaf 166)
purple=$(tput setaf 129)
red=$(tput setaf 160)
violet=$(tput setaf 61)
white=$(tput setaf 15)
yellow=$(tput setaf 226)

if [[ "${USER}" == "root" ]]
then
    user_color="${red}"
else
    user_color="${orange}"
fi

GIT_PS1_SHOWDIRTYSTATE=1
source $(dirname BASH_SOURCE[0])/git-prompt.sh

PS1="\[\033]0\W\007\]"
PS1+='\[${bold}\]'
PS1+='\[${user_color}\]\u'
PS1+='\[${white}\]@'
PS1+='\[${green}\]\h'
PS1+='\[${white}\]:'
PS1+='\[${violet}\]\W'
PS1+='\[${blue}\]$(__git_ps1 "(%s)")'
PS1+='\[${white}\]$ '
PS1+='\[${reset}\]'
export PS1