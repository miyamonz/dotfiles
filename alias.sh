#!/bin/bash
# command aliases
alias l='ls -a -G -F'
alias lsl='ls -a -G -F -l'


if [ "$(uname)" == "Darwin" ]; then
    alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
    alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
    alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"
    alias arduino='/Applications/Arduino.app/Contents/MacOS/Arduino'
fi

alias monochrome='gsed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'

