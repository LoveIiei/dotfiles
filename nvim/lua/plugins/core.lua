return {
  -- Desiable not use plugins
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  { "echasnovski/mini.ai", enabled = false },
  { "catppuccin/nvim", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },
  -- { "nvim-lualine/lualine.nvim", enabled = false },

  -- Add some perfered ones
  -- { "echasnovski/mini.comment", version = false },
  -- {
  --   "echasnovski/mini.files",
  --   version = false,
  --   opts = {
  --     options = {
  --       use_as_default_explorer = true,
  --     },
  --   },
  -- },
  -- {
  --   "echasnovski/mini.statusline",
  --   version = false,
  --   config = function()
  --     require("mini.statusline").setup()
  --   end,
  -- },
}
