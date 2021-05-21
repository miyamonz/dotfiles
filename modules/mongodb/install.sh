if IS_WSL; then
    wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

    (
    . /etc/os-release
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu ${VERSION_CODENAME}/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

    )

    sudo apt-get update
    sudo apt-get install -y mongodb-org
fi
