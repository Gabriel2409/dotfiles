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
export PATH="$PATH:$HOME/.local/bin"

# nvm
source /usr/share/nvm/init-nvm.sh

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# go
# TODO: check for empty var
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# shows current dir
PROMPT='%B%F{magenta}%n@%m %F{blue}%~%f%b$ '

# starship breaks tmux copy mode, so i disable it for now
# eval "$(starship init zsh)"

#nvim
export BOB_PATH="$HOME/.local/share/bob/nvim-bin"
export PATH="$BOB_PATH:$PATH"
alias nvim="NVIM_APPNAME=nvim/nvim-lazyvim nvim"
alias vi="NVIM_APPNAME=nvim/nvim-lazyvim nvim"
alias vk="NVIM_APPNAME=nvim/nvim-kickstart nvim"


# Load Angular CLI autocompletion.
source <(ng completion script)

# ensures pipx uses pyenv python
export PIPX_DEFAULT_PYTHON=python


# set env var for config
export XDG_CONFIG_HOME=$HOME/.config



# case insensitive path-completion
autoload -Uz +X compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select



# Google cloud sdk if installed from source
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
# The next line enables shell command completion for gcloud.

