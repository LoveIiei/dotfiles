lvim.log.level = "warn"
lvim.format_on_save = false
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "css",
    "rust",
    "java",
}

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.filters.custom = {}

lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.project.detection_methods = { "lsp", "pattern" }
lvim.builtin.project.patterns = {
    ".git",
    "package-lock.json",
    "yarn.lock",
    "package.json",
    "requirements.txt",
}

vim.opt.shell = "/bin/zsh"
vim.o.linebreak = true
vim.o.wrap = false
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
lvim.format_on_save = false
lvim.builtin.telescope.defaults.path_display = {
    shorten = 4,
}
