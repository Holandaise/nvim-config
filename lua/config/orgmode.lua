local ok, orgmode = pcall(require, "orgmode")
if not ok then
    return
end

require('orgmode').setup_ts_grammar()

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {'org'},
        additional_vim_regex_highlighting = {'org'},
    },
}

require('orgmode').setup({
    org_agenda_files = {"~/org/*"},
    org_default_notes_file = '~/org/notes.org',
})
