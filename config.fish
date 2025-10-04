source /usr/share/cachyos-fish-config/cachyos-config.fish

function fish_user_key_bindings
  # Bind Ctrl+P to go back in history in insert mode
  bind -M insert \cp history-search-backward

  # Bind Ctrl+N to go forward in history in insert mode
  bind -M insert \cn history-search-forward
end

function fish_prompt
    # Get the current time in HH:MM:SS format
    set -l time_str (date +%H:%M:%S)

    # Get the current working directory, with ~ for the home directory
    set -l cwd (prompt_pwd)

    # Get the git branch name if in a git repository
    set -l git_branch ""
    if test (git rev-parse --is-inside-work-tree 2>/dev/null)
        set git_branch (git branch --show-current 2>/dev/null)
    end

    # Print the prompt with colors
    echo -n (set_color brgreen)"["
    echo -n (set_color cyan)"$time_str"
    echo -n (set_color brgreen)"] "
    echo -n (set_color yellow)"$cwd"

    # Append the branch if it exists, in a different color
    if test -n "$git_branch"
        echo -n (set_color brgreen)" ("(set_color cyan)"$git_branch"(set_color brgreen)")"
    end

    # Reset colors and add the final prompt character
    echo -n (set_color normal)" > "
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
  # theme_gruvbox dark hard
  # install with `fisher install jomik/fish-gruvbox`

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
  abbr -a grbc 'git rebase --continue'
  abbr -a grbm 'git rebase master'
  abbr -a gcp 'git cherry-pick'
  abbr -a gsh 'git show'

  # Tmux
  abbr -a ta tmux attach

  # Daily usage
  abbr -a e 'exit'
  abbr -a ll 'eza --color=always -l'
  abbr -a la 'eza --color=always -la'
  abbr -a l 'eza --color=always -l'

  # Rails
  abbr -a be 'bundle exec'

  # PNPM
  set -gx PNPM_HOME "/home/felipe/.local/share/pnpm"

  # PATH management
  fish_add_path "$PNPM_HOME"

  # Rust
  # fish_add_path "$HOME/.cargo/bin"

  # Set GCC and G++ versions to 13 in order to compile Ruby 3.3.0+ dependencies
  # set -gx CC /usr/bin/gcc-13
  # set -gx CXX /usr/bin/g++-13

  mise activate fish | source
end

