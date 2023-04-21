vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>w", "<Cmd>w<CR>")
vim.keymap.set("n", "<Leader>;", "<Cmd>set list!<CR>")

-- Window
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Tab movement
vim.keymap.set("n", "<Leader>n", "<Cmd>tabprev<CR>")
vim.keymap.set("n", "<Leader>m", "<Cmd>tabnext<CR>")

-- File explorer
vim.keymap.set("n", "<Leader>ee", "<Cmd>Explore<CR>")
vim.keymap.set("n", "<Leader>eh", "<Cmd>Vexplore<CR>")
vim.keymap.set("n", "<Leader>el", "<Cmd>Vexplore!<CR>")
vim.keymap.set("n", "<Leader>ej", "<Cmd>Hexplore<CR>")
vim.keymap.set("n", "<Leader>ek", "<Cmd>Hexplore!<CR>")
vim.keymap.set("n", "<Leader>et", "<Cmd>Texplore<CR>")

-- Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<Leader>dd", "<Cmd>terminal<CR>")
vim.keymap.set("n", "<Leader>dh", "<Cmd>topleft vsplit <Bar> terminal<CR>")
vim.keymap.set("n", "<Leader>dl", "<Cmd>botright vsplit <Bar> terminal<CR>")
vim.keymap.set("n", "<Leader>dj", "<Cmd>botright split <Bar> terminal<CR>")
vim.keymap.set("n", "<Leader>dk", "<Cmd>topleft split <Bar> terminal<CR>")
vim.keymap.set("n", "<Leader>dt", "<Cmd>tabe <Bar> terminal<CR>")

-- Auto completion
vim.keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible == 1 and "<C-y>" or "<Tab>"
end, { expr = true })

vim.keymap.set({ "n", "v" }, "<Leader>df", function()
  vim.lsp.buf.format({ async = true })
end)
