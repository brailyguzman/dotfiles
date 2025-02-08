# Braily's Dotfiles

## WSL/Linux Setup

This is a WSL/Linux Setup script for setting up a fresh created instance with the tools and settings I use.

### Download WSL Setup Script
```bash
curl -o ~/setup/setup_wsl.sh https://raw.githubusercontent.com/brailyguzman/dotfiles/refs/heads/main/scripts/setup/setup_wsl.sh
```

### Give the script permissions

```bash
chmod +x ~/setup/setup_wsl.sh
```

### Execute the script
```bash
~/.setup/setup_wsl.sh
```

## Stow
Once this repository is cloned and is on `~/dotfiles`
Run the following command to set up GNU Stow.

`stow ~/dotfiles`

If you already have a .zshrc file, run the following command to create a backup of the old file.
```
mv ~/.zshrc ~/.zshrc.bak
```
And now, we can run the following command:
`stow ~/dotfiles`

## TMUX

### ~ Install TPM (Tmux Plugin Manager)

1. Run the following command to install TPM
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

2. Run `ctrl + a + I` which will set up TPM and install plugins
