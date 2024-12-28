# OMZ Setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"
set -o vi
