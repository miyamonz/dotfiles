if [[ -f $HOME/.cargo/env ]]; then
  source $HOME/.cargo/env
fi

if type rustup > /dev/null; then
  eval "$(rustup completions $(basename $SHELL))"
fi
