# Dotfiles ![Build Status](https://github.com/e-dang/dotfiles/actions/workflows/test.yml/badge.svg)

Personal dotfiles repository for automating the setup of my work stations. Uses [chezmoi](https://github.com/twpayne/chezmoi) as a configuration manager. Only has configurations for MacOs and Debian based distros of Linux.

## Installation

### MacOs:

```
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply https://github.com/e-dang/dotfiles
```

If using iTerm2, you must manually import settings in the iTerm2 directory (see the README located there).

### Linux

```
sh -c "$(wget -qO- git.io/chezmoi)" -- init --apply https://github.com/e-dang/dotfiles
```
