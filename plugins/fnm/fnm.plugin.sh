#!/bin/zsh

# 出力にシェルごとの multishell パスが入るのでキャッシュしてはいけない
eval "$(fnm env --use-on-cd --shell zsh)"
