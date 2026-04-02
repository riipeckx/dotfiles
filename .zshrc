# Exports
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export SPACESHIP_CONFIG_FILE="$HOME/.config/spaceship.zsh"
export LANG=en_US.UTF-8
export EDITOR=vim
export ZSH_THEME="spaceship"
export COMPLETION_WAITING_DOTS="false"
export HIST_STAMPS="dd/mm/yyyy"
export DOCKER_BUILDKIT=1
export KUBE_CONFIG_PATH=~/.kube/config
#export KIND_EXPERIMENTAL_PROVIDER=docker

# OMZ plugins
plugins=(git aws docker docker-compose kubectl zsh-syntax-highlighting colored-man-pages colorize)

# ZSH config
unsetopt correct

# Source
source $ZSH/oh-my-zsh.sh
source <(pip3 completion --zsh)
source <(kubectl completion zsh)
source <(gh completion -s zsh)
source <(mise completion zsh)
eval "$(mise activate zsh)"
source <(dagger completion zsh)
source /usr/bin/aws_zsh_completer.sh
source <(kind completion zsh)
source <(okteto completion zsh)
source <(kustomize completion zsh)
source <(helm completion zsh)
source <(cilium-cli completion zsh)
source <(tilt completion zsh)
source <(yq shell-completion zsh)

# SPACESHIP
SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS=(
  red    '\(kube-system)$'
)

# Functions
aws-sso-login() {
  if [[ -z "${AWS_PROFILE}" ]]; then
    echo -e "AWS_PROFILE not set!"
  else
    aws sso login --profile $AWS_PROFILE
  fi
}

# Aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias ll="ls -ahl"
alias k="kubectl"
alias cilium="cilium-cli"
alias t="terraform"
alias ip="ip -color=auto"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform