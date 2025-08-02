#!/bin/zsh

source $HOME/.local/share/../bin/env
export PATH="$(uv tool dir --bin):${PATH}"
# eval "$(uv generate-shell-completion zsh)"
# eval "$(uvx generate-shell-completion zsh)"
