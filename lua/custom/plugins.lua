local overrides = require "custom.configs.overrides"
-- INFORMATION --
--
-- Events: https://neovim.io/doc/user/autocmd.html#autocmd-list
-- set event to determine when to load plugins
-- For exp: event = 'InsertEnter', plugin will load when start insert mode


-- LAZYVIM EVENTS: https://github.com/folke/lazy.nvim#-user-events
-- VeryLazy: triggered after LazyDone and processing VimEnter auto commands
-- you can use the VeryLazy event for things that can
-- load later and are not important for the initial UI

-- Lazy load
-- { '<PLUGIN_NAME>', lazy = true } : With lazy the plugin will be automatically loaded when it is required somewhere
-- { '<PLUGIN_NAME>', lazy = false } : make sure we load this during startup
-- { ..., priority = 1000 }: make sure to load this before all the other start plugins


-- INFOTMATION (END) --


---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    -- optional for floating window border decorations
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup {}
  --   end,
  -- },
  --
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-media-files.nvim",
    },
  },

  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
