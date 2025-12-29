#!/bin/zsh

# cloc-dir() {
#    ls -d * | xargs -I% zsh -c "gocloc % | grep TOTAL | ( printf '%\t'; awk '{print \$5}')" | sort -rnk 2 | column -t
# }
cloc-dir() {
    fd -d 1 --type d --color never | \
    xargs -I% zsh -c "scc --no-cocomo % | grep '^Total' | ( printf '%\t'; awk '{print \$5}')" | \
    sort -rnk 2 | column -t
}
