# Source all files in ~/.config/zsh (excluding ~/.config/zsh/os)
for file in ~/.config/zsh/*.zsh; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# Detect the OS and source the appropriate configuration
OS_TYPE=$(uname)

if [ "$OS_TYPE" = "Darwin" ]; then
    source ~/.config/zsh/os/darwin.zsh
else
    source ~/.config/zsh/os/linux.zsh
fi

