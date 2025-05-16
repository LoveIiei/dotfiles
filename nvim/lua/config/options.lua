-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.filetype.add({
  extension = {
    typ = "typst",
  },
})

vim.g.formatter_python = { "ruff" }

vim.diagnostic.config({
  virtual_text = { severity = { max = vim.diagnostic.severity.WARN } },
  virtual_lines = { current_line = true, severity = { min = vim.diagnostic.severity.ERROR } },
})
