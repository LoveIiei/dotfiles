-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/
vim.opt.cmdheight = 2
vim.opt.shiftwidth = 2           -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2               -- insert 2 spaces for a tab
vim.opt.guifont = "Zed Mono:h16"
vim.opt.relativenumber = false     -- relative line numbers
vim.opt.wrap = true               -- wrap lines

-- use treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.use_icons = false
vim.g.vimtex_view_method = "skim"
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 1
lvim.colorscheme = "tokyonight"
lvim.format_on_save = false

reload('user.options')
reload('user.dashboard')

lvim.plugins = {
    {
        "lervag/vimtex",
        init = function()
            -- Use init for configuration, don't use the more common "config".
        end
    },
    {
        url = 'https://github.com/adelarsq/image_preview.nvim',
        event = 'VeryLazy',
        config = function()
            require("image_preview").setup()
        end
    },
   {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    },
    {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" }
      })
    end
  },
  {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  },
}
