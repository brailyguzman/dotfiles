# Source init file with omz config
source ~/.config/zsh/init.zsh

for file in ~/.config/zsh/utils/*.zsh; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
