return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {
          filetypes = { "typst" },
          root_dir = function(fname)
            return require("lspconfig.util").find_git_ancestor(fname) or vim.fn.getcwd()
          end,
        },
      },
    },
  },
}
