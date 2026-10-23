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

# eMudhra中間証明書の秘密鍵が復元可能だった問題（2026/10）のつなぎ
# Nix の nss-cacert には問題のルート証明書が残っているので、Homebrew の更新済みバンドルを読ませる。
# nix-daemon.sh が NIX_SSL_CERT_FILE を設定するので、その後に書く
# SSL_CERT_FILE は設定しない。Rust 製ツールには、これがあると rustls-platform-verifier による macOS の検証をやめ、
# rustls-webpki で自前に検証するものがある。rustls-webpki 0.103.16 未満は、Apple のブロックが効かず問題の証明書を受け入れる
# nixpkgs の各パッケージの修正版が出揃ったら消す
# https://scrapbox.io/Nota/eMudhra中間証明書の秘密鍵が復元可能だった問題（2026%2F10）_開発ツール使う人が対応すべきこと
if [ -e /opt/homebrew/etc/ca-certificates/cert.pem ]; then
  export NIX_SSL_CERT_FILE=/opt/homebrew/etc/ca-certificates/cert.pem
  # awscli2 と google-cloud-sdk は NIX_SSL_CERT_FILE を読まず、同梱のバンドルを使うので個別に指定する
  export AWS_CA_BUNDLE=$NIX_SSL_CERT_FILE
  export CLOUDSDK_CORE_CUSTOM_CA_CERTS_FILE=$NIX_SSL_CERT_FILE
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
