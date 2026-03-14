# Configurations and Dotfiles

## Setup

Install TPM (Tmux Package Manager)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Clone Config and Setup Symlinks

```bash
git clone https://github.com/PARthuu/dotfiles.git ~/.config/dotfiles
ln -s ~/.config/dotfiles/nvim ~/.config/nvim
ln -s ~/.config/dotfiles/tmux.conf ~/.tmux.conf
```
