# Dotfiles 

This repo works as a config backup to my shell environment and neovim configuration, this is for my use only but if you like it feel free to use it, if you have any suggestion, raise a issue


as linux I only use Debian so thats how the scripts will be 


## Terminal environment

### Pre-requisites

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

#### Homebrew (if you are using macOS)

Homebrew installs the stuff you need that Apple (or your Linux system) didn’t.

[documentation](https://brew.sh)

**macOS**

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### ZSH

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

#### Oh My Posh

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

## Install

after met the pre requisites

clone the repository

```bash
git clone https://github.com/TheMakunga/dotfiles .dotfiles

```

excecute stow in the directory

```bash
cd .dotfiles
stow .
```

