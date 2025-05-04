local opt = vim.opt
local cache = vim.fn.stdpath("cache")

-- ========== 💾 General ==========
opt.backup = false
opt.shadafile = cache .. "/nvim/shada/main.shada"
opt.swapfile = false
opt.undofile = true
opt.undodir = cache .. "/nvim/undo"

-- ========== 📝 Editing ==========
opt.autoindent = true
opt.breakindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = false
opt.fileencoding = "utf-8"
opt.foldmethod = "manual"
opt.backspace = { "indent", "eol", "start" }

-- ========== 🔍 Search ==========
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- ========== 📐 UI ==========
opt.number = true
opt.relativenumber = false
opt.signcolumn = "yes"
opt.cursorline = false
opt.colorcolumn = "80"
opt.termguicolors = true
opt.background = "dark"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.mouse = "a"

-- ========== 🔤 Special Characters ==========
opt.fillchars = { eob = " " }
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.list = true

-- ========== 🪟 Splits ==========
opt.splitbelow = true
opt.splitright = true

-- ========== ⏱️ Speed & Performance ==========
opt.timeoutlen = 300
opt.updatetime = 250
opt.lazyredraw = true

-- ========== 📟 Statusline / Bufferline ==========
opt.laststatus = 2
opt.showmode = false
opt.showtabline = 1
opt.conceallevel = 3
opt.statusline = " 󰋑 %<%t %h%w%m%r %=  %f %= %y 󰋑 "

-- ========== 📋 Clipboard (Defer) ==========
vim.defer_fn(function()
  opt.clipboard:append({ "unnamedplus" })
  opt.lazyredraw = false
end, 100)
