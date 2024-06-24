# Dotfiles

[[toc]]

This repo works as a config backup to my shell environment and neovim configuration, this is for my use only but if you like it feel free to use it, if you have any suggestion, raise a issue

as linux I only use Debian so thats how the scripts will be

## Instalation

make sure to complete the [Pre-requisites](README#Pre-requisites) , using a true color terminal emulator like wezterm or iTerm2, you can clone the repository and run `stow` in the dotfiles dir

```bash
git clone https://github.com/themakunga/dotfiles .dotfiles # this clone the repo to a hidden directory
cd .dotfiles
stow .
```

you will need to relogin to the session several times, 3 aproximatelly if you test `neovim` right after install stow.

## Pre-requisites

### GIT

Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

[documentation](https://git-scm.com)

**macOS**

```bash
brew install git
```

**linux**

```bash
sudo apt install git
```

### Homebrew (if you are using macOS)

Homebrew installs the stuff you need that Apple (or your Linux system) didn’t.

[documentation](https://brew.sh)

**macOS**

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### NVM and nodeJS

nvm is a version manager for node.js, designed to be installed per-user, and invoked per-shell. nvm works on any POSIX-compliant shell (sh, dash, ksh, zsh, bash), in particular on these platforms: unix, macOS, and windows WSL.

[documentation](https://github.com/nvm-sh/nvm)

**macOS and Linux**

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

_this comand install and make available the `nvm` command on your terminal, after that you need to re login_

**Install Node Version**

```bash
nvm install node # "node" is an alias for the latest version

nvm install 14.7.0 # or 16.3.0, 12.22.1, etc

```

### ZSH

Zsh is a shell designed for interactive use, although it is also a powerful scripting language.

[documentation](https://www.zsh.org)

**macOS**

```bash
brew install zsh
```

**linux**

```bash
apt install zsh
```

change shell, only for the current user, after this you HAVE to relogin to work

```bash
chsh -s $(which zsh)
```

### Oh My Posh

Oh My Posh is a custom prompt engine for any shell that has the ability to adjust the prompt string with a function or variable.

[documentation](https://ohmyposh.dev/docs/)

**macOS**

```bash
brew install jandedobbeleer/oh-my-posh/oh-my-posh
```

> As the standard terminal has issues displaying the ANSI characters correctly, you might want to skip loading just for that terminal and instead of the line above, place this in your ~/.zshrc:

```bash
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi
```

Note this will still load Oh My Posh for iTerm2 or any other modern day macOS terminal that supports ANSI characters.

**linux**

```bash
curl -s https://ohmyposh.dev/install.sh | bash -s
```

### STOW

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

### Fuzzy Finder (FZF)

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

### Lazygit

A simple terminal UI for git commands

[documentaion](https://github.com/jesseduffield/lazygit)

**macOS**

```bash
brew install jesseduffield/lazygit/lazygit
```

**linux**

```bash

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

verify the correct version

```bash
lazygit --version
```

### NeoVim

Neovim is a refactor, and sometimes redactor, in the tradition of Vim (which itself derives from Stevie). It is not a rewrite but a continuation and extension of Vim. Many clones and derivatives exist, some very clever—but none are Vim. Neovim is built for users who want the good parts of Vim, and more.

[documentation](https://neovim.io)

**macOS**

```bash
brew install neovim
```

**linux**

```bash
git clone https://github.com/neovim/neovim
git checkout stable
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```
