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

PS1='\[\033[31m\]\w\[\033[0m\] ($(git symbolic-ref --short HEAD 2>/dev/null)) \[\e[31m\]/\[\e[0m\] '



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

# rust bin directory
PATH=$PATH:$HOME/.cargo/bin

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
# setfont /usr/share/consolefonts/Lat2-TerminusBold32x16.psf.gz

PROMPT_COMMAND='ls_on_enter'

# When I just press enter, do `ls`
ls_on_enter() {
  cmd_index=$(history 1 |awk '{print $1}')
  # if [[ ${last_cmd_index} =~ ^[0-0+$ ]] && [ "${cmd_index}" -eq "${last_cmd_index}" ]; then
  if [[ "${cmd_index}" -eq "${last_cmd_index}" ]]; then
    ls
  fi
  last_cmd_index=${cmd_index}
}

# vty font (size and font) and color
if [[ $TERM = "linux" ]]; then
  # setfont -h32 /usr/share/kbd/consolefonts/ter-132n.psf.gz
  setvtrgb $HOME/vtty_colors
else
  TERM=xterm-color
fi

# git version dotfiles with a special `config` command that
# eliminates the need for symlinks
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

function .. { cd '..'; }
function ../.. { cd '../..'; }
function ../../.. { cd '../../..'; }
function ../../../.. { cd '../../../..'; }

alias ,ga='git add'
alias ,gs='git status'
alias ,gcm='git commit -m'
alias ,gp='git pull'
alias ,gpush='git push'
alias lg='git lg'
alias ,lg='git lg'
alias ..='cd ..'

# Make rust stuff from rustup part of the $PATH
source "$HOME/.cargo/env"

# Install zoxide via cargo for this to work
# cargo install zoxide
eval "$(zoxide init bash)"

# fzf fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# For local stuff
source $HOME/.local/conf/bashrc
