return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	config = true,
	keys = {
		{ "<leader>noi", ":Neorg index<cr>" },
		{ "<leader>noj", ":Neorg journal toc open<cr>" },
		{ "<leader>not", ":Neorg journal today<cr>" },
		{ "<leader>noT", ":Neorg journal tomorrow<cr>" },
		{ "<leader>noy", ":Neorg journal yesterday<cr>" },
	},
	opts = {
		load = {
			["core.completion"] = {
				config = {
					engine = "nvim-cmp"
				}
			},
			["core.concealer"] = {
				config = {
					folds = false,
					icon_preset = "diamond"
				}
			},
			["core.defaults"] = {},
			["core.highlights"] = {},
			["core.dirman"] = {
				config = {
					default_workspace = "notes",
					index = "index.norg",
					workspaces = {
						notes = "~/.notes"
					}
				}
			},
		}
	}
}
