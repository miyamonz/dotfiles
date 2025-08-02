if IS_WSL; then
    alias powershell="/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
    alias open="powershell /c start"
fi

# WSL内からVSCodeを開くときに使う
if IS_WSL; then
    export PATH="/mnt/c/Users/miyamonz/AppData/Local/Programs/Microsoft VS Code/bin:$PATH"
fi
