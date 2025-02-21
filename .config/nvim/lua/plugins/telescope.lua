return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = function()
		local builtin = require("telescope.builtin")
		return {
			{ "<leader>ff", function() builtin.find_files() end },
			{ "<leader>fF", function() builtin.find_files({ cwd = vim.fn.input("path: ", "", "file") }) end },
			{ "<leader>fg", function() builtin.live_grep() end },
			{ "<leader>fG", function() builtin.live_grep({ grep_open_files = true }) end },
			{ "<leader>fb", function() builtin.buffers() end },
			{ "<leader>fq", function() builtin.quickfix() end },
		}
	end,
	opts = {},
}
