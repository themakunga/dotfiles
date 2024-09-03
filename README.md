# Dotfiles

<!-- mtoc-start -->

* [Services / Configurations available](#services--configurations-available)
* [Instalation](#instalation)
* [Pre-requisites](#pre-requisites)
  * [GIT](#git)
  * [Nerd Fonts](#nerd-fonts)
  * [Kitty](#kitty)
  * [Homebrew (if you are using macOS)](#homebrew-if-you-are-using-macos)
  * [TMUX](#tmux)
  * [NVM and nodeJS](#nvm-and-nodejs)
    * [Install PNPM](#install-pnpm)
  * [Docker (& Colima)](#docker--colima)
    * [Docker](#docker)
    * [Colima](#colima)
  * [ZSH](#zsh)
  * [Oh My Posh](#oh-my-posh)
  * [Pulumi and Terraform](#pulumi-and-terraform)
    * [Terraform](#terraform)
    * [Pulumi](#pulumi)
  * [STOW](#stow)
  * [Fuzzy Finder (FZF)](#fuzzy-finder-fzf)
  * [Lazygit](#lazygit)
  * [NeoVim](#neovim)

<!-- mtoc-end -->

This repo works as a config backup to my shell environment and neovim configuration, this is for my use only but if you like it feel free to use it, if you have any suggestion, raise a issue

as linux I only use Debian so thats how the scripts will be

## Services / Configurations available

- `zsh` configuration using `zinit`
- `oh my posh` as terminal theme
- `neovim`

## Instalation

make sure to complete the [Pre-requisites](#Pre-requisites) , using a true color terminal emulator like wezterm or iTerm2, you can clone the repository and run `stow` in the dotfiles dir

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

### Nerd Fonts

Nerd Fonts is a project that patches developer targeted fonts with a high number of glyphs (icons). Specifically to add a high number of extra glyphs from popular 'iconic fonts' such as Font Awesome, Devicons, Octicons, and others.

[documentation](https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file#option-2-homebrew-fonts)

**macOs and linux**

```bash

git clone https://github.com/ryanoasis/nerd-fonts.git
cd .nerd-fonts

./install.sh # this install all fonts, its a lot

```

### Kitty

The fast, feature-rich, GPU based terminal emulator

[documentation](https://sw.kovidgoyal.net/kitty/)

**macOs and linux**

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

> [!note] Note
> The binaries will be installed in the standard location for your OS, /Applications/kitty.app on macOS and ~/.local/kitty.app on Linux. The installer only touches files in that directory. To update kitty, simply re-run the command.

### Homebrew (if you are using macOS)

Homebrew installs the stuff you need that Apple (or your Linux system) didn’t.

[documentation](https://brew.sh)

**macOS**

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### TMUX

tmux is a terminal multiplexer. It lets you switch easily between several programs in one terminal, detach them (they keep running in the background) and reattach them to a different terminal.

[documentation](https://github.com/tmux/tmux/wiki)

**macOS**

```bash
brew install tmux
```

**linux**

```bash
sudo apt install tmux
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

#### Install PNPM

**macOS and linux**

```bash
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

### Docker (& Colima)

#### Docker

Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker's methodologies for shipping, testing, and deploying code, you can significantly reduce the delay between writing code and running it in production.

[documentation](https://docs.docker.com/guides/docker-overview/)

**macOS**

```bash
brew install docker
```

_this only install the runtime, for a gui o tgui google it_

**linux**

```bash
# remove old instalations
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

#### Colima

Colima - container runtimes on macOS (and Linux) with minimal setup.

[documentation](https://github.com/abiosoft/colima)

**macOS**

```bash
brew install colima

colima start

docker context use colima
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

### Pulumi and Terraform

#### Terraform

Infrastructure automation to provision and manage resources in any cloud or data center.

[documentation](https://developer.hashicorp.com/terraform?product_intent=terraform)

**macOS**

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

**linux**

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

#### Pulumi

Pulumi is an open source infrastructure as code tool for creating, deploying, and managing cloud infrastructure.

[documentation](https://www.pulumi.com/docs/)

**macOS**

```bash
brew install pulumi/tap/pulumi
```

**linux**

```bash
curl -fsSL https://get.pulumi.com | sh
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
