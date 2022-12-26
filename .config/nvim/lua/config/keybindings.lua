vim.g.mapleader = ' '

vim.keymap.set('i', '<Tab>', function()
    return vim.fn.pumvisible == 1 and '<C-y>' or '<Tab>'
end, {expr = true})
