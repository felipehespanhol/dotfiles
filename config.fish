function fish_user_key_bindings
  # Bind Ctrl+P to go back in history in insert mode
  bind -M insert \cp history-search-backward

  # Bind Ctrl+N to go forward in history in insert mode
  bind -M insert \cn history-search-forward
end

function mytime_sidekiq
  bundle exec sidekiq -r ./config/environment.rb \
      -q clients -q push_notifications -q default \
      -q calendars -q prewarm_cache -q merchant_charge_receipt_queue \
      -q dashboard -q reports -q google_reserve_api \
      -c 1 -v $argv
end

if status --is-interactive
  fish_vi_key_bindings

  # Lazy-load zoxide
  if not functions -q __zoxide_z
    zoxide init fish | source
  end

  # Bind Ctrl+P to go back in history in insert mode
  bind \cp up-or-search

  # Bind Ctrl+N to go forward in history in insert mode
  bind \cn down-or-search

  # theme_gruvbox light hard
  theme_gruvbox dark hard

  # Editor
  set -gx EDITOR nvim
  set -gx VISUAL nvim

  # Git
  abbr -a ga 'git add'
  abbr -a gst 'git status'
  abbr -a gd 'git diff'
  abbr -a gdca 'git diff --cached'
  abbr -a grst 'git restore'
  abbr -a grsts 'git restore --staged'
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
  abbr -a grb 'git rebase'
  abbr -a grbm 'git rebase master'
  abbr -a gcp 'git cherry-pick'
  abbr -a gsh 'git show'

  # Tmux
  abbr -a ta tmux attach

  # Daily usage
  abbr -a e 'exit'
  abbr -a ll 'exa -l'
  abbr -a la 'exa -la'
  abbr -a l 'exa -l'

  # Rails
  abbr -a be 'bundle exec'

  # PNPM
  set -gx PNPM_HOME "/home/felipe/.local/share/pnpm"

  # PATH management
  fish_add_path "$PNPM_HOME"
  fish_add_path "$HOME/.cargo/bin" # Rust

  # Start ASDF config
  # ASDF configuration code
  if test -z $ASDF_DATA_DIR
      set _asdf_shims "$HOME/.asdf/shims"
  else
      set _asdf_shims "$ASDF_DATA_DIR/shims"
  end

  # Do not use fish_add_path (added in Fish 3.2) because it
  # potentially changes the order of items in PATH
  if not contains $_asdf_shims $PATH
      set -gx --prepend PATH $_asdf_shims
  end
  set --erase _asdf_shims
  # End ASDF config

  # Set GCC and G++ versions to 13 in order to compile Ruby 3.3.0+ dependencies
  set -gx CC /usr/bin/gcc-13
  set -gx CXX /usr/bin/g++-13
end
