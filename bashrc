# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

PS1='$ '

# Local manpages
MANPATH=$MANPATH:$HOME/man

alias l=ls
alias p=vim
#don't keep .core files
ulimit -c 0

# vi editing mode for command line
set -o vi

# version controlled bin directory
PATH=$HOME/platonicbin_public:$PATH

# other version controlled bin directory
PATH=$HOME/platonicbin:$PATH

# local bin directory
PATH=$HOME/bin:$PATH

# pip installed things
PATH=$PATH:$HOME/.local/bin

# Use vim as the default editor (it's nano in ubuntu on windows!)
export EDITOR=/usr/bin/vim

export NVM_DIR="$HOME/.nvm"
# This is very very slow on linux for windows, so just do it by hand
# when you really want to run nvm
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Tab completion for `nvm`
# [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# For combining pdfs
#
#     pdfmerge merged.pdf mine1.pdf mine2.pdf
pdfmerge() { gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=$@ ; }

# For local stuff
source $HOME/.local/conf/bashrc
