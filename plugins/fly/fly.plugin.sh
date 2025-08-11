#!/bin/zsh

# https://cli.github.com/manual/gh_completion
if [ ! -f /usr/local/share/zsh/site-functions/_flyctl ]; then
    flyctl completion zsh > /usr/local/share/zsh/site-functions/_flyctl
fi
compdef _flyctl fly