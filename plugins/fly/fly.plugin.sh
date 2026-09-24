#!/bin/zsh

# https://cli.github.com/manual/gh_completion
(( $+commands[flyctl] )) || return
if [ -d /usr/local/share/zsh/site-functions ] && [ ! -f /usr/local/share/zsh/site-functions/_flyctl ]; then
    flyctl completion zsh > /usr/local/share/zsh/site-functions/_flyctl
fi
compdef _flyctl fly