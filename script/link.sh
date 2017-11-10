#!bash
DOT_DIRECTORY="${HOME}/dotfiles"
DOT_TARBALL="https://github.com/miyamonz/dotfiles/tarball/master"
REMOTE_URL="git@github.com:miyamonz/dotfiles.git"

cd ${DOT_DIRECTORY}

DST_DIRECTORY=${HOME}
for f in vim/.*?? git/.*?? tmux/.*?? ".bashrc" ".inputrc"
do
    ln -snfv ${DOT_DIRECTORY}/${f} ${DST_DIRECTORY}/`basename $f`
done
ln -snfv ${DOT_DIRECTORY}/vim/.vimrc ${DST_DIRECTORY}/.config/nvim/init.vim
echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
