-- _   _                 _
--| \ | | ___  _____   _(_)_ __ ___
--|  \| |/ _ \/ _ \ \ / / | '_ ` _ \
--| |\  |  __/ (_) \ V /| | | | | | |
--|_| \_|\___|\___/ \_/ |_|_| |_| |_|

-- NeoVim configuration file
vim.cmd([[colorscheme onedarker]])
-- :help options
vim.opt.backup = false
vim.opt.fileencoding = "utf-8"
vim.opt.completeopt = { "menu", "menuone", "noinsert" }
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = false
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 3
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.termguicolors = true
vim.opt.list = true

-- import other lua files
require("config.plugins")
require("config.cmp")
require("config.lsp")
require("config.keymap")
require("config.treesitter")
require("config.autopairs")
require("config.nvim-tree")
require("config.toggleterm")
require("config.lualine")
require("config.neogit")

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])

P = function(x)
end
