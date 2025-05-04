return {
  {
    "catgoose/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      filetypes = {
        "css",
        "scss",
        "html",
        "php",
        "sass",
        "javascript",
        "svelte",
        "vue",
        "templ",
      },
      user_default_options = {
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        tailwind = true,
        sass = { enable = true, parsers = { "css" } },
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile" },
  },
}
