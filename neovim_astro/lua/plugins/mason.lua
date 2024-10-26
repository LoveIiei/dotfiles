-- Customize Mason plugins

---@type LazySpec
return {
  -- LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "clangd",
        "gopls",
        "jsonls",
      })
    end,
  },
  -- Formatter installations
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        -- Formatters
        "stylua", -- Lua
        "black", -- Python
        "prettier", -- Web files
        "isort", -- Python imports
        "gofmt", -- Go
        "rustfmt", -- Rust
      })
    end,
  },
  -- DAP installations
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "python",
        "codelldb", -- Rust/C/C++
        "delve", -- Go
      })
    end,
  },
}
