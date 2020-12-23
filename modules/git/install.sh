brew install git
brew install bash-git-prompt

DIR="$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)"
ln -snfv "$DIR/gitconfig" "$HOME/.gitconfig"
ln -snfv "$DIR/gitignore_global" "$HOME/.gitignore_global"
