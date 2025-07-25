#
# ~/.bashrc
#

eval "$(starship init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias np='cd ~/Documents/uds/ConcurrentProgramming/np-ss25-project-7055284-7056979/'
PS1='[\u@\h \W]\$ '

# start fastfetch on startup
fastfetch
