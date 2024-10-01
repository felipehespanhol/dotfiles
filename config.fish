
fish_vi_key_bindings

zoxide init fish | source

# Bind Ctrl+P to go back in history in insert mode
bind \cp up-or-search

# Bind Ctrl+N to go forward in history in insert mode
bind \cn down-or-search

function fish_user_key_bindings
    # Bind Ctrl+P to go back in history in insert mode
    bind -M insert \cp history-search-backward

    # Bind Ctrl+N to go forward in history in insert mode
    bind -M insert \cn history-search-forward
end

theme_gruvbox dark hard

source ~/.asdf/asdf.fish

set -Ux EDITOR nvim
set -Ux VISUAL nvim

# Git
abbr -a ga 'git add'
abbr -a gst 'git status'
abbr -a gd 'git diff'
abbr -a gdca 'git diff --cached'
abbr -a grs 'git restore'
abbr -a grst 'git restore --staged'
abbr -a glg 'git log'
abbr -a gc 'git commit'
abbr -a gcm 'git commit -m'
abbr -a gco 'git checkout'
abbr -a gp 'git push'
abbr -a ggp 'git push origin (git branch --show-current)'
abbr -a gl 'git pull'
abbr -a ggl 'git pull origin (git branch --show-current)'
abbr -a gb 'git branch'
abbr -a gbd 'git branch -D'
abbr -a gm 'git merge'

# Tmux
abbr -a ta tmux attach

# Daily usage
abbr -a e 'exit'
abbr -a ll 'ls -l'
abbr -a la 'ls -la'
abbr -a l 'ls -l'

# PopOS specific
abbr -a inst 'sudo apt install'
abbr -a remove 'sudo apt remove'
