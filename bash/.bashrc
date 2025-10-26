#
# ~/.bashrc
#

eval "$(starship init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# unn is git alias for status
alias unn='git unn'

alias vorkurs='cd ~/Documents/uds/Vorkurs/materials/'
alias vorkurs-pdf='cd ~/Documents/uds/Vorkurs/materials/out/pdf/'

alias comp='cd ~/Documents/uds/CompilerConstruction/regexfe'

PS1='[\u@\h \W]\$ '

# start fastfetch on startup
fastfetch
