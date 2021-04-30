if [ -f $(brew --prefix)/etc/bash_completion.d/docker-compose ]; then
    . $(brew --prefix)/etc/bash_completion.d/docker-compose
fi
if [ -f $(brew --prefix)/etc/bash_completion.d/docker.sh ]; then
    . $(brew --prefix)/etc/bash_completion.d/docker.sh
fi
