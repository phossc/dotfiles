local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
end

local create_lsp_config = function(defaults_opts, server_opts)
  local config = {}
  for k, v in pairs(defaults_opts) do
    config[k] = v
  end
  for k, v in pairs(server_opts) do
    config[k] = v
  end
  return config
end

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      defaults = {
        on_attach = on_attach,
      },
      servers = {
        clangd = {},
      },
    },
    config = function(_, opts)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      for server, server_opts in pairs(opts.servers) do
        local lsp_config = create_lsp_config(opts.defaults, server_opts)
        lsp_config.capabilities = capabilities
        require('lspconfig')[server].setup(lsp_config)
      end
    end,
  }
}

