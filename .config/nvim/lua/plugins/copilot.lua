return {
  {
    "github/copilot.vim",
    init = function()
      vim.g.copilot_filetypes = {
        ["*"] = false,
        python = true,
        lua = true,
        c = true,
        cpp = true,
      }

      vim.g.copilot_assume_mapped = true
      vim.g.copilot_no_tab_map = true
    end,
  },
}
