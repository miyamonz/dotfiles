#!/bin/zsh

# cache-eval <cmd> <args...>
#   コマンドの出力をキャッシュファイルに保存し、そのパスを REPLY に入れる。
#   使い方: cache-eval atuin init zsh && source $REPLY
#
# 呼び出し側のトップレベルで source する。関数の中で source すると、
# 出力の中の setopt や local が関数の中に閉じてしまうため（smartcache を使わない理由）。
# 出力が毎回同じで、コマンドライン引数だけで決まるものにだけ使う。
# シェルごとに変わる出力（fnm env など）や、環境で変わる出力（brew shellenv など）には使わない。
#
# コマンドの実体パスが変わったとき（nix や brew の更新）か、実体の mtime が
# キャッシュより新しいとき（同じパスへの上書きインストール）に作り直す。
# それ以外で作り直したいときは rm -r ~/.cache/cache-eval
cache-eval() {
  local dir=${XDG_CACHE_HOME:-$HOME/.cache}/cache-eval bin=${commands[$1]:A} line
  REPLY=$dir/${(j:_:)${@//[^[:alnum:]]/-}}.zsh
  [[ -n $bin ]] || return 1
  [[ -r $REPLY ]] && read -r line < $REPLY
  if [[ $line != "# $bin" || $bin -nt $REPLY ]]; then
    mkdir -p $dir
    { print -r -- "# $bin"; "$@" } >| $REPLY && zcompile $REPLY
  fi
}
