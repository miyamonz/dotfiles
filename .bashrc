export LANG=ja_JP.UTF-8
export TERM='xterm-256color'


# read man file with vim
export MANPAGER="col -b -x|nvim -R -c 'set ft=man nolist nomod noma' -"

# editor setting
export EDITOR="/usr/local/bin/nvim"
export SEARCHER="ag"

export PATH="$HOME/dotfiles/bin:$PATH" 

function error() { echo "$@" 1>&2; }
function abort() { echo "$@" 1>&2; exit 1; }

# command aliases
source $HOME/dotfiles/bash/alias.sh
source $HOME/dotfiles/bash/git.sh
source $HOME/dotfiles/bash/npm-run-peco.sh
source $HOME/dotfiles/bash/prompt.sh
source $HOME/dotfiles/bash/grev.sh
source $HOME/dotfiles/bash/peco-func.sh

#completion
source $HOME/dotfiles/tmux/tmux.completion.bash
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
# ghq get sjorek/composer-bash-completion
export COMPOSER_COMPLETION_PHP_SCRIPT=$(ghq root)/github.com/sjorek/composer-bash-completion/composer-completion.php
source $(ghq root)/github.com/sjorek/composer-bash-completion/composer-completion.bash

# press ctrl-d 3times to exit
IGNOREEOF=200

# anyenv
eval "$(anyenv init - --no-rehash)"

# direnv
eval "$(direnv hook bash)"

# brew install z
. /usr/local/etc/profile.d/z.sh

#go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

#rust
source $HOME/.cargo/env

#composer
export PATH="$PATH:~/.composer/vendor/bin"
#Neovim true color support
export NVIM_TUI_ENABLE_TRUE_COLOR=1
#Neovim cursor shape support
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

shopt -s extglob
# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/miyamonz/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

export ANDROID_HOME="/Users/miyamonz/Library/Android/sdk"
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/ndk-bundle
export PATH="/usr/local/opt/qt/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
