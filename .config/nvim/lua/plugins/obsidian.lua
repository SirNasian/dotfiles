return {
	"epwalsh/obsidian.nvim",
	keys = {
		{ "<leader>nos", function() vim.cmd("ObsidianQuickSwitch") end },
		{ "<leader>noj", function() vim.cmd("ObsidianDailies") end },
		{ "<leader>non", function() vim.cmd("ObsidianNew") end },
		{ "<leader>no/", function() vim.cmd("ObsidianSearch") end },
	},
	opts = {
		workspaces = { { name = "notes", path = "~/.obsidian/notes" } },
		daily_notes = { folder = "daily-notes" },
		follow_url_func = function (url) vim.fn.jobstart({ "xdg-open", url }) end,
		note_id_func = function(title) return title end,
		disable_frontmatter = true,
	},
}
