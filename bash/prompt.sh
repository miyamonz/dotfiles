function _ps1_result() {
    # printfには\[\]使わない
    local BLUE="\e[34m"
    local RED="\e[31m"
    local code=$?
    if [[ ${code} == 0 ]]; then
        local kao="(っ'ω')っ"
        printf "${BLUE}${kao} OK!!  [${code}]"
    else
        local kao='(´・ω・`)'
        printf "${RED}${kao} NG... [${code}]"
    fi
    echo ;
}
export PROMPT_COMMAND="_ps1_result"

WHITE="\[\e[00m\]"
GREEN="\[\e[32m\]"
BLUE="\[\e[34m\]"
RED="\[\e[31m\]"
# miyamonz@pcname:path (git)$
PS_USER="${GREEN}\u@\h"
PS_DIR="${BLUE}\w"
PS_GIT="${RED}\$(__git_ps1)"
export PS1="${PS_USER}${WHITE}:${PS_DIR}${PS_GIT}${WHITE}\$ "
