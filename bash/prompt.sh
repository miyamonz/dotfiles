WHITE="\[\e[00m\]"
GREEN="\[\e[32m\]"
BLUE="\[\e[34m\]"
RED="\[\e[31m\]"

function _ps1_result() {
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

PS_USER="${GREEN}\u@\h"
PS_DIR="${BLUE}\w"
PS_GIT="${RED}\$(__git_ps1)"
export PROMPT_COMMAND="_ps1_result"
export PS1="${PS_USER}${WHITE}:${PS_DIR}${PS_GIT}${WHITE}\$ "
