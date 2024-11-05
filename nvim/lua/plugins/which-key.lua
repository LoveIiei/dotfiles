return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.show_help = false
    opts.ignore_warning = true
    return opts
  end,
}
