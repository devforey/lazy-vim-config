-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "copilot-*",
  callback = function()
    vim.opt_local.relativenumber = true

    vim.keymap.set("n", "<C-p>", function()
      local string_to_copy = require("CopilotChat").response()
      vim.cmd(":call setreg('*', '" .. string_to_copy .. "')")
    end, { buffer = true, remap = true })
  end,
})
