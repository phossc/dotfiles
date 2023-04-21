return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = { ensure_installed = { "cpp", "c" } },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
