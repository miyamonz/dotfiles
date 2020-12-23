ghq-list() {
    find $(ghq root --all | xargs echo) -d 3 -maxdepth 3 | grep -v DS_Store  | sed -e "s#$(echo ~)/##g"
}

move-repo() {
    cd ~/$(ghq-list | peco)
}

alias r='move-repo'
