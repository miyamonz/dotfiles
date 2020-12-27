if IS_MAC; then
    brew install deno
fi

if IS_WSL; then
    curl -fsSL https://deno.land/x/install/install.sh | sh
fi
