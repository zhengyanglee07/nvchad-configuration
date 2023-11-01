local null_ls = require "null-ls"

local b = null_ls.builtins

-- NULL LS: BUILTINS (https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md)
-- from link above can refer sample usage, default config  and notes for formatter

local sources = {
  -- webdev stuff
  b.formatting.deno_fmt.with {
    -- Notes: args will overwrite default args builtins by null-ls
    -- Refer to builtin source of deno_fmt (https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/lua/null-ls/builtins/formatting/deno_fmt.lua) to include required options
    -- For deno_fmt, {'fmt', '-'}  is required if overwrite args
    args = { "fmt", "-", "--use-tabs", "--single-quote" }, -- command refer at https://docs.deno.com/runtime/manual/tools
  }, -- choosed deno for ts/js files cuz its very fast!

  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "vue" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
