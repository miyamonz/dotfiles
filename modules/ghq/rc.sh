cat-repo() {
    find $(ghq root --all | xargs echo) -mindepth 3 -maxdepth 3 "$@"
}

# see https://github.com/mollifier/anyframe/blob/master/anyframe-functions/sources/anyframe-source-ghq-repository
alias r=anyframe-widget-cd-ghq-repository
# フォルダの中身の更新日時もみたい
alias rr='move-recent-repo'
