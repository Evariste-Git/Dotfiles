#
# ~/.bashrc
#

eval "$(starship init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# unn is also git alias for status
alias unn='git status'
alias diff='git diff'
alias commit='git commit'

PS1='[\u@\h \W]\$ '

# start fastfetch on startup
fastfetch
