return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
