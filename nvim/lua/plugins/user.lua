return {
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {
      config = {
        cmd = {
          "dotnet",
          vim.fn.expand("~/.local/share/roslyn-ls/Microsoft.CodeAnalysis.LanguageServer.dll"),
          "--logLevel=Information",
          "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
          "--stdio",
        },
      },
    },
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    -- opts = {}
  },

  {
    "OXY2DEV/markview.nvim",
    -- lazy = false, -- Recommended
    ft = { "markdown", "html" }, -- If you decide to lazy-load anyway
    preview = {
      icon_provider = "mini",
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "kawre/leetcode.nvim",
    cmd = "Leet",
    build = ":TSUpdate html",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- configuration goes here
      ---@type lc.lang
      lang = "python3",

      ---@type lc.storage
      storage = {
        home = vim.fn.expand("~/Documents/leetcode"),
        cache = vim.fn.expand("~/.cache/leetcode"),
      },
      ---@type lc.picker
      picker = { provider = "fzf-lua" },
    },
  },
  -- {
  --"pmizio/typescript-tools.nvim",
  --dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --f  = { "typescript", "typescriptreact," },
  --opts = {},
  --},
  ----{
  --"R-nvim/R.nvim",
  -- Only required if you also set defaults.lazy = true
  --ft = "r",
  -- R.nvim is still young and we may make some breaking changes from time
  -- to time. For now we recommend pinning to the latest minor version
  -- like so:
  --version = "~0.1.0",
  --},
  -- {
  --   "kaarmu/typst.vim",
  --   ft = "typst",
  -- },
  --   {
  --     "EdenEast/nightfox.nvim",
  --     config = function()
  --       require("nightfox").setup({
  --         options = {
  --           styles = {
  --             comments = "italic",
  --             keyword = "bold",
  --             types = "italic,bold",
  --           },
  --         },
  --       })
  --     end,
  --   }, -- lazy
}
