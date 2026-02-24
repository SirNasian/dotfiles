return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = function()
		require("nvim-treesitter.config").setup({
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
