vim.diagnostic.config({ virtual_text = true })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
