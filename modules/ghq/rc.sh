ghq-list() {
    find $(ghq root --all | xargs echo) -maxdepth 3 | sed "s#$(echo ~/)##g"
}

move-repo() {
    cd ~/$(ghq-list | peco)
}

alias r='move-repo'
