-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      autoformat = true,
      codelens = true,
      inlay_hints = true,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        -- Add specific filetypes you commonly work with
        allow_filetypes = {
          "lua",
          "rust",
          "python",
          "cpp",
          "c",
          "java",
          "tex",
          "go"
        },
        -- Add filetypes that might cause issues or you don't want auto-formatting
        ignore_filetypes = {
          "markdown", -- Often preferred to maintain manual formatting
          "text"
        },
      },
      -- Increase timeout for larger files
      timeout_ms = 2000,
      -- Add format filtering if needed
      -- filter = function(client)
      --   -- Prefer null-ls/none-ls for formatting when available
      --   local formatting_disabled = {
      --     -- "lua_ls", -- If using stylua
      --     -- "tsserver", -- If using prettier
      --   }
      --   return not vim.tbl_contains(formatting_disabled, client.name)
      -- end
    },
    servers = {
      "pyright",
      "rust_analyzer",
      "jdtls",
      "clangd",
      "texlab",
      "lua_ls", -- Added for Lua development
      "jsonls", -- Added for JSON files
      "gopls",
    },
    config = {
      -- Optimize clangd configuration
      clangd = {
        capabilities = { offsetEncoding = "utf-8" },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders"
        }
      },
      -- Add specific server configurations
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy"
            },
          }
        }
      },
    },
    -- Performance optimization for document highlights
    autocmds = {
  lsp_document_highlight = {
    cond = "textDocument/documentHighlight",
    {
      event = { "CursorHold" },
      desc = "Document Highlighting",
      callback = function() 
        local pos = vim.api.nvim_win_get_cursor(0)
        if pos[2] ~= 0 then  -- Check if not at start of line
          vim.lsp.buf.document_highlight()
        end
      end,
    },
    {
      event = { "CursorMoved", "BufLeave" },
      desc = "Document Highlighting Clear",
      callback = function() 
        vim.lsp.buf.clear_references() 
      end,
    },
  },
},
    -- Add useful keymaps
    mappings = {
      n = {
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
        ["<leader>ca"] = { function() vim.lsp.buf.code_action() end, desc = "Code actions" },
        ["<leader>rn"] = { function() vim.lsp.buf.rename() end, desc = "Rename symbol" },
        ["<leader>fd"] = { function() vim.lsp.buf.format({ async = true }) end, desc = "Format document" },
      },
    },
    -- Optimize performance with selective capability enabling
    on_attach = function(client, bufnr)
      -- Disable semantic tokens for larger files
      if vim.api.nvim_buf_line_count(bufnr) > 5000 then
        client.server_capabilities.semanticTokensProvider = nil
      end
      
      -- Disable formatting for specific clients if you're using null-ls/none-ls
      -- if client.name == "tsserver" or client.name == "lua_ls" then
      --   client.server_capabilities.documentFormattingProvider = false
      -- end
    end,
  },
}
