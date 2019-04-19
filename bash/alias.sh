#!bin/bash
# command aliases
alias ls='ls -a -G -F'
alias lsl='ls -a -G -F -l'


if [ $(uname) == "Darwin" ]; then
    alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
    alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
    alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"
fi

# git
alias g='git'
alias gti='git'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gr='g gr'

#vim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

alias arduino='/Applications/Arduino.app/Contents/MacOS/Arduino'

function ghq-list() {
    find $(ghq root --all | xargs echo) -d 3 -maxdepth 3 | grep -v DS_Store  | sed -e "s#$(echo ~)/##g"
}
alias r='cd ~/$(ghq-list | peco)'

alias monochrome='gsed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'

function gocloc-dir() {
    ls -d * | xargs -I% bash -c "gocloc % | grep TOTAL | ( printf '%\t'; awk '{print \$5}')" | sort -rnk 2 | column -t
}

function git-root() {
    cd $(git rev-parse --show-toplevel)
}
