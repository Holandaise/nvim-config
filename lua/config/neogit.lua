local neogit = require('neogit')

neogit.setup {}

vim.api.nvim_set_keymap("n", "<leader>go", [[<cmd>Neogit<CR>]], {})
vim.api.nvim_set_keymap("n", "<leader>gc", [[<cmd>Neogit commit<CR>]], {})
