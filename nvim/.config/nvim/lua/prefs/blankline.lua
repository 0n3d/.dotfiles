local blankline = require 'indent_blankline'

return {
   setup = function()
    vim.opt.listchars:append("eol:↴")

    blankline.setup {
        show_end_of_line = true,
    }

    --Map blankline
    vim.g.indent_blankline_char = '|'
    vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
    vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
    vim.g.indent_blankline_show_trailing_blankline_indent = true
   end
}

