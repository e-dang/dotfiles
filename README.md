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

### Update

If you made changes to your local state and want to apply them locally run:

```
chezmoi apply -v
```

To view the changes that chezmoi will make run either:

```
chezmoi apply -v -n
```

OR

```
chezmoi diff
```

If you want to apply changes that are stored in the remote git repository to your local machine run:

```
chezmoi update -v
```

## Notes

- eslintrc.js is not a global config. It is included for the cpjs function defined in .shell/functions.sh.
- .prettierrc.js is a global config, but also used for cpjs function.
- Need to change default shell to homebrew zsh

  - Add "\<path to homebrew zsh\>" to "/etc/shells" file

    ```
    sudo vim /etc/shells
    ```

  - Change to default login shell

    ```
    chsh -s <path to homebrew zsh>

    ```

  - Make sure new version of Zsh is in active

    ```
    echo $SHELL (should see path to homebrew zsh)
    echo $ZSH_VERSION (should see homebrew zsh version)
    ```

  - Support homebrew completion with the command (below is example of path on Apple Silicon install)
    ```
    ln -s /opt/homebrew/completions/zsh/_brew ~/.cache/zsh/completions/_brew
    ```
