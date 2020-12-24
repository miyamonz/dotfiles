if grep -q microsoft /proc/version; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
