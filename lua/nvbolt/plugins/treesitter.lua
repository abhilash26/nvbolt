return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- 🧾 Always use the latest version
    build = ":TSUpdate", -- 🛠️ Update parsers on build
    event = { "BufReadPost", "BufNewFile" }, -- 📦 Lazy-load on buffer read or new file
    cmd = { "TSInstall", "TSUpdate", "TSUpdateSync" }, -- 🔧 CLI commands

    -- 🛠️ Plugin Options
    opts = {
      auto_install = true, -- 🤖 Auto-install missing parsers
      highlight = {
        enable = true, -- 🌈 Enable syntax highlighting
        additional_vim_regex_highlighting = false, -- ❌ Disable legacy regex highlighting
      },
      indent = {
        enable = true, -- 📏 Enable smarter indentation
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Enter>",
          node_incremental = "<Enter>",
          node_decremental = "<Backspace>",
          scope_incremental = false,
        },
      },
      -- 📚 Languages to ensure are always installed
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "typescript",
        "yaml",
        "diff",
        "php",
        "sql",
        "scss",
        "tsx",
        "dockerfile",
        "markdown_inline",
      },
    },

    -- ⚙️ Config Setup
    config = function(_, opts)
      require("nvim-treesitter.install").prefer_git = true -- 🧬 Prefer Git over curl for installs
      require("nvim-treesitter.configs").setup(opts) -- 🚀 Load Treesitter with your options
    end,
  },
}
