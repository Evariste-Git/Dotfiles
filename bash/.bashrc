#
# ~/.bashrc
#

eval "$(starship init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load all bash config fragments
if [ -d "$HOME/.bashrc.d" ]; then
  for file in "$HOME/.bashrc.d/"*.sh; do
    [ -r "$file" ] && source "$file"
  done
  unset file
fi

alias ls='ls --almost-all --color=auto'
alias grep='grep --color=auto'

# unn is also git alias for status
alias gunn='git status'
alias gdiff='git diff'
alias gcommit='git commit'

PS1='[\u@\h \W]\$ '

# start fastfetch on startup
# fastfetch
