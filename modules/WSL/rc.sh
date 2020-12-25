if grep -q microsoft /proc/version; then
    alias powershell="/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
    alias open="powershell /c start"
fi
