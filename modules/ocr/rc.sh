#!/bin/bash

# https://doratex.hatenablog.jp/entry/20230629/1687977178


function realpath() {
  f=$@
  if [ -d "$f" ]; then
    base=""
    dir="$f"
  else
    base="/$(basename "$f")"
    dir=$(dirname "$f")
  fi
  dir=$(cd "$dir" && /bin/pwd)
  echo "$dir$base"
}

export PATH=$(realpath)bin:$PATH
