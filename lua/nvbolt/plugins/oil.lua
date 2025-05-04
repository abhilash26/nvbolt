return {
  {
    "stevearc/oil.nvim",

    -- 🚀 Load immediately (not lazy)
    lazy = false,

    -- 🔗 Dependencies
    dependencies = { "icons" },

    -- 🧷 Commands and Keybindings
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "📁 Open parent dir" },
      {
        "<leader>-",
        "<cmd>Oil --float<cr>",
        desc = "🪟 Open parent dir (float)",
      },
    },

    -- ⚙️ Plugin Options
    opts = {
      -- 📂 Replace native file explorer
      default_file_explorer = true,

      -- 🌈 UI Columns
      columns = { "icon" }, -- Show icons using icons

      -- 🎮 Key Mappings
      keymaps = {
        ["<C-h>"] = false, -- Disable default split-left
        ["<M-h>"] = "actions.select_split", -- Alt+h for horizontal split
        ["<M-v>"] = "actions.select_vsplit", -- Alt+v for vertical split
      },

      -- 🗑️ Move to trash instead of direct delete
      delete_to_trash = true,

      -- ✅ Auto-confirm simple edits
      skip_confirm_for_simple_edits = true,

      -- 👻 View Hidden Files
      view_options = {
        show_hidden = true,
      },

      -- 🪟 Floating Window Settings
      float = {
        max_width = 75,
        max_height = 80,
      },

      -- 🔎 File Preview Thresholds
      preview = {
        min_width = { 70, 0.7 }, -- Min preview area: 70 cols or 70%
      },
    },
  },
}
