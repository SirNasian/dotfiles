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
		vim.keymap.set("n", "gq", vim.diagnostic.setloclist,   opts)
	end,
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			diagnostics = { globals = { 'vim', 'require' } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("omnisharp", {
	on_attach = function(client, bufnr)
		local _ = require("omnisharp_extended")
		local opts = { buffer = bufnr }
		vim.keymap.set("n", "gd", _.lsp_definition, opts)
		vim.keymap.set("n", "gr", _.lsp_references, opts)
	end,
	config = {
		handlers = {
			["textDocument/definition"] = require('omnisharp_extended').definition_handler,
			["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
			["textDocument/references"] = require('omnisharp_extended').references_handler,
			["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
		},
	},
})

vim.lsp.config("vue_ls", {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	init_options = { vue = { hybridMode = false } },
})

vim.lsp.enable("clangd")
vim.lsp.enable("cmake")
vim.lsp.enable("eslint")
vim.lsp.enable("gdscript")
vim.lsp.enable("glsl_analyzer")
vim.lsp.enable("html")
vim.lsp.enable("intelephense")
vim.lsp.enable("jsonls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("omnisharp")
vim.lsp.enable("pyright")
vim.lsp.enable("ts_ls")
vim.lsp.enable("vue_ls")
