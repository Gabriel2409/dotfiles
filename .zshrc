# https://www.youtube.com/watch?v=ud7YxC33Z3w

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# set the directory we want to store zinit and plugins. 
# Either XDG_DATA_HOME or fallback
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# dl zinit if not there yet
if [ ! -d "$ZINIT_HOME" ]; then 
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"



# add in powerlevel10k - 
# ice: pass depth arg to next command  (as zinit uses git under the hood)
# light = load without reporting and investigation
zinit ice depth=1; zinit light romkatv/powerlevel10k;

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
# suggestions based on command history - accept with ctrl f
zinit light zsh-users/zsh-autosuggestions


# fzf
zinit light Aloxaf/fzf-tab
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' 
# tip: ctrl r to have fzf on backward search
eval "$(fzf --zsh)"

#emacs mode
bindkey -e

#load completions
autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh




# better history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
# prevent command from being added to history if it starts with space
setopt hist_ignore_space 
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z-a-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


# up and down arrow key to search with typed text
bindkey '^[[A' history-beginning-search-backward 
bindkey '^[[B' history-beginning-search-forward
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
# move with ctrl left, right
bindkey '^[[1;5C' forward-word 
bindkey '^[[1;5D' backward-word


#nvim
export BOB_PATH="$HOME/.local/share/bob/nvim-bin"
export PATH="$BOB_PATH:$PATH"
# alias nvim="NVIM_APPNAME=nvim/nvim-lazyvim nvim"
alias vi="NVIM_APPNAME=nvim/nvim-lazyvim nvim"
alias vk="NVIM_APPNAME=nvim/nvim-kickstart nvim"
alias vb="NVIM_APPNAME=nvim/nvim-basic nvim"

# better ls
alias ls='ls --color'

# extra path 
export PATH="$PATH:$HOME/.local/bin"

# nvm
source /usr/share/nvm/init-nvm.sh

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# go
# TODO: check for empty var
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"


# Load Angular CLI autocompletion.
source <(ng completion script)

# set env var for config

export XDG_CONFIG_HOME=$HOME/.config


# load uv completion and make path completion work after un run --
eval "$(uv generate-shell-completion zsh)"
compdef _precommand uv


# Google cloud sdk if installed from source
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
# The next line enables shell command completion for gcloud.

