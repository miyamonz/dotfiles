# anyenv install --init
# ~/.config/anyenv/anyenv-install が存在しないとき　あとgit clone の-yもほしい
if type anyenv > /dev/null; then
  eval "$(anyenv init - --no-rehash)"
fi