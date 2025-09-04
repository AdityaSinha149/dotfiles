# Zsh Setup

This guide explains how to set up Zsh with my custom configuration.

## 1. Symlink the .zshrc

Make a symbolic link to use the `.zshrc` in this repository:

```bash
#zsh
sudo apt/dnf install zsh

#oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

ln -sfn ~/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc
```

## 2. Requirements

- Linux
## 3. Notes

- All aliases, functions, and prompt customizations are in `.zshrc`.
- Editing `.zshrc` in the dotfiles repo automatically updates your shell.
