#!/bin/zsh

# https://cli.github.com/manual/gh_completion
if [ ! -f /usr/local/share/zsh/site-functions/_gh ]; then
    gh completion -s zsh > /usr/local/share/zsh/site-functions/_gh
fi
