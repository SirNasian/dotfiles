return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = function()
		local builtin = require("telescope.builtin")
		return {
			{ "<leader>ff", function() builtin.find_files({ no_ignore = true }) end, { desc = "Telescope find files" } },
			{ "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" } },
			{ "<leader>fb", builtin.buffers, { desc = "Telescope buffers" } }
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
