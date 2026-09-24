#!/bin/zsh

# Add deno completions to search path
if [[ ":$FPATH:" != *":$HOME/completions:"* ]]; then export FPATH="$HOME/completions:$FPATH"; fi

[[ -r "$HOME/.deno/env" ]] && . "$HOME/.deno/env"
