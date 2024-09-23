# Dotfiles

TODO: have a script for auto install

## Install

- zsh
- nerd-fonts
- kitty: catpuccin theme
- pyenv (needs tk on arch)
- uv (better package manager for python, also supress needs for pyenv)
- luarocks
- nvm (install yay and then from AUR in arch)
- rust (on arch install rustup with pacman)
- go
- angular
- lazygit
- pipx (python-pipx on arch)
- ripgrep
- fd
- xclip or clipboard: <https://github.com/Slackadays/Clipboard>
  (if using clipboard, need for custom clipboard provider)
  clipboard allows the `cb` command which is very cool
- bob
- starship
- zellij
- tmux and tpm
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
