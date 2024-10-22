-- lua/plugins/lualine.lua
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Function to get LSP client names
      local function get_lsp_clients()
        local clients = vim.lsp.get_active_clients({ bufnr = 0 })
        if #clients == 0 then
          return ""
        end
        local client_names = {}
        for _, client in pairs(clients) do
          table.insert(client_names, client.name)
        end
        return "󰒋 " .. table.concat(client_names, ", ")
      end

      -- Add LSP clients to section c
      table.insert(opts.sections.lualine_c, { get_lsp_clients })

      return opts
    end,
  },
}
