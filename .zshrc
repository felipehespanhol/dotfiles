# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallois"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"
export DISABLE_AUTO_TITLE=true

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rails tmuxinator vi-mode vundle globalias zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Auto Suggestions style
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=red'
# On error download zsh-autosuggestions at git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$PATH:$HOME/programs/bin

# Android
#export ANDROID_HOME=/opt/android-sdk
export ANDROID_HOME=/home/felipe/AndroidSDKs
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/build-tools

# Asdf config
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Tmux config
# for tmux: export 256color
[ -n "$TMUX" ] && export TERM="screen-256color"
export TERM="xterm-256color"

# Tmuxinator config
export EDITOR="nvim"
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# NPM config
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# Alias geral
alias tls='tmux list-session'
alias ta='tmux attach'
alias tat='tmux attach -t'
alias tdp='tmuxinator default-rproject'
alias tip='tmuxinator ionic-project'
alias be='bundle exec'
alias gdc="git diff --cached"
alias open="xdg-open"
alias transep="trans -p en:pt"
alias transpe="trans -p pt:en"
alias transesp="trans -p es:pt"
alias transpes="trans -p pt:es"
alias transip="trans -p it:pt"
alias transpi="trans -p pt:it"
alias psg="ps aux | grep"

# General scripts
export PATH="$HOME/scripts:$PATH"

# Android
#export ANDROID_HOME=/opt/android-sdk
export ANDROID_HOME=~/Android/Sdk
export JAVA_HOME=/usr/lib/jvm/java-8-jdk

# Launchy
export BROWSER=/usr/bin/firefox

# Decisiv
DECISIV_PROFILE=~/Decisiv/.profile
if test -f "$DECISIV_PROFILE"; then
  source $DECISIV_PROFILE
fi
