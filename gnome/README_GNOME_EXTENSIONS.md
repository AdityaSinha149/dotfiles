# GNOME Extensions Setup

This guide explains how to restore all your GNOME Shell extensions.

## 1. Install Extensions from list

Install each extension listed in `gnome-extensions.txt`:

```bash
xargs -a ~/dotfiles/gnome/gnome-extensions.txt -n 1 gnome-extensions install
```

Notes:
- You may need `gnome-extensions` CLI (provided by GNOME).
- If an extension is already installed, the command will skip or update it.

## 2. Enable Extensions

Enable all installed extensions:

```bash
for ext in $(gnome-extensions list); do
  gnome-extensions enable "$ext" || true
done
```

## 3. Notes

- The list of extensions is saved in `gnome-extensions.txt`.
- Make sure GNOME and dependencies are installed before running these commands.
- Extension settings are automatically restored if `dconf load` was used when restoring GNOME settings.
