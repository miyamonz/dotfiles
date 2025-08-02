# bun completions

# https://github.com/oven-sh/bun/issues/1272#issuecomment-1941669512
# make sure you execute this *after* asdf or other version managers are loaded

# bun completions are strange: running `bun completions` installs ~/.bun/_bun and does not output the completion source code
# this is a hack until bun fixes their completion setup https://github.com/oven-sh/bun/issues/1272
if (( $+commands[bun] )); then
  [ -s ~/.bun/_bun ] || bun completions
  # cannot source directly, must add fpath to completions
  fpath+=~/.bun/
fi

# bun
export BUN_INSTALL="/Users/miyamonz/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
