#!/bin/zsh

# read man file with vim
export MANPAGER="/bin/sh -c -c \"col -b -x | $EDITOR -R -c 'set ft=man nolist nomod noma' -\""