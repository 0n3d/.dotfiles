require 'loaders.init' -- Load plugins
require 'keybindings.init'
require 'prefs.lualine'.setup()
require 'prefs.blankline'.setup()
require 'prefs.onedark'.setup()

local lsp_options = require'prefs.lsp'

--Autocompile
-- vim.cmd [[
--   augroup Packer
--     autocmd!
--     autocmd BufWritePost init.lua PackerCompile
--   augroup end
-- ]]

-- Manpager
vim.g.no_man_maps = true

--Use Clipboard
-- vim.o.clipboard = 'unnamedplus'

--Set highlight on search
vim.o.hlsearch = false
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.tabstop = 2

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme
vim.o.termguicolors = true
--vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Set Textwidth
vim.o.textwidth = 80

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'


--Enable Comment.nvim
require('Comment').setup()

--Enable Autopairs
require('nvim-autopairs').setup{}

local opts = {
  noremap = true,
  silent = true,
}

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--Toggle Terminal Mappings
vim.api.nvim_set_keymap('n', '<C-z>', '<cmd>ToggleTerminal<CR>', opts)
vim.api.nvim_set_keymap('t', '<C-z>', '<C-\\><C-n><cmd>ToggleTerminal<CR>', opts)

--Bufferline
vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>BufferLinePickClose<CR>', opts)

--Hop
vim.api.nvim_set_keymap('', 's', '<cmd>HopChar1<CR>', opts)

--Open
vim.api.nvim_set_keymap('n', '<leader>oe', '<cmd>NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>ot', '<cmd>ToggleTerminal<CR>', opts)
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', opts)

--Open Window
for _,keymap in pairs({'h', 'j', 'k', 'l'}) do
  vim.api.nvim_set_keymap('n', '<leader>ow'..keymap, '<C-w>'..keymap, opts)
end
vim.api.nvim_set_keymap('n', '<leader>owl', '<C-w>v<C-w>L', opts)
vim.api.nvim_set_keymap('n', '<leader>owk', '<C-w>s', opts)
vim.api.nvim_set_keymap('n', '<leader>owj', '<C-w>s<C-w>J', opts)
vim.api.nvim_set_keymap('n', '<leader>owh', '<C-w>v', opts)

vim.api.nvim_set_keymap('n', '<leader>vv', '<C-w>q', opts)

--Move Window
vim.api.nvim_set_keymap('n', '<leader>wh', '<C-w>H', opts)
vim.api.nvim_set_keymap('n', '<leader>wj', '<C-w>J', opts)
vim.api.nvim_set_keymap('n', '<leader>wk', '<C-w>K', opts)
vim.api.nvim_set_keymap('n', '<leader>wl', '<C-w>L', opts)


-- Git
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>Git<CR>', opts)

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Backup
vim.o.backup = false
vim.o.writebackup = false

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- Diagnostic keymaps
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

-- LSP settings
vim.diagnostic.config({
  virtual_text = false
})
local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local lsp_installer = require'nvim-lsp-installer'
local servers = lsp_installer.get_installed_servers()

for _, server in pairs(servers) do
  local options = server:get_default_options()

  for k, v in pairs(lsp_options.default) do
    options[k] = v
  end

  if type(lsp_options[server.name]) == 'table' then
    for k, v in pairs(lsp_options[server.name]) do
      options[k] = v
    end
  end

  server:setup(options)
end

-- luasnip setup
require 'luasnip.loaders.from_vscode'.load()
require("luasnip.loaders.from_snipmate").load()
local luasnip = require 'luasnip'

vim.api.nvim_set_keymap('i', '<C-n>', '<cmd>lua require"luasnip".expand_or_jump()<CR>', opts)
vim.api.nvim_set_keymap('i', '<C-l>', '<cmd>lua require"luasnip".jump(-1)<CR>', opts)

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- elseif luasnip.expand_or_jumpable() then
      --   luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      -- elseif luasnip.jumpable(-1) then
      --   luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    {
      name = 'path',
      option = {
        trailing_slash = true,
      },
    },
    { name = 'buffer' }
  },
}
-- vim: ts=2 sts=2 sw=2 et
