# GNOME Settings Setup

Restore all GNOME desktop settings such as themes, keybindings, fonts, and workspace configuration.

## 1. Install GNOME and dependencies

### Debian / Ubuntu

```bash
sudo apt update
sudo apt install -y gnome-shell gnome-shell-extensions gnome-extensions-app dconf-cli
```

### Fedora

```bash
sudo dnf install -y gnome-shell gnome-extensions-app dconf
```

## 2. Restore Settings

Import all settings from the exported dconf dump:

```bash
dconf load / < ~/dotfiles/gnome/gnome-settings.dconf
```

## 3. Notes

- This restores general GNOME settings as well as extension settings stored in dconf.
- Some settings may not apply if the GNOME version differs from the one used to export.
- You can make a backup with: `dconf dump / > ~/dotfiles/gnome/gnome-settings.dconf`.
