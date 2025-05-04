return {
  {
    -- 🎨 Icon support for plugins
    "echasnovski/mini.icons",

    -- 📌 Always use the latest version
    version = "*",

    -- 🏷️ Alias for easier referencing
    name = "icons",

    -- ⚙️ Plugin setup
    config = function(_, opts)
      require("mini.icons").setup(opts)
    end,
  },
}
