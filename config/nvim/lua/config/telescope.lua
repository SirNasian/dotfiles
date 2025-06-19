local git = require("custom.git-telescope")
vim.keymap.set('n', '<leader>gb', git.checkout_branch, { silent = true })
vim.keymap.set('n', '<leader>gm', git.merge_branch, { silent = true })
