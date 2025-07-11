# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="dpoggi"
ZSH_THEME="dracula"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export FZF_BASE="~/.fzf"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git going_places fzf)

source $ZSH/oh-my-zsh.sh

# User configuration

#export VIRTUAL_ENV_DISABLE_PROMPT=0

#export PATH=$HOME/bin:/usr/local/bin:/opt/mongo/bin:$PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias alive="ping 8.8.8.8"
alias namedate="date +%Y%m%d"
alias mkdirtoday='mkdir $(date +%Y-%m-%d)'
alias lswifi="nmcli -f active,bssid,ssid,bars dev wifi"
alias vim=nvim
alias ipython="python3 -m IPython"

function vimag() {
	nvim -p $(ag -l "$@")
}

function vimfind() {
	nvim -p $(find "$@")
}

alias sl='sl -e'
alias githome='cd $(git rev-parse --show-toplevel)'
alias cp="cp -n"

compinit

[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

export PATH="$HOME/go/bin:/usr/local/go/bin:$HOME/.poetry/bin:$PATH"

alias black="python3 -m black"
alias decode-jwt='jq -R "split(\".\") | .[1] | @base64d | fromjson"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f "$HOME/.zshrc-private" ] && source "$HOME/.zshrc-private"

function evacuate-port() {
  local port="$1"
  local signal="${2:-9}"
  local pid="$(lsof -t -i"TCP:${port}")"
  if [ -z "$pid" ]; then
    echo "No process is holding port ${port}" >&1
    return 1
  fi
  ps -p "$pid"
  kill -"$signal" "$pid"
}
