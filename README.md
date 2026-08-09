# Dotfiles

TODO: have a script for auto install

## Install

- cmake
- nerd-fonts
- kitty: catpuccin theme (use kitten themes)
- uv then uv install --default then uv python update-shell
- luarocks
- mise 
- rust (on arch install rustup with pacman then rustup toolchain install stable)
- go
- npm and node (use mise to get multiple versions)
- angular
- lazygit
- ripgrep
- fd
- xclip or wl-clipboard
- bob
- starship
- zellij
- tmux and tpm
- herdr
- bat and eza
- obsidian: `https://obsidian.md/`
- syncthing: `https://syncthing.net/`
- config nvim

## Remaps

- to update /etc/X11/xorg.conf.d/00-keyboard.conf:
  `localectl set-x11-keymap us '' '' caps:escape`
  check the list of options in /usr/share/X11/xkb/rules/base.lst
- There are better ways but i want to rename the key next to left shift so i add the
  following to `usr/share/X11/xkb/symbols/us` file, in the basic sections:
  `key <LSGT>  { [ backslash,        bar,          backslash,    bar ] };`
- Alternatively, use the correct keyboard layout directly

## Find default program to open files

- `/usr/share/applications/mimeinfo.cache`
- overwritten in `~/.config/mimeapps.list`
