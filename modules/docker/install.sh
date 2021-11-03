if IS_WSL; then
    # completion
    curl \
    -L https://raw.githubusercontent.com/docker/compose/1.29.1/contrib/completion/bash/docker-compose \
    -o $BREW_PREFIX/etc/bash_completion.d/docker-compose

    curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker \
        -o $BREW_PREFIX/etc/bash_completion.d/docker.sh
fi
