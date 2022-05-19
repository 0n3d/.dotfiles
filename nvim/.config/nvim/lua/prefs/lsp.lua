local sumneko = require'prefs.lsp.sumneko'

local lsp = {
  sumneko_lua = sumneko,
  default = {
    flags = {
      debounce_text_changes = 150,
    },
  },
}

return lsp

