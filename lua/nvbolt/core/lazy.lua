-- ========== 📦 Lazy.nvim Bootstrap ==========

local cache = vim.fn.stdpath("cache")
local lazy_path = cache .. "/lazy/lazy.nvim"

-- 📥 Clone lazy.nvim if not already installed
if not (vim.uv or vim.loop).fs_stat(lazy_path) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    repo,
    lazy_path,
  })

  if vim.v.shell_error ~= 0 then
    error("❌ Failed to clone lazy.nvim:\n" .. out)
  end
end

-- 📚 Prepend Lazy to runtime path
vim.opt.rtp:prepend(lazy_path)

-- 🧠 Load Lazy safely
local ok, lazy = pcall(require, "lazy")
if not ok then
  vim.notify("Failed to load lazy.nvim", vim.log.levels.ERROR)
  return
end

-- 🚫 Disable unwanted default plugins (for performance)
local disabled_builtins = {
  "2html_plugin",
  "bugreport",
  "compiler",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "matchit",
  "matchparen",
  "optwin",
  "rplugin",
  "rrhelper",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "spellfile_plugin",
  "synmenu",
  "syntax",
  "tar",
  "tarPlugin",
  "tohtml",
  "tutor",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

-- 🚀 Setup Lazy with custom cache-based paths
lazy.setup({
  root = cache .. "/nvim/lazy/",
  lockfile = cache .. "/nvim/lazy/lazy-lock.json",
  pkg = { cache = cache .. "/nvim/lazy/pkg-cache.lua" },
  readme = { root = cache .. "/nvim/lazy/readme" },
  state = cache .. "/nvim/lazy/state.json",
  rocks = { root = cache .. "/nvim/lazy/lazy-rocks" },

  -- 🔍 Plugin spec and behavior
  spec = { { import = "nvbolt.plugins" } },
  defaults = { lazy = true, version = "*" },
  install = { colorscheme = { "rose-pine-main", "default" } },

  -- 🚫 Optional features disabled
  checker = { enabled = false },
  change_detection = { enabled = false, notify = false },

  -- ⚡ Performance boost
  performance = { rtp = { disabled_plugins = disabled_builtins } },

  -- 📈 Enable plugin profiling
  profiling = { enabled = true },
})
