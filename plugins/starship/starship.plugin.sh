#!/bin/zsh

DIR=${0:A:h}
export STARSHIP_CONFIG="$DIR/config.toml"

(( $+commands[starship] )) || return

# init の出力をキャッシュする（起動のたびの starship の実行を省く）。
# smartcache は関数の中で source するため、init の setopt promptsubst が戻ってしまうので使わない。
# init の PROMPT2="$(starship prompt --continuation)" は source のたびに starship を実行するので、
# 作成時に一度だけ計算した値に置き換える。
# nix の starship は mtime が 1970 年で更新を判定できないので、1行目に記録した
# リンク先の実体パスが変わったとき、または config.toml が更新されたときに作り直す。
() {
  local cache=${XDG_CACHE_HOME:-$HOME/.cache}/starship-init.zsh bin=${commands[starship]:A} line
  local -a init
  [[ -r $cache ]] && read -r line < $cache
  if [[ $line != "# $bin" || $STARSHIP_CONFIG -nt $cache ]]; then
    init=("${(@f)$(starship init zsh --print-full-init)}")
    {
      print -r -- "# $bin"
      print -rl -- "${(@)init:#PROMPT2=*}"
      print -r -- "PROMPT2=${(q)$(starship prompt --continuation)}"
    } >| $cache
  fi
}
source ${XDG_CACHE_HOME:-$HOME/.cache}/starship-init.zsh

# right_format を設定していないので右プロンプトは常に空。描画のたびのプロセス起動を省く。
# 今は後で読む zsh-defer が RPS1= で消しているが、その挙動に頼らないよう明示する
RPROMPT=''
