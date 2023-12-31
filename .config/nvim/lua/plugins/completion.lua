return {
  {
    "hrsh7th/nvim-cmp",
    version = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "github/copilot.vim",
    },
    opts = function()
      local cmp = require("cmp")
      return {
        mapping = cmp.mapping.preset.insert({
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({
                behavior = cmp.SelectBehavior.Insert,
              })
            else
              cmp.complete()
            end
          end, { "i", "s" }),
          ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({
                behavior = cmp.SelectBehavior.Insert,
              })
            else
              cmp.complete()
            end
          end, { "i", "s" }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() and cmp.get_selected_entry() then
              cmp.confirm()
            elseif cmp.visible() then
              cmp.confirm({ select = true })
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<C-j>"] = cmp.mapping(function(fallback)
            cmp.abort()
            local copilot_keys = vim.fn["copilot#Accept"]("")
            if copilot_keys ~= "" then
              vim.api.nvim_feedkeys(copilot_keys, "i", true)
            else
              fallback()
            end
          end, { "i" }),
          ["<C-h>"] = cmp.mapping(function(fallback)
            cmp.abort()
            vim.fn["copilot#Previous"]()
          end, { "i" }),
          ["<C-l>"] = cmp.mapping(function(fallback)
            cmp.abort()
            vim.fn["copilot#Next"]()
          end, { "i" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      }
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },
}
