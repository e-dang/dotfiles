# Dotfiles [![Build Status](https://travis-ci.com/e-dang/dotfiles.svg?branch=master)](https://travis-ci.com/e-dang/dotfiles)

My personal dotfiles repository for automating the setup of my work stations. This project uses [dotbot](https://github.com/anishathalye/dotbot) to manage linking and installation of most software, where the software is organized into configurations that can be installed individually, and profiles which are made up of one or more configurations.

To install a profile run the following command:

```
./install-profile <profile>
```

To install a single configuration run the following command:

```
./install-standalone <configuration>
```

## Editing

Sourcing order for shell \*.rc files (i.e. zshrc) is as follows:

1. functions
2. plugins/plugins_before
3. path
4. env
5. aliases
6. settings
7. plugins_after

## Updating

To update the Git submodules run

```
git submodule update --remote --merge
```

## Snippets and Inspiration

-   https://github.com/mathiasbynens/dotfiles
-   https://github.com/CoreyMSchafer/dotfiles
-   https://github.com/anishathalye/dotfiles
