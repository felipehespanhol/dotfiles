
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
abbr -a gsta 'git stash'
abbr -a gstp 'git stash pop'

# Tmux
abbr -a ta tmux attach

# Daily usage
abbr -a e 'exit'
abbr -a ll 'exa -l'
abbr -a la 'exa -la'
abbr -a l 'exa -l'

# Rails
abbr -a be 'bundle exec'

# PopOS specific
# abbr -a inst 'sudo apt install'
# abbr -a remove 'sudo apt remove'

# pnpm
set -gx PNPM_HOME "/home/felipe/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
