local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<SPACE>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal mode = 'n'
--  insert mode = 'i'
--  visual mode = 'v'
--  vblock mode = 'x'
--  termnl mode = 't'
--  cmd    mode = 'c'

-- Normal
-- window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
--TODO
-- File explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-- Telescope
keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>s", ":Telescope live_grep<CR>", opts)

-- Navigate buffers
keymap("n", "<leader>bh", ":bprevious<CR>", opts)
keymap("n", "<leader>bl", ":bnext<CR>", opts)
keymap("n", "<leader>bk", ":bdelete|bprevious<CR>", opts)
-- Create vsplit
keymap("n", "<leader>wn", "<CMD>vsplit<CR>", opts)
keymap("n", "<leader>wk", "<CMD>close<CR>", opts)

-- Visual
keymap("v", "<S-k>", ":m .-2<CR>==", opts)
keymap("v", "<S-j>", ":m .+1<CR>==", opts)
