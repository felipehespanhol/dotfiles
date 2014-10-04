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
plugins=(brew git ruby rvm rails tmuxinator vi-mode vundle)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/Users/felipehespanhol/.rvm/gems/ruby-1.9.3-p448@test/bin:/Users/felipehespanhol/.rvm/gems/ruby-1.9.3-p448@global/bin:/Users/felipehespanhol/.rvm/rubies/ruby-1.9.3-p448/bin:/Users/felipehespanhol/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/felipehespanhol/.rvm/bin
#export ruby_configure_flags="--with-readline-dir=/usr/local/Cellar/readline/6.2.4"
export LANG='pt_BR.UTF-8'

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
[[ -r "$HOME/.rvm/scripts/completion" ]] && . "$HOME/.rvm/scripts/completion" #This adds rvm shell completion

# Tmux config
# for tmux: export 256color
[ -n "$TMUX" ] && export TERM="screen-256color"
export TERM="xterm-256color"

# Tmuxinator config
export EDITOR="vim"
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Alias geral
alias ll='ls -l'
alias asdf='sudo shutdown -h -P 0'

# Alias trabalho
alias tbvs='tmuxinator bvs_crawler_web'
alias tdp='tmuxinator default-rproject'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
