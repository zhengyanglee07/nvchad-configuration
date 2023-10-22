local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- Refer: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "volar", "intelephense", "tailwindcss" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}

lspconfig.volar.setup {
  init_options = {
    typescript = {
      tsdk = "/mnt/c/Users/zheng/AppData/Roaming/npm/node_modules/typescript/lib",
    },
  },
}
