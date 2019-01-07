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

TERM=xterm-color
#Set the time zone.
TZ=EST5EDT

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

# Paul's discovery
alias rsynccopy="rsync --partial --progress --append --rsh=ssh -r -h "
alias rsyncmove="rsync --partial --progress --append --rsh=ssh -r -h --remove-sent-files"

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

alias m=mutt

# Filesystem bookmarks with tab completion
# Altered from http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=$HOME/.marks
function jump {
  cd -P "$MARKPATH/$1" 2>/dev/null
  pwd
}
alias j=jump
function mark {
  mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
  rm -i "$MARKPATH/$1"
}
function marks {
  ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' |sed '/./,$!d'
}

complete -W "$(find $MARKPATH -type l -printf "%f\n")" jump
complete -W "$(find $MARKPATH -type l -printf "%f\n")" j

# Set vtty font to this big one
setfont /usr/share/consolefonts/Lat2-TerminusBold32x16.psf.gz


# For local stuff
source $HOME/.local/conf/bashrc
