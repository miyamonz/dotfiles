#!/bin/zsh

export TERM='xterm-256color'

export DOTFILES_DIR="/Users/miyamonz/dotfiles"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# editor setting
export EDITOR="nvim"
export SEARCHER="rg"

# prevent exit by sending C-d
# IGNOREEOF=200

# emacs keybind
bindkey -e

export PATH="$DOTFILES_DIR/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Nix
# 通常は /etc/zshrc が nix-daemon.sh を読むが、macOSアップデートで
# /etc/zshrc が純正に戻されて消えることがあるため、ここでも読む（多重読込はガードされる）
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# nix の PATH を常に /usr/bin より前に置く
#
# 背景: tmux や Claude Code の中などでシェルがもう一段起動すると、
# 親の PATH を継承した状態で /etc/zprofile の path_helper が走り、
# /usr/bin などのシステムパスが先頭に並べ直される。
# 一方 nix-daemon.sh は「PATH に nix が既にある」と判断して何もしないので、
# nix が /usr/bin より後ろに沈んだままになる（例: git が Apple Git に化ける）。
# 対策: 毎回ここで nix を先頭に置き直し、typeset -U で重複を消す（先頭優先）。
if [ -e "$HOME/.nix-profile/bin" ]; then
  path=("$HOME/.nix-profile/bin" /nix/var/nix/profiles/default/bin $path)
fi
typeset -U path

# nix で入れたコマンドの補完 (share/zsh/site-functions) を fpath に足す。
# nix-daemon.sh は fpath を触らない（NixOS や nix-darwin では zsh のモジュールが足している）。
# NIX_PROFILES は default、ユーザーの順なので、後に足すユーザー側が前に来る。
for p in ${(z)NIX_PROFILES}; do
  [[ -d $p/share/zsh/site-functions ]] && fpath=($p/share/zsh/site-functions $fpath)
done
unset p

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
      sheldon source > $sheldon_cache
    fi
    source "$sheldon_cache"
    unset cache_dir sheldon_cache sheldon_toml
}


# Added by Antigravity
export PATH="/Users/miyamonz/.antigravity/antigravity/bin:$PATH"


# Vite+ bin (https://viteplus.dev)
[[ -r "$HOME/.vite-plus/env" ]] && . "$HOME/.vite-plus/env"

# moonbit
export PATH="$HOME/.moon/bin:$PATH"

# tunr (dev checkout)
export PATH="/Users/miyamonz/ghq/github.com/moeki0/tunr:$PATH"
