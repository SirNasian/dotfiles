return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = function()
		local builtin = require("telescope.builtin")
		return {
			{ "<leader>ff", function() builtin.find_files({ no_ignore = true }) end },
			{ "<leader>fg", function() builtin.live_grep() end},
			{ "<leader>fG", function() builtin.live_grep({ grep_open_files = true }) end },
			{ "<leader>fb", function() builtin.buffers() end },
			{ "<leader>gb", function() builtin.git_branches() end },
		}
	end,
	opts = {
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--no-ignore"
			}
		}
	}
}
