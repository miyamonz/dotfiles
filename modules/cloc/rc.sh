CLOCKER="gocloc"
cloc-dir() {
    ls -d * | xargs -I% bash -c "$CLOCKER % | grep TOTAL | ( printf '%\t'; awk '{print \$5}')" | sort -rnk 2 | column -t
}
