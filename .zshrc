# set zinit directory
ZINIT_HOME="${XGD_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.yml)"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi

# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::docker
zinit snippet OMZP::gitignore
zinit snippet OMZP::node
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::clipboard.zsh

# load completions
autoload -U compinit && compinit


# keybinding
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion extras
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# aliases
alias ls='ls --color'
alias ll='ls -lrt'
alias llh='ls -ltrh'
alias lla='ls -ltra'

# shell integrations
eval "$(fzf --zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# add Pulumi to the PATH
export PATH=$PATH:/home/nicolas/.pulumi/bin


## zsh scripts
#
#tmux session
source ~/.zsh_scripts/tmux-session.zsh 

## import autocompletions
#
#fjira
source ~/.zsh_autocompletions/fjira.zsh 

# pnpm
export PNPM_HOME="/home/nicolas/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
