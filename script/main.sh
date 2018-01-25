#!/bin/bash
SCRIPT_DIR=`dirname $0`
DOT_DIRECTORY="${HOME}/dotfiles"
DOT_TARBALL="https://github.com/miyamonz/dotfiles/tarball/master"
REMOTE_URL="git@github.com:miyamonz/dotfiles.git"

has() {
    tyle "$1" > /dev/null 2>&1
}

usage() {
    name=`basename $0`
    cat <<EOF
Usage:
$name [arguments] [command]
Commands:
deploy
Arguments:
-f $(tput setaf 1)** warning **$(tput sgr0) Overwrite dotfiles.
-h Print help (this message)
EOF
    exit 1
}

# オプション -fは上書き、-hはヘルプ表示
while getopts :f:h opt; do
  case ${opt} in
    f)
      OVERWRITE=true
      ;;
    h)
      usage
      ;;
  esac
done
shift $((OPTIND - 1))

# Dotfilesがない、あるいは上書きオプションがあればダウンロード
if [ -n "${OVERWRITE}" -o ! -d ${DOT_DIRECTORY}  ]; then
    echo "Downloading dotfiles..."
    rm -rf ${DOT_DIRECTORY}
    mkdir ${DOT_DIRECTORY}

    if type "git" > /dev/null 2>&1; then
        git clone --recursive "${REMOTE_URL}" "${DOT_DIRECTORY}"
    else
        curl -fsSLo ${HOME}/dotfiles.tar.gz ${DOT_TARBALL}
        tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOT_DIRECTORY}
        rm -f ${HOME}/dotfiles.tar.gz
    fi


    echo $(tput setaf 2)Download dotfiles complete!. ✔︎$(tput sgr0)
fi

link_files() {
    DST_DIRECTORY=${HOME}
    cd ${DOT_DIRECTORY}
    for f in vim/.*?? git/.*?? tmux/.*?? ".bashrc" ".inputrc"
    do
        ln -snfv ${DOT_DIRECTORY}/${f} ${DST_DIRECTORY}/`basename $f`
    done
    echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
}

command=$1
[ $# -gt 0 ] && shift

case $command in
    deploy)
        link_files
        ;;
    *)
        usage
        ;;
esac

exit 0
