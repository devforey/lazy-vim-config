-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.fillchars = { fold = " " }
opt.foldmethod = "indent"
opt.foldenable = false
opt.foldlevel = 99
opt.swapfile = false
vim.g.markdown_folding = 1 -- enable markdown folding
vim.g.autoformat = true

-- Prevent cursor blinking
-- This is useful for some terminal emulators that don't support cursor blinking well
opt.guicursor:append("a:blinkon0")
