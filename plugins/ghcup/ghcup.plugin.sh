
if [ -f "$HOME/.ghcup/env" ]; then
    ensure_zcompiled "$HOME/.ghcup/env"
    source "$HOME/.ghcup/env"
fi