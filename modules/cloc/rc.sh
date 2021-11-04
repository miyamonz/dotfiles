cloc-dir() {
    ls -d * | xargs -I% zsh -c "gocloc % | grep TOTAL | ( printf '%\t'; awk '{print \$5}')" | sort -rnk 2 | column -t
}
