#!/bin/zsh

export TERM='xterm-256color'

DIR=${0:A:h}
export DOTFILES_DIR="$DIR"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# editor setting
export EDITOR="$HOMEBREW_PREFIX/bin/nvim"
export SEARCHER="rg"

# prevent exit by sending C-d
# IGNOREEOF=200

# emacs keybind
bindkey -e

export PATH="~/dotfiles/bin:$PATH"

function ensure_zcompiled() {
  local src="$1"
  local zwc="${src}.zwc"
  # zwc が無い or 元ファイルのほうが新しい場合だけ zcompile する
  if [[ ! -r "$zwc" || "$src" -nt "$zwc" ]]; then
    echo "\033[1;36mCompiling\033[m $1"
    zcompile "$src"
  fi
}
ensure_zcompiled ~/.zshrc

# sheldon
export SHELDON_CONFIG_DIR="$DOTFILES_DIR/sheldon"
{
    # project://sheldon/plugins.toml
    # eval "$(/opt/homebrew/bin/sheldon source)" #をやらずに、cacheをする
    cache_dir=${XDG_CACHE_HOME:-$HOME/.cache}
    sheldon_cache="$cache_dir/sheldon.cache.zsh"
    sheldon_toml="$SHELDON_CONFIG_DIR/plugins.toml"
    # キャッシュがない、またはキャッシュが古い場合にキャッシュを作成
    if [[ ! -r "$sheldon_cache" || "$sheldon_toml" -nt "$sheldon_cache" ]]; then
      echo "\033[1;36mCompiling\033[m $sheldon_cache"
      mkdir -p $cache_dir
      /opt/homebrew/bin/sheldon source > $sheldon_cache
    fi
    source "$sheldon_cache"
    unset cache_dir sheldon_cache sheldon_toml
}



alias claude="/Users/miyamonz/.claude/local/claude"
