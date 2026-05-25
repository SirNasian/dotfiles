vim.pack.add({
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" }, -- required by codecompanion & telescope
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim"},
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- required by lualine
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- required by codecompanion
	{ src = "https://github.com/olimorris/codecompanion.nvim" },
	{ src = "https://github.com/sainnhe/everforest"},
	{ src = "https://github.com/seblyng/roslyn.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/tpope/vim-repeat" },
	{ src = "https://github.com/tpope/vim-surround" },
})

require("lualine").setup()
require("oil").setup()
require("mini.icons").setup()
require("mini.notify").setup()

require("codecompanion").setup({
	interactions = {
		chat = { adapter = "claude_code" },
		cli = {
			agent = "claude_code",
			agents = {
				claude_code = {
					cmd = "claude",
					args = {},
					description = "Claude Code CLI",
					provider = "terminal",
				},
			},
		},
	},
})

require("mini.pick").setup({
	window = {
		config = function()
			local height = math.floor(0.618 * vim.o.lines)
			local width = math.floor(0.618 * vim.o.columns)
			return {
				anchor = "NW", height = height, width = width,
				row = math.floor(0.5 * (vim.o.lines - height)),
				col = math.floor(0.5 * (vim.o.columns - width)),
			}
		end,
	},
})

require("telescope").setup()
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files)
vim.keymap.set("n", "<leader>fg", telescope.live_grep)
vim.keymap.set("n", "<leader>fb", telescope.buffers)
vim.keymap.set("n", "<leader>fq", telescope.quickfix)
vim.keymap.set("n", "<leader>fF", function() telescope.find_files({ cwd = vim.fn.input("path: ", "", "file") }) end)
vim.keymap.set("n", "<leader>fG", function() telescope.live_grep({ grep_open_files = true }) end)

require("toggleterm").setup({
	open_mapping = [[<leader><leader>]],
	direction = "float",
	insert_mappings = false,
	terminal_mappings = false,
})
