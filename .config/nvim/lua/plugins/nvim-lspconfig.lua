local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
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
    opts = {
      defaults = {
        on_attach = on_attach,
      },
      servers = {
        clangd = {},
      },
    },
    config = function(_, opts)
      for server, server_opts in pairs(opts.servers) do
        local lsp_config = create_lsp_config(opts.defaults, server_opts)
        require('lspconfig')[server].setup(lsp_config)
      end
    end,
  }
}

