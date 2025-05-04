return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false, -- 🚫 Don't lazy-load — apply immediately
    priority = 1000, -- 🥇 Load before all other plugins

    -- 🎨 Theme Options
    opts = {
      variant = "main", -- 🌗 Main variant
      dark_variant = "main", -- 🌑 Ensure dark variant
      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },
      groups = {
        border = "pine", -- 🌲 Optional border styling
      },
      highlight_groups = {
        StatusLine = { fg = "iris", bg = "surface", blend = 10 },
        StatusLineNC = { fg = "subtle", bg = "surface" },
        SnacksIndent = { fg = "surface", nocombine = true },
        SnacksIndentScope = { fg = "subtle", nocombine = true },
        SnacksPicker = { bg = "base", nocombine = true },
        SnacksNormal = { bg = "base", nocombine = true },
      },
    },

    -- ⚙️ Apply and activate colorscheme
    config = function(_, opts)
      require("rose-pine").setup(opts)
      vim.cmd.colorscheme("rose-pine")
    end,
  },
}
