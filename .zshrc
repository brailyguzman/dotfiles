# Source init file with omz config
source ~/.config/zsh/init.zsh

# Detect the OS and source the appropriate configuration
OS_TYPE=$(uname)

if [ "$OS_TYPE" = "Darwin" ]; then
    source ~/.config/zsh/os/darwin.zsh
else
    source ~/.config/zsh/os/linux.zsh
fi

# Source util files
for file in ~/.config/zsh/utils/*.zsh; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
