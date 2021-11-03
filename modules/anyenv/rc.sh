# anyenv install --init
# ~/.config/anyenv/anyenv-install が存在しないとき　あとgit clone の-yもほしい
if type anyenv > /dev/null; then
  znap eval anyenv "$(anyenv init - --no-rehash)"
fi