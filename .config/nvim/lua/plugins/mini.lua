return {
  {
    "echasnovski/mini.pairs",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },
  {
    "echasnovski/mini.ai",
    config = function(_, opts)
      require("mini.ai").setup(opts)
    end,
  },
}
