# vim: set ft=sh
# alias paste="curl -F 'f:1=<-' ix.io"
alias cats='highlight -O ansi'
alias cc="clang -Wall -Wextra -pedantic -std=c99 -Wshadow -Weverything"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls='ls --color=tty  --sort=extension --group-directories-first'
alias pupdate='sudo pacman -Syu'
alias qr_gen="qrencode -t ansi -o-"
# alias sudo="sudo --askpass"
alias top='htop'
alias vim="nvim"
alias weather='curl -4 http://wttr.in/Koeln'

# For zsh-abbrev-alias (https://github.com/momo-lab/zsh-abbrev-alias)
abbrev-alias --init

# "Regular" aliases, get only expanded at the beginning of line
abbrev-alias m="neomutt"
abbrev-alias o="xdg-open"
abbrev-alias q="exit"
abbrev-alias snvim="sudo -E nvim"
abbrev-alias v="nvim"
abbrev-alias y="yay"

# Global aliases, get expaned everywhere
abbrev-alias -g G="| grep -i"
abbrev-alias -g P="| ix"



if command -v exa &> /dev/null 
then

alias ls='exa --group-directories-first'                                                          # ls
alias l='exa -lbF --git --group-directories-first'                                                # list, size, type, git
alias ll='exa -lbGF --git --group-directories-first'                                             # long list
alias llm='exa -lbGd --git --sort=modified --group-directories-first'                            # long list, modified date sort
alias la='exa -lbhHigmuSa --time-style=long-iso --git --color-scale --group-directories-first'  # all list
alias lx='exa -lbhHigmuSa@ --time-style=long-iso --git --color-scale --group-directories-first' # all + extended list
alias lt='exa --tree --level=2 --group-directories-first'                                         # tree

fi
