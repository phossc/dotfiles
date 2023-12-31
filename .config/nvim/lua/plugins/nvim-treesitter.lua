return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = { ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp" } },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
