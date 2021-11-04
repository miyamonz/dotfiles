# https://blog.leko.jp/post/more-easy-to-use-npm-scripts/
_npm_run_peco() {
    local cur prev cword
    _get_comp_words_by_ref -n : cur prev cword
    if [ "$prev" = "run" ] || [ "$prev" = "yarn" ]; then
        # COMPREPLY=$(cat package.json | jq -r '.scripts | keys[]' | peco --initial-filter=Fuzzy --query=$cur)
        COMPREPLY=$(cat package.json | gron | grep -oE "scripts\.[^ ]*" | awk -F'.' '{print $2}' | peco --initial-filter=Fuzzy --query=$cur)
    fi
}

# TODO: install npm scripts completion for zsh

source <(npm completion)