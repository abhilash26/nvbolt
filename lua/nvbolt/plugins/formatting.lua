return {
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<F3>",
        function()
          require("conform").format({
            async = true,
            lsp_format = "fallback",
          })
        end,
        desc = "[F]ormat buffer",
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        bash = { "shfmt" },
        css = { "prettierd" },
        go = { "gofumpt" },
        html = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        json = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        php = { "php-cs-fixer" },
        python = { "isort", "black" },
        scss = { "prettierd" },
        sh = { "shfmt" },
        sql = { "sql-formatter" },
        svelte = { "prettierd" },
        toml = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        vue = { "prettierd" },
        yaml = { "prettierd" },
        zsh = { "shfmt" },
      },
    },
  },
}
