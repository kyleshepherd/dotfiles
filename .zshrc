# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Base theme for custom prompt config
ZSH_THEME=""

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Startup message
source ~/.motd

# Google Cloud SDK
# The next line updates PATH for the Google Cloud SDK.
# Must be set before the kubectl plugin is initialised.
source '/Users/james/google-cloud-sdk/path.zsh.inc'
# The next line enables shell command completion for gcloud.
source '/Users/james/google-cloud-sdk/completion.zsh.inc'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose npm go history history-substring-search httpie kubectl zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


# Prompt setup

# Pure (https://github.com/sindresorhus/pure)
autoload -U promptinit; promptinit
prompt pure

# Add kube to prompt (https://github.com/jonmosco/kube-ps1)
source '/usr/local/opt/kube-ps1/share/kube-ps1.sh'
PROMPT='$(kube_ps1)
'$PROMPT


# User configuration

# Golang
export GOPATH=$HOME/Development/Go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
[[ -s "/Users/james/.gvm/scripts/gvm" ]] && source "/Users/james/.gvm/scripts/gvm"

# Autoenv
source /usr/local/opt/autoenv/activate.sh

# GPG
export GPG_TTY=$(tty)

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Docker
alias dc=docker-compose

# Git cleanup command
alias gitclean='printf "\n>>> Removing feature/ branches\n\n" && git branch | grep feature/ | xargs git branch -d {}'

# Kubernetes
alias k8=kubectl