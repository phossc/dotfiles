return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = function()
      local null_ls = require('null-ls')
      return {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.xmllint,
        },
      }
    end,
    config = function(_, opts)
      require('null-ls').setup(opts)
    end
  }
}

