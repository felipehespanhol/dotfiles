# Completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:~/.docker/completions:~/.zsh/completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Lsd
alias ls='lsd'
alias l='ls -l'
alias ll='ls -l'
alias la='ls -la'
alias lt='ls --tree'

alias e='exit'

# Git
alias ga='git add'
alias gst='git status'
alias gd='git diff'
alias gdca='git diff --cached'
alias grst='git restore'
alias grsts='git restore --staged'
alias glg='git log'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gp='git push'
alias ggp='git push origin $(git branch --show-current)'
alias gl='git pull'
alias ggl='git pull origin $(git branch --show-current)'
alias gb='git branch'
alias gbd='git branch -D'
alias gm='git merge'
alias gsta='git stash'
alias gstp='git stash pop'
alias grb='git rebase'
alias grbm='git rebase master'
alias gcp='git cherry-pick'
alias gsh='git show'

# Tmux
alias ta='tmux attach'

# Docker
alias drun="docker compose run web"
alias drails="docker compose run web bin/rails"
drspec() {
  docker compose run --rm web bin/rspec "$@"
}
compdef drspec=rspec

# VI mode
bindkey -v
bindkey -M viins '^P' up-history
bindkey -M viins '^N' down-history

# zoxide
eval "$(zoxide init zsh)"

# mise-en-place
eval "$(mise activate zsh)"

# Posgres mise-en-place
export PKG_CONFIG_PATH="/opt/homebrew/bin/pkg-config:$(brew --prefix icu4c)/lib/pkgconfig:$(brew --prefix curl)/lib/pkgconfig:$(brew --prefix zlib)/lib/pkgconfig"

# FZF history search
source /opt/homebrew/Cellar/fzf/0.65.2/shell/key-bindings.zsh

# Fish-like autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^i' autosuggest-accept # set ctrl+i to accept suggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#5c8dbf' # set a light blue color to highlight

# alias drspec="docker compose run web bin/rspec"

# Editor
export EDITOR="nvim"
export VISUAL="nvim"

# Prompt
setopt prompt_subst

# Homebrew
export HOMEBREW_PREFIX=/opt/homebrew

# Function to show git branch
git_branch() {
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    echo " %F{yellow}($branch)%f"
  fi
}

# Customize prompt
PROMPT="%F{blue}%B[%D{%H:%M:%S}]%b%f %F{green}%B%~%b%f\$(git_branch) %# "

# daisy
export COMPOSE_FILE="docker-compose.next.yml"
export COMPOSE_PROFILES="dashboards,redox" # If you're using redox/opensearch dashboards
