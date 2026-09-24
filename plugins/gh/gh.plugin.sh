#!/bin/zsh

# https://cli.github.com/manual/gh_completion
# 書き込み先のディレクトリが無い Mac（Apple Silicon の brew は /opt/homebrew）では何もしない
if [ -d /usr/local/share/zsh/site-functions ] && [ ! -f /usr/local/share/zsh/site-functions/_gh ]; then
    gh completion -s zsh > /usr/local/share/zsh/site-functions/_gh
fi
