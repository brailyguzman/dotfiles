# Brew
alias update="brew update"
alias upgrade="brew upgrade"
alias cleanup="brew cleanup"
alias dump="brew bundle dump --casks --taps --brews --describe --force"
alias uucd="update && upgrade && cleanup && dump" # U: Update | U: Upgrade | C: Cleanup | D: Dump

# Neovim
alias vi="nvim"
alias vim="nvim"

# Scripts
alias brain="python3 ~/scripts/brain/main.py"

# Eza (ls replacement)
alias ls="eza --icons --group --header --grid --sort=type"
alias ll="eza --long --icons --group --header --sort=size"
alias lt="eza --tree --level=2 --icons"
alias la="eza --all --icons --group --header"

# Misc
alias reload="source ~/.zshrc"
alias playground="cd ~/Developer/Playground"
alias lg="lazygit"
alias cat="bat --paging=never"
alias tree="tree -C"
alias mkdir="mkdir -p"
alias rm="rm -i"
