return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help"
	},
	opts = function()
		local nvim_cmp = require("cmp")
		return {
			sources = {
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
			},
			mapping = nvim_cmp.mapping.preset.insert({
				["<c-j>"] = nvim_cmp.mapping.select_next_item(),
				["<c-k>"] = nvim_cmp.mapping.select_prev_item(),
				["<c-y>"] = nvim_cmp.mapping.confirm({ select = true }),
			})
		}
	end
}
