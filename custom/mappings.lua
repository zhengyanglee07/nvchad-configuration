---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.lazygit = {
  n = {
    ["<leader>gl"] = { "<cmd> LazyGit <CR>", "Lazy Git" },
  },
}

M.neotest = {
  n = {
    ["<leader>tr"] = {
      "<ESC><cmd>lua require('neotest').run.run()<CR>",
      "Run Nearest",
    },
    ["<leader>tt"] = {
      "<ESC><cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
      "Run Test Files",
    },
    ["<leader>tT"] = {
      "<ESC><cmd>lua require('neotest').run.run(vim.loop.cwd())<CR>",
      "Run All Test Files",
    },
    ["<leader>ts"] = {
      "<ESC><cmd>lua require('neotest').summary.toggle()<CR>",
      "Toggle Summary",
    },
    ["<leader>to"] = {
      "<ESC><cmd>lua require('neotest).output.open({ enter = true, auto_close = true })<CR>",
      "Show Output",
    },
    ["<leader>tO"] = {
      "<ESC><cmd>lua require('neotest').output_panel.toggle()<CR>",
      "Toggle Output Panel",
    },
    ["<leader>tS"] = {
      "<ESC><cmd>lua require('neotest').run.stop()<CR>",
      "Stop",
    },
  },
}
-- more keybinds!

return M
