return {
  {
    "mhartington/formatter.nvim",
    opts = function()
      return {
        logging = false,
        filetype = {
          lua = { require("formatter.filetypes.lua").stylua },
        },
      }
    end,
    config = function(_, opts)
      require("formatter").setup(opts)
      vim.keymap.set({ "n", "v" }, "<Leader>df", function()
        if opts.filetype[vim.bo.filetype] ~= nil then
          vim.cmd([[Format]])
        else
          vim.lsp.buf.format({ async = true })
        end
      end)
    end,
  },
}
