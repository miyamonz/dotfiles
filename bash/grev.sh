# agで検索した結果から選択し、ファイルを開く https://qiita.com/umanoda/items/d55cf51a4bbf2bda7e03
# 名前はgrep + vim でgrevにした
function grev(){
  path=$($SEARCHER $* | peco | awk -F: '{printf  $1 " +" $2}'| sed -e 's/\+$//')
  if [ -n "$path" ]; then
    echo "$EDITOR $path"
    $EDITOR $path
  fi  
}
