-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      -- Optimize large file handling
      large_buf = {
        size = 1024 * 1024, -- 1MB (increased from 500KB for modern machines)
        lines = 10000,
        -- Add specific features to disable for large files
        features = {
          "treesitter",
          "indent_blankline",
          "lsp",
          "syntax",
        },
      },
      autopairs = true,
      cmp = true,
      diagnostics_mode = 3,
      highlighturl = true,
      notifications = false, -- Enable notifications for better feedback
    },
    -- Enhanced diagnostics configuration
    diagnostics = {
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●", -- Easier to see than the default icons
      },
      underline = true,
      update_in_insert = false, -- Reduce performance impact
      severity_sort = true, -- Show severe diagnostics first
    },
    options = {
      opt = {
        relativenumber = false,
        number = true,
        spell = false,
        signcolumn = "yes", -- Always show sign column to prevent shifting
        wrap = false,
        -- Additional useful options
        scrolloff = 8, -- Keep 8 lines visible above/below cursor
        sidescrolloff = 8, -- Keep 8 columns visible left/right of cursor
        pumheight = 10, -- Limit popup menu height
        timeoutlen = 300, -- Faster which-key popup
        updatetime = 200, -- Faster CursorHold events
        expandtab = true, -- Use spaces instead of tabs
        shiftwidth = 2, -- 2 spaces for indentation
        cursorline = true, -- Highlight current line
        ignorecase = true, -- Case insensitive search
        smartcase = true, -- Case sensitive if capital letter present
        termguicolors = true, -- True color support
        clipboard = "unnamedplus", -- Use system clipboard
        undofile = true, -- Persistent undo
        splitbelow = true, -- Split windows below
        splitright = true, -- Split windows right
      },
      g = {
        autoformat_enabled = true, -- Enable auto formatting by default
        inlay_hints_enabled = true, -- Enable inlay hints by default
        diagnostics_mode = 3, -- Show all diagnostics with virtual text
        icons_enabled = true, -- Enable icons
      },
    },
    mappings = {
      n = {
        -- Original mappings
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        ["<Leader>b"] = { desc = "Buffers" },
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" },

        -- Additional useful mappings
        -- Better window navigation
        ["<C-h>"] = { "<C-w>h", desc = "Navigate left window" },
        ["<C-j>"] = { "<C-w>j", desc = "Navigate down window" },
        ["<C-k>"] = { "<C-w>k", desc = "Navigate up window" },
        ["<C-l>"] = { "<C-w>l", desc = "Navigate right window" },

        -- Center cursor when scrolling
        -- ["<C-d>"] = { "<C-d>zz", desc = "Scroll down and center" },
        -- ["<C-u>"] = { "<C-u>zz", desc = "Scroll up and center" },

        -- Center search results
        ["n"] = { "nzzzv", desc = "Next search result and center" },
        ["N"] = { "Nzzzv", desc = "Previous search result and center" },

        -- Quick diagnostics
        -- ["gl"] = { vim.diagnostic.open_float, desc = "Line diagnostics" },
        ["[d"] = { vim.diagnostic.goto_prev, desc = "Previous diagnostic" },
        ["]d"] = { vim.diagnostic.goto_next, desc = "Next diagnostic" },

        -- Better save
        -- ["<leader>w"] = { ":w!<CR>", desc = "Save file" },
        -- ["<leader>q"] = { ":q<CR>", desc = "Quit" },

        -- Move lines in visual mode
        ["<A-j>"] = { ":m .+1<CR>==", desc = "Move line down" },
        ["<A-k>"] = { ":m .-2<CR>==", desc = "Move line up" },
      },
      v = {
        -- Stay in visual mode when indenting
        ["<"] = { "<gv", desc = "Unindent line" },
        [">"] = { ">gv", desc = "Indent line" },

        -- Move selected lines in visual mode
        ["<A-j>"] = { ":m '>+1<CR>gv=gv", desc = "Move selection down" },
        ["<A-k>"] = { ":m '<-2<CR>gv=gv", desc = "Move selection up" },
      },
      -- t = {
      --   -- Terminal mappings
      --   ["<C-h>"] = { "<C-\\><C-n><C-w>h", desc = "Terminal left window nav" },
      --   ["<C-j>"] = { "<C-\\><C-n><C-w>j", desc = "Terminal down window nav" },
      --   ["<C-k>"] = { "<C-\\><C-n><C-w>k", desc = "Terminal up window nav" },
      --   ["<C-l>"] = { "<C-\\><C-n><C-w>l", desc = "Terminal right window nav" },
      -- },
    },
  },
}
