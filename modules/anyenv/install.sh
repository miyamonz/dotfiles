brew install anyenv
anyenv install --init

# for pyenv
if [ "$(uname)" == "Linux" ]; then
    sudo apt-get install gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev libffi-dev
fi
