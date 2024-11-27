# OMZ Setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Make neovim the default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Aliases for nvim
alias vi="nvim"
alias vim="nvim"

# Useful
alias reload="source ~/.zshrc"

# Detect the OS
OS_TYPE=$(uname)

if [ "$OS_TYPE" = "Darwin" ]; then
    # macOS-specific configurations
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    # node
    export PATH="/usr/local/opt/node@22/bin:$PATH"

    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    # Linux-specific configurations
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    export NVM_DIR="$HOME/.nvm"
    [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

    source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
