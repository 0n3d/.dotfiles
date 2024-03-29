local blankline = require 'indent_blankline'

return {
   setup = function()
    vim.opt.list = true
    vim.opt.listchars:append "eol:↴"
    vim.opt.listchars:append "space:."

    blankline.setup {
        show_end_of_line = true,
        space_char_blankline = " ",
    }

    --Map blankline
    vim.g.indent_blankline_char = '|'
    vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
    vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
    vim.g.indent_blankline_show_trailing_blankline_indent = true
   end
}

