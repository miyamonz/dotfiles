#!/bin/zsh

# fnm の default の node に npm -g で入れた CLI (pi、cosense など) を、どこでも使えるようにする。
# PATH の末尾に足すので、node や npm は fnm が切り替えたものが優先される。
# 固定のバージョンではなく default のエイリアスを指すので、default を変えても追従する。
() {
  local dir="$HOME/Library/Application Support/fnm/aliases/default/bin"
  [[ -d $dir ]] && path+=("$dir")
}
