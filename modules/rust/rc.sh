if [[ -d $HOME/.cargo/bin ]]; then
  source $HOME/.cargo/env
fi

if type rustup > /dev/null; then
  # TODO: this shows error
  # eval "$(rustup completions zsh)"
fi