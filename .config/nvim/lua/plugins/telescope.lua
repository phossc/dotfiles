return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<Leader>;", "<Cmd>Telescope live_grep<CR>" },
      { "<Leader>/", "<Cmd>Telescope current_buffer_fuzzy_find<CR>" },
      { "<Leader>f", "<Cmd>Telescope find_files<CR>" },
      { "<Leader><Space>", "<Cmd>Telescope git_files<CR>" },
      { "<Leader>gb", "<Cmd>Telescope git_branches<CR>" },
      { "<Leader>gs", "<Cmd>Telescope git_status<CR>" },
      { "<Leader>gc", "<Cmd>Telescope git_commits<CR>" },
      { "gr", "<Cmd>Telescope lsp_references<CR>" },
    },
  },
}
