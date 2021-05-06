_ps1_result() {
    local code=$?

    # printfには\[\]使わない
    local WHITE="\e[00m"
    local BLUE="\e[34m"
    local RED="\e[31m"

    local DATE="${WHITE}$(date +%Y-%m-%d_%H:%M:%S)"
    if [[ ${code} == 0 ]]; then
        local kao="(っ'ω')っ"
        printf "${BLUE}${kao} OK!!  [${code}] ${DATE}"
    else
        local kao='(´・ω・`)'
        printf "${RED}${kao} NG... [${code}] ${DATE}"
    fi
    echo ;
}
export PROMPT_COMMAND="_ps1_result${PROMPT_COMMAND:+;$PROMPT_COMMAND}"

WHITE="\[\e[00m\]"
GREEN="\[\e[32m\]"
BLUE="\[\e[34m\]"
RED="\[\e[31m\]"
# miyamonz@pcname:path (git)$
PS_USER="${WHITE}\u"
PS_DIR="${GREEN}\w"
PS_GIT="${RED}\$(__git_ps1)"
export PS1="${PS_USER}: ${PS_DIR}${PS_GIT}${WHITE} \n\$ "
