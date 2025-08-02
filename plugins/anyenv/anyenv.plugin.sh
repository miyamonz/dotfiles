# anyenv install --init

export ANYENV_ROOT=$XDG_CONFIG_HOME/anyenv
export ANYENV_DEFINITION_ROOT="${ANYENV_ROOT}/anyenv-install"

if type anyenv > /dev/null; then
  export PATH="${ANYENV_ROOT}/bin:${PATH}"
  eval "$(anyenv init - --no-rehash)"
fi