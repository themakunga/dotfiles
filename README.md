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


**linux**


```bash
sudo apt install stow

```

**macOS**

```bash
brew install stow
```

#### Fuzzy Finder (FZF)

It's an interactive filter program for any kind of list; files, command history, processes, hostnames, bookmarks, git commits, etc. It implements a "fuzzy" matching algorithm, so you can quickly type in patterns with omitted characters and still get the results you want.

[documentation](https://github.com/junegunn/fzf)

**macOS**

```bash
brew install fzf
```

**linux**

_debian install by default version 0.38_

```bash
sudo apt install fzf
```
