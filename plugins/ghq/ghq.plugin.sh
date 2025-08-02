cat-repo() {
    find $(ghq root --all | xargs echo) -mindepth 3 -maxdepth 3 "$@"
}
move-recent-repo() {
    cd ~/$(cat-repo -printf "%T@ %p\n" | sed "s#$(echo ~/)##g" | sort -nr | cut -d ' ' -f2 | peco)
}
ghq-list() {
    cat-repo | sed "s#$(echo ~/)##g"
}

move-repo() {
    cd ~/$(ghq-list | peco)
}

alias r='move-repo'
# フォルダの中身の更新日時もみたい
alias rr='move-recent-repo'
