# Source init file with omz config
source ~/.config/zsh/init.zsh

# Detect the OS and source the appropriate configuration
OS_TYPE=$(uname)

# Source util files
for file in ~/.config/zsh/global/*.zsh; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

if [ "$OS_TYPE" = "Darwin" ]; then
    # source ~/.config/zsh/darwin/darwin.zsh
    for file in ~/.config/zsh/darwin/*.zsh; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
    done
else
    # source ~/.config/zsh/os/linux.zsh
    for file in ~/.config/zsh/linux/*.zsh; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
    done
fi
