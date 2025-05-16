return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      roslyn = function(_, opts)
        local lspconfig = require("lspconfig")

        lspconfig.roslyn = {
          default_config = {
            cmd = {
              "dotnet",
              vim.fn.expand("~/.local/share/roslyn-ls/Microsoft.CodeAnalysis.LanguageServer.dll"),
              "--logLevel=Information",
              "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
              "--stdio",
            },
            filetypes = { "cs", "vb" },
            root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
            settings = {},
          },
        }

        lspconfig.roslyn.setup(opts)
        return true
      end,
    },
  },
}
