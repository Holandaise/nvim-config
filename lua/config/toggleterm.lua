local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
    return
end

toggleterm.setup({
    open_mapping = [[<C-\>]],
    shading_factor = 2,
    close_on_exit = true,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(0, 't', "<ESC>", [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
