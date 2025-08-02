export CARGO_HOME="$XDG_DATA_HOME"/cargo
if [[ -d $CARGO_HOME ]]; then
  source $CARGO_HOME/env
fi

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
if type rustup > /dev/null; then
  # TODO: this shows error
  # eval "$(rustup completions zsh)"
fi