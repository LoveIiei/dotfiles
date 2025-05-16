return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.ltex = {
        filetypes = { "tex", "bib", "markdown", "org", "plaintex", "typst", "text" },
        settings = {
          ltex = {
            language = "en-US",
            checkFrequency = "save",
            dictionary = {
              ["en-US"] = {
                "Neovim",
                "Hua",
                "Weiyuan",
              },
            },
          },
        },
      }
    end,
  },
}
