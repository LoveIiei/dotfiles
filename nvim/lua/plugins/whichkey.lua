return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      { "<BS>", desc = "Decrement Selection", mode = "x" },
      { "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
      { "<leader>e", "<cmd>lua require('mini.files').open()<cr>", desc = "Files", mode = "n" },
    },
  },
}
