return {
  {
    "nvim-treesitter/nvim-treesitter", -- Requires tree-sitter-cli, install with `sudo pacman -S tree-sitter-cli`
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "ruby",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "json",
        "lua",
        "yaml"
      },
      auto_install = true,
      highlight = { enable = true },
    }
  }
}
