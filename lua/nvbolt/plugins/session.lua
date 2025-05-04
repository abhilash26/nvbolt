return {
  {
    "folke/persistence.nvim",

    -- 📦 Load after opening a buffer
    event = "BufReadPost",

    -- 🎮 Key Mappings
    keys = {
      {
        "<leader>sl",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "💾 [S]ession [L]oad (last)", -- Load the last session
      },
      {
        "<leader>fs",
        function()
          require("persistence").select()
        end,
        desc = "📂 [F]ind [S]ession", -- Open session picker
      },
    },

    -- ⚙️ Plugin Options
    opts = {
      -- 🗂️ Directory to store session files
      dir = vim.fn.stdpath("cache") .. "/sessions/",

      -- 🧠 What to remember in the session
      options = "buffers,curdir,tabpages,winsize,help,globals,skiprtp,folds",
    },
  },
}
