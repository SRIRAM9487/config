return {
  {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = {
          "html",
          "cssls",
          "tailwindcss",
          "lua_ls",
          "emmet_ls",
          "eslint",
        },
        automatic_enable = {
          exclude = {
            'jdtls'
          }
        },
      })
    end

  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      local mason_tool_installer = require("mason-tool-installer")
      mason_tool_installer.setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "pylint",
          "eslint_d",
        },
      })
    end
  },
}
