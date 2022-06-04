local fn = vim.fn

-- Auto install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- auto source after saving
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- protected call so no error on first call
local packer = require("packer")
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- packer popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install plugins here
return packer.startup(function(use)
    -- Plugins here
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "lunarvim/colorschemes"
    use "windwp/nvim-autopairs"

    -- helper for configuring LSP servers
    -- lsp/init.lua
    use "neovim/nvim-lspconfig"
    -- lsp for lua
    use "sumneko/lua-language-server"
    -- Completion plugins
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    -- File explorer
    use "kyazdani42/nvim-tree.lua"

    -- TreeSitter does something cool I guess
    use {
        "nvim-treesitter/nvim-treesitter",
        run = 'TSUpdate',
    }

    -- Toggleterm
    use "akinsho/toggleterm.nvim"

    -- statusline
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    -- magit clone for neovim
    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
    }

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
