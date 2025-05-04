-- Set leader key early
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- stylua: ignore
vim.keymap.set( "n", "<space>", "<nop>", { desc = "Leader remapping", silent = true })

-- stylua: ignore
local keymaps = {

  -- ========== 🪟 Window Navigation ==========
  { mode = "n", lhs = "<C-h>", rhs = "<C-w>h", desc = "Go to left window" },
  { mode = "n", lhs = "<C-j>", rhs = "<C-w>j", desc = "Go to lower window" },
  { mode = "n", lhs = "<C-k>", rhs = "<C-w>k", desc = "Go to upper window" },
  { mode = "n", lhs = "<C-l>", rhs = "<C-w>l", desc = "Go to right window" },

  -- ========== 📐 Window Resize ==========
  { mode = "n", lhs = "<C-Up>", rhs = "<cmd>resize +2<CR>", desc = "Increase window height" },
  { mode = "n", lhs = "<C-Down>", rhs = "<cmd>resize -2<CR>", desc = "Decrease window height" },
  { mode = "n", lhs = "<C-Left>", rhs = "<cmd>vertical resize -2<CR>", desc = "Decrease window width" },
  { mode = "n", lhs = "<C-Right>", rhs = "<cmd>vertical resize +2<CR>", desc = "Increase window width" },

  -- ========== 📁 Buffer Navigation ==========
  { mode = "n", lhs = "<S-l>", rhs = "<cmd>bnext<CR>", desc = "Next buffer" },
  { mode = "n", lhs = "<S-h>", rhs = "<cmd>bprevious<CR>", desc = "Previous buffer" },
  { mode = "n", lhs = "<BS>", rhs = "<cmd>b#<CR>", desc = "Last buffer" },
  { mode = "n", lhs = "<leader>fn", rhs = "<cmd>ene | startinsert<CR>", desc = "New buffer" },

  -- ========== 📋 Better Pasting ==========
  { mode = "v", lhs = "p", rhs = '"_dP', desc = "Paste without overwriting" },

  -- ========== 🔧 Better Indenting ==========
  { mode = "v", lhs = "<", rhs = "<gv", desc = "Indent left" },
  { mode = "v", lhs = ">", rhs = ">gv", desc = "Indent right" },

  -- ========== 👣 Smarter Movement ==========
  { mode = "n", lhs = "j", rhs = "v:count == 0 ? 'gj' : 'j'", desc = "Visual down", expr = true },
  { mode = "n", lhs = "k", rhs = "v:count == 0 ? 'gk' : 'k'", desc = "Visual up", expr = true },

  -- ========== 🔀 Move Lines ==========
  { mode = "v", lhs = "<S-j>", rhs = ":m '>+1<CR>gv=gv", desc = "Move line down" },
  { mode = "v", lhs = "<S-k>", rhs = ":m '<-2<CR>gv=gv", desc = "Move line up" },

  -- ========== ➕ New Line in Normal Mode ==========
  { mode = "n", lhs = "<CR>", rhs = "o<Esc>", desc = "New line below" },

  -- ========== 📄 Paging ==========
  { mode = "n", lhs = "<C-d>", rhs = "<C-d>zz", desc = "Page down center" },
  { mode = "n", lhs = "<C-u>", rhs = "<C-u>zz", desc = "Page up center" },

  -- ========== 🧠 Smart Clipboard ==========
  { mode = "x", lhs = "<leader>p", rhs = [["_dP]], desc = "Paste without yank" },
  { mode = { "n", "v" }, lhs = "<leader>d", rhs = [["_d]], desc = "Delete without yank" },
  { mode = { "n", "v" }, lhs = "<leader>y", rhs = [["+y]], desc = "Copy to system clipboard" },

  -- ========== 💾 File Saving ==========
  { mode = { "n", "i", "v", "x" }, lhs = "<C-s>", rhs = "<cmd>w<CR><Esc>", desc = "Save file" },
  { mode = "n", lhs = "<leader>wq", rhs = "<cmd>wqa<CR>", desc = "Write and quit" },

  -- ========== 🧼 File Cleanup ==========
  { mode = "n", lhs = "<leader>sf", rhs = [[<cmd>silent! %s/\r//g | silent! %s/\s\+$//g<CR>]], desc = "Remove ^M and trailing spaces" },
}

-- Apply mappings
for _, km in ipairs(keymaps) do
  vim.keymap.set(km.mode, km.lhs, km.rhs, {
    desc = km.desc,
    silent = true,
    noremap = true,
    expr = km.expr or false,
  })
end
