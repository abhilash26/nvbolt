vim.schedule(function()
  local api = vim.api

  -- 🔧 Helper: Create augroup with "nvbolt_" prefix
  local function augroup(name)
    return api.nvim_create_augroup("nvbolt_" .. name, { clear = true })
  end

  -- ✨ Highlight on yank
  api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
      vim.highlight.on_yank({ timeout = 500 })
    end,
  })

  -- 📍 Jump to last cursor location on buffer open
  api.nvim_create_autocmd("BufReadPost", {
    group = augroup("last_loc"),
    callback = function()
      local last_pos = api.nvim_buf_get_mark(0, '"')
      local total_lines = api.nvim_buf_line_count(0)
      if last_pos[1] > 0 and last_pos[1] <= total_lines then
        pcall(api.nvim_win_set_cursor, 0, last_pos)
      end
    end,
  })

  -- ❌ Close special windows with 'q'
  api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
      "checkhealth",
      "help",
      "lspinfo",
      "man",
      "oil",
      "qf",
      -- "spectre_panel",
    },
    callback = function(event)
      local buf = event.buf
      vim.bo[buf].buflisted = false
      vim.keymap.set("n", "q", "<cmd>close<cr>", {
        buffer = buf,
        silent = true,
        noremap = true,
      })
    end,
  })

  -- ✨ Cursorline on oil
  api.nvim_create_autocmd("FileType", {
    group = augroup("oil_cursorline"),
    pattern = "oil",
    callback = function()
      vim.opt_local.cursorline = true
    end,
  })
end)
