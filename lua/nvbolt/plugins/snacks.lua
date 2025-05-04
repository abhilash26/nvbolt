return {
  {
    "folke/snacks.nvim",
    cmd = "Snacks",
    lazy = false,
    priority = 1000,

    -- ⚙️ Initialization
    init = function()
      local api = vim.api

      api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        group = api.nvim_create_augroup("nvbolt_snacks", { clear = true }),
        callback = function()
          -- 🐞 Debug Utilities
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd

          -- 🎛️ Toggle Options
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
          Snacks.toggle
            .option("relativenumber", { name = "Relative number" })
            :map("<leader>tr")
          Snacks.toggle.diagnostics():map("<leader>td")
          Snacks.toggle.line_number():map("<leader>tl")
          Snacks.toggle.treesitter():map("<leader>tt")
          Snacks.toggle.inlay_hints():map("<leader>th")
          Snacks.toggle.indent():map("<leader>ti")
          Snacks.toggle.zen():map("<leader>tz")
        end,
      })
    end,

    -- ⌨️ Key Mappings
    -- stylua: ignore
    keys = {
      { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },
      { "<leader>z", function() Snacks.zen.zoom() end, desc = "Toggle zoom" },
      { "<leader>\\", function() Snacks.terminal() end, desc = "Toggle terminal" },
      { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification history" },
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss all notifications" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>bq", function() Snacks.bufdelete() end, desc = "Buffer quit" },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Buffer delete" },
      { "<leader>be", function() Snacks.bufdelete.other() end, desc = "Quit other buffers" },
      { "<c-q>", function() Snacks.bufdelete() end, desc = "Buffer quit" },
      { "<c-p>", function() Snacks.picker.files() end, desc = "Find files" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
      { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
      { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<leader>fm", function() Snacks.picker.man() end, desc = "Man Pages" },
      { "<leader>fo", function() Snacks.picker.recent() end, desc = "Recent" },
      { "<leader>ft", function() Snacks.picker.colorschemes({ layout = "ivy" }) end, desc = "Colorschemes" },
      { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>fq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
      { "<leader>gb", function() Snacks.picker.git_branches({ layout = "select" }) end, desc = "Git Branches" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    },

    -- 🛠️ Plugin Options
    opts = {
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true, timeout = 3000 },
      scope = { enabled = true },
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      lazygit = { enabled = true, configure = true },
      explorer = {
        enabled = true,
        layout = {
          cycle = false,
        },
      },
      picker = {
        sources = {
          explorer = {},
        },
        matchers = {
          frecency = true,
          cwd_bonus = true,
        },
        formatters = {
          file = {
            filename_first = true,
            filename_only = false,
            icon_width = 2,
          },
        },
        layout = {
          cycle = false,
        },
      },

      -- 🖥️ Dashboard Preset
      dashboard = {
        preset = {
          header = [[
⠀⠀⠀⠀⠀⣴⠶⠶⠶⠶⢶⣤⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢸⡏⠀⠀⠀⠀⣼⠏⠀⠀⠀⠀⠀
⠀⠀⠀⢀⡿⠀⠀⠀⠀⣼⠏⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣼⠃⠀⠀⠀⠸⣯⣤⣤⣤⣤⣤⠀⠀
⠀⠀⣸⡏⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠋⠀⠀
⠀⠀⠻⠶⠶⢶⡄⠀⠀⠀⢀⣴⠟⠁⠀⠀⠀
⠀⠀⠀⠀⠀⣼⠇⠀⠀⣠⡾⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢠⡟⠀⢀⣾⠏⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣸⢃⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢠⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠘⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
          ]],
          keys = {
            {
              icon = " ",
              key = "f",
              desc = "Find File",
              action = ":lua Snacks.dashboard.pick('files')",
            },
            {
              icon = " ",
              key = "n",
              desc = "New File",
              action = ":ene | startinsert",
            },
            {
              icon = " ",
              key = "g",
              desc = "Find Text",
              action = ":lua Snacks.dashboard.pick('live_grep')",
            },
            {
              icon = " ",
              key = "r",
              desc = "Recent Files",
              action = ":lua Snacks.dashboard.pick('oldfiles')",
            },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            {
              icon = " ",
              key = "s",
              desc = "Restore Session",
              action = ":lua require('persistence').select()",
            },
            {
              icon = "󰒲 ",
              key = "l",
              desc = "Lazy",
              action = ":Lazy",
            },
            {
              icon = " ",
              key = "q",
              desc = "Quit",
              action = ":qa",
            },
          },
        },
      },
    },
  },
}
