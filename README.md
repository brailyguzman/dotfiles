# Braily's Dotfiles

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
