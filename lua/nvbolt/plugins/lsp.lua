return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },

    dependencies = {
      { "williamboman/mason.nvim", cmd = "Mason" },
      { "williamboman/mason-lspconfig.nvim" },
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        cmd = {
          "MasonToolsInstall",
          "MasonToolsInstallSync",
          "MasonToolsUpdate",
          "MasonToolsUpdateSync",
        },
      },
      { "saghen/blink.cmp" },
    },

    opts = function()
      local ensure_installed = {
        -- LSP Servers
        "bashls",
        "clangd",
        "cssls",
        "css_variables",
        "emmet_ls",
        "gopls",
        "html",
        "htmx",
        "intelephense",
        "jsonls",
        "lua_ls",
        "marksman",
        "pyright",
        "svelte",
        "tailwindcss",
        "templ",
        "ts_ls",
        "vuels",

        -- Linters
        "eslint_d",
        "phpcs",
        "pylint",
        "shellcheck",

        -- Formatters
        "black",
        "gofumpt",
        "isort",
        "php-cs-fixer",
        "prettierd",
        "shfmt",
        "sqlfmt",
        "stylua",
        "sql-formatter",
      }

      return {
        servers = {
          emmet_ls = { filetypes = { "html", "php", "svelte", "vue", "templ" } },
          intelephense = { single_file_support = true },
          lua_ls = {
            settings = {
              Lua = {
                codelens = { enable = true },
                completion = { callSnippet = "Replace" },
                diagnostics = { globals = { "vim", "Snacks" } },
                runtime = { version = "LuaJIT" },
                telemetry = { enable = false },
                workspace = { checkThirdParty = false },
              },
            },
          },
          ts_ls = {
            initializationOptions = {
              preferences = { includeCompletionsForModuleExports = false },
            },
          },
          tailwindcss = {
            filetypes = { "react", "svelte", "vue", "html", "templ" },
          },
        },

        diagnostics = {
          severity_sort = true,
          underline = false,
          update_in_insert = false,
          virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "●",
          },
        },

        diagnostic_icons = {
          Error = " ",
          Warn = " ",
          Hint = " ",
          Info = " ",
        },

        ensure_installed = ensure_installed,
      }
    end,

    config = function(_, opts)
      local diag = vim.diagnostic
      local kmap = vim.keymap.set
      local fn = vim.fn
      local api = vim.api

      -- Define Diagnostic Signs
      for type, icon in pairs(opts.diagnostic_icons) do
        fn.sign_define(type, { text = icon, texthl = "DiagnosticSign" .. type })
      end

      diag.config(opts.diagnostics)

      -- Diagnostic Keybindings
      kmap("n", "[d", diag.goto_prev, { desc = "Previous diagnostic" })
      kmap("n", "]d", diag.goto_next, { desc = "Next diagnostic" })
      kmap("n", "<leader>de", diag.open_float, { desc = "Diagnostic float" })
      kmap("n", "<leader>dq", diag.setloclist, { desc = "Diagnostic quickfix" })

      -- LSP Attach Autocommand
      api.nvim_create_autocmd("LspAttach", {
        desc = "LSP keybindings",
        group = api.nvim_create_augroup("nvbolt_lsp_attach", { clear = true }),
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if not client then
            return
          end
          local buf = event.buf

          local bmap = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
          end

          bmap("K", vim.lsp.buf.hover, "Hover")
          bmap("<F2>", vim.lsp.buf.rename, "Rename")
          bmap("<leader>ca", function()
            vim.lsp.buf.code_actions()
          end, "Code actions")
          bmap("gd", function()
            Snacks.picker.lsp_definitions()
          end, "Go to definition")
          bmap("gD", function()
            Snacks.picker.lsp_declarations()
          end, "Go to declaration")
          bmap("gi", function()
            Snacks.picker.lsp_implementations()
          end, "Go to implementation")
          bmap("gt", function()
            Snacks.picker.lsp_type_definitions()
          end, "Go to type definition")
          bmap("gr", function()
            Snacks.picker.lsp_references()
          end, "Go to references")
          bmap("<leader>ds", function()
            Snacks.picker.lsp_symbols()
          end, "Document symbols")
          bmap("<leader>ws", function()
            Snacks.picker.lsp_workspace_symbols()
          end, "Workspace symbols")
        end,
      })

      -- Setup Mason
      local ok_mason, mason = pcall(require, "mason")
      if ok_mason then
        mason.setup({ install_root_dir = fn.stdpath("cache") .. "/mason" })
      end

      -- Setup Mason Tool Installer
      local ok_installer, installer = pcall(require, "mason-tool-installer")
      if ok_installer then
        installer.setup({ ensure_installed = opts.ensure_installed })
      end

      -- Setup LSP servers
      local blink_cmp = require("blink.cmp")
      local capabilities = blink_cmp.get_lsp_capabilities()

      local ok_mason_lsp, mason_lsp = pcall(require, "mason-lspconfig")
      local ok_lspconfig, lspconfig = pcall(require, "lspconfig")

      if ok_mason_lsp and ok_lspconfig then
        mason_lsp.setup({
          handlers = {
            function(server)
              local server_opts = vim.tbl_deep_extend("force", {
                capabilities = capabilities,
              }, opts.servers[server] or {})
              lspconfig[server].setup(server_opts)
            end,
          },
        })
      end
    end,
  },
}
