export LANG=ja_JP.UTF-8
export TERM='xterm-256color'


# read man file with vim
export MANPAGER="col -b -x|nvim -R -c 'set ft=man nolist nomod noma' -"

# editor setting
export EDITOR="$(brew --prefix)/bin/nvim"
export SEARCHER="rg"

# prevent exit by sending C-d 
IGNOREEOF=200

source_if_exists() { 
	if [[ -f "$1" ]]; then
		source "$1"
	else
		echo "$1 does not exist."
	fi
}

source $HOME/dotfiles/alias.sh
source $HOME/dotfiles/rc.sh
source $HOME/dotfiles/addpath.sh

export PATH="$HOME/dotfiles/bin:$PATH" 

