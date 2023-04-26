# https://blog.leko.jp/post/more-easy-to-use-npm-scripts/
_git_switch_peco() {
    local cur prev cword
    _get_comp_words_by_ref -n : cur prev cword
    if [ "$prev" = "switch" ]; then
        # COMPREPLY=$(cat package.json | jq -r '.scripts | keys[]' | peco --initial-filter=Fuzzy --query=$cur)
        COMPREPLY=$(anyframe-widget-insert-git-branch)
    fi
}

#complete -F _git_switch_peco git
