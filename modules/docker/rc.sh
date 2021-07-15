if [ -f $BREW_PREFIX/etc/bash_completion.d/docker-compose ]; then
    . $BREW_PREFIX/etc/bash_completion.d/docker-compose
fi
if [ -f $BREW_PREFIX/etc/bash_completion.d/docker.sh ]; then
    . $BREW_PREFIX/etc/bash_completion.d/docker.sh
fi
