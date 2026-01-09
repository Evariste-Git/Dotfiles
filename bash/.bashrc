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

alias dots='cd $HOME/Dotfiles'

alias nv='nvim'

alias lg='lazygit'
# unn is also git alias for status
alias unn='git status'
alias gd='git diff'
alias gc='git commit'

PS1='[\u@\h \W]\$ '

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# start fastfetch on startup
# fastfetch
