return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    dashboard = {
      sections = {
        {
          section = "terminal",
          cmd = "chafa ~/.config/wallpaper/gruv1.jpg --format symbols --symbols vhalf --size 60x18 --stretch; sleep .1",
          height = 18,
          padding = 1,
        },
        {
          pane = 2,
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
