local map = vim.keymap.set
vim.g.mapleader = " "

vim.o.number = true
vim.o.termguicolors = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.diagnostic.config({virtual_text = true})

map("n", "<leader>e", ":Ex<CR>")
map("n", "<leader>qq", ":wq<CR>")
map("n", "<leader>o",function()
	vim.cmd("update")
	vim.cmd("source %")
end)
map({ "n", "x" }, "<leader>y", '"+y')
map({ "n", "x" }, "<leader>d", '"+d')

vim.pack.add{
	{ src = 'https://github.com/neovim/nvim-lspconfig'},
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
}

local telescope = require("telescope")
local builtin = require('telescope.builtin')

telescope.setup({
	pickers = {
		live_grep = {
			file_ignore_patterns = { 'node_modules', '.git', '.venv' },
			additional_args = function(_)
				return { "--hidden" }
			end
		},
		find_files = {
			file_ignore_patterns = { 'node_modules', '.git', '.venv' },
			hidden = true
		}	},
	})

	vim.keymap.set('n', '<leader>p', builtin.find_files, { desc = 'Telescope find files' })
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

	require("vague").setup()
	vim.cmd("colorscheme vague")

	require("mason").setup()
	vim.lsp.enable({"lua_ls", "solargraph", "ts_ls"})
