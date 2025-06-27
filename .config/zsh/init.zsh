# OMZ Setup
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

OS_TYPE=$(uname)

if [ "$OS_TYPE" = "Darwin" ]; then
  # macOS-specific configurations
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/local/share/zsh-autopair/autopair.zsh

  export GOPATH=$HOME/go
  export GOROOT=/usr/local/opt/go/libexec
  export PATH=$PATH:$GOPATH/bin
  export PATH=$PATH:$GOROOT/bin
else
  # Linux-specific configurations
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /home/linuxbrew/.linuxbrew/share/zsh-autopair/autopair.zsh
fi

fastfetch
