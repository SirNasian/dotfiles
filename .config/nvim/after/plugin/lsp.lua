vim.lsp.enable("clangd")
vim.lsp.enable("cmake")
vim.lsp.enable("csharp_ls")
vim.lsp.enable("eslint")
vim.lsp.enable("gdscript")
vim.lsp.enable("glsl_analyzer")
vim.lsp.enable("html")
vim.lsp.enable("intelephense")
vim.lsp.enable("jsonls")
vim.lsp.enable("pyright")
vim.lsp.enable("ts_ls")

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					'vim',
					'require'
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP Keybindings",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "K",  vim.lsp.buf.hover,           opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition,      opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration,     opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation,  opts)
		vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references,      opts)
		vim.keymap.set("n", "gs", vim.lsp.buf.signature_help,  opts)
		vim.keymap.set("n", "gR", vim.lsp.buf.rename,          opts)
		vim.keymap.set("n", "ga", vim.lsp.buf.code_action,     opts)
		vim.keymap.set("n", "gq", vim.diagnostic.setqflist,    opts)
	end,
})
