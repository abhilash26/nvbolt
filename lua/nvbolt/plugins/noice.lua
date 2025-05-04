return {
  {
    "folke/noice.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "MunifTanjim/nui.nvim" },

    -- ⚙️ Initialization
    init = function()
      vim.opt.lazyredraw = false
    end,

    -- 🛠️ Plugin Options
    opts = {
      -- 💬 Message View Settings
      messages = {
        view = "mini",
        view_warn = "mini",
      },

      -- 🧠 LSP Enhancements
      lsp = {
        progress = {
          enabled = true, -- ✅ Enable LSP progress
          format = "lsp_progress",
          throttle = 1000 / 30,
          view = "mini",
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },

      -- 🧪 Preset UI Behaviors
      presets = {
        bottom_search = true, -- 🔍 Command-line search at bottom
        command_palette = true, -- 🎨 Better command palette
        long_message_to_split = true, -- 📄 Long messages shown in split
        inc_rename = true, -- ✏️  Inline rename support
        lsp_doc_border = true, -- 📚 LSP documentation borders
      },

      -- 🔍 Route Filters
      routes = {
        -- 🚫 Suppress unwanted notifications
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = { skip = true },
        },
        -- 📏 Shorten line/byte messages
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
    },
  },
}
