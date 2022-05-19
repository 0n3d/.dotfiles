local setup = {
  settings = {
    Lua = {
      runtime = {
        version = 'Lua 5.4',
        path = {
          '?.lua',
          '?/init.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.4/?.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.4/?/init.lua',
          vim.fn.expand'./lua_modules/share/lua/5.4/?.lua',
          vim.fn.expand'./lua_modules/share/lua/5.4/?/init.lua',
          '/usr/share/lua/5.4/?.lua',
          '/usr/share/lua/5.4/?/init.lua',
        }
      },
      workspace = {
        library = {
          vim.fn.expand'~/.luarocks/share/lua/5.4',
          '/usr/share/lua/5.4'
        }
      }
    }
  }
}

return setup
