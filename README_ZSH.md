# Zsh Setup

This guide explains how to set up Zsh with my custom configuration.

## 1. Symlink the .zshrc

Make a symbolic link to use the `.zshrc` in this repository:

```bash
ln -sfn ~/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc
```

## 2. Requirements

- Zsh
- Optional: Oh My Zsh for themes and plugins

## 3. Notes

- All aliases, functions, and prompt customizations are in `.zshrc`.
- Editing `.zshrc` in the dotfiles repo automatically updates your shell.
