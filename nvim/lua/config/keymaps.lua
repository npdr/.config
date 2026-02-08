local map = vim.keymap.set
vim.g.mapleader = " "

map("n", "<leader>e", "<cmd>Oil<CR>", opts)
map("n", "<leader>w", "<cmd>update<cr>")
map("n", "<leader>q", ":quit<cr>")
map("n", "<Esc>", ":noh<CR>")
map("n", "<leader>w", "<cmd>update<cr>")
map("n", "<leader>ch", "<cmd>checkhealth<cr>")
map("n", "<leader>L", "<cmd>Lazy<cr>")
map("n", "<leader>M", "<cmd>Mason<cr>")
map("n", "<leader>qq", ":wqa<CR>")
map("n", "<leader>o", function()
	vim.cmd("update")
	vim.cmd("source %")
end)
map({ "n", "x" }, "<leader>y", '"+y')
map({ "n", "x" }, "<leader>d", '"+d')
map("n", "<leader>kf", vim.lsp.buf.format)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

map("n", "<leader>rl", function() --toggle relative vs absolute line numbers
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
		vim.wo.number = true
	else
		vim.wo.relativenumber = true
	end
end)
