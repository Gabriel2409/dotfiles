# up and down arrow key to search with typed text
bindkey '^[[A' history-beginning-search-backward 
bindkey '^[[B' history-beginning-search-forward

# move with ctrl left, right
bindkey '^[[1;5C' forward-word 
bindkey '^[[1;5D' backward-word

# avoid leaving shell with ctrl d
setopt IGNOREEOF

# better history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HIST_IGNORE_DUP=1
HIST_IGNORE_SPACE=1
setopt SHARE_HISTORY

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# extra path - Created by `pipx` 
export PATH="$PATH:/home/gabriel/.local/bin"

# nvm
source /usr/share/nvm/init-nvm.sh

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# go
# TODO: check for empty var
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# pyenv
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# shows current dir
PROMPT='%n@%m:%~%# '

eval "$(starship init zsh)"

#nvim
export BOB_PATH="$HOME/.local/share/bob/nvim-bin"
export PATH="$BOB_PATH:$PATH"
alias nvim="NVIM_APPNAME=nvim/nvim-lazyvim nvim"
alias vi="NVIM_APPNAME=nvim/nvim-lazyvim nvim"
alias vk="NVIM_APPNAME=nvim/nvim-kickstart nvim"

# ensures pipx uses pyenv python
export PIPX_DEFAULT_PYTHON=python

# set env var for config
export XDG_CONFIG_HOME=$HOME/.config

# case insensitive path-completion
autoload -Uz +X compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
