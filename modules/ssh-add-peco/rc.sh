_ssh_add_peco() {
    local cur prev cword
    _get_comp_words_by_ref -n : cur prev cword
    if [ "$prev" = "ssh-add" ]; then
        COMPREPLY=$(find ~/.ssh/modules | grep pub | sed s/\.pub$// | peco)
    fi
}
complete -F _ssh_add_peco ssh-add
