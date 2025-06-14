# OMZ Setup
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-autopair
)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

fastfetch
