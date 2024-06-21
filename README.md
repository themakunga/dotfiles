# Dotfiles 

This repo works as a config backup to my shell environment and neovim configuration, this is for my use only but if you like it feel free to use it, if you have any suggestion, raise a issue

## Terminal environment

### Pre-requisites


#### Homebrew (if you are using macOS)

Homebrew installs the stuff you need that Apple (or your Linux system) didn’t.

[documentation](https://brew.sh)

**macOS**

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


#### STOW


GNU Stow is a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place. For example, /usr/local/bin could contain symlinks to files within /usr/local/stow/emacs/bin, /usr/local/stow/perl/bin etc., and likewise recursively for any other subdirectories such as .../share, .../man, and so on.


[documentation](https://www.gnu.org/software/stow/)


**linux:**


```bash
sudo apt install stow

```


