-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "X", ":Bdelete<cr>", { desc = "Close Tab" })
map("n", "cgn", "*#cgn", { desc = "Search and replace under cursor, press . for next occurrence" })
map("n", "&", "^", { desc = "Move to beginning of the line" })
-- map("n", "<C-i>", ":call codeium#Chat()<cr>", { desc = "Open Codeium Chat" })

-- map("i", "<C-l>", "<Plug>(copilot-next)", { desc = "Next Copilot Suggestion" })
-- map("i", "<C-h>", "<Plug>(copilot-previous)", { desc = "Previous Copilot Suggestion" })
-- map("i", "<C-p>", "<Plug>(copilot-suggest)", { desc = "Suggest Copilot Suggestion" })

-- Unmap default keybindings that starts with `s` to remove conflict for leap plugin
vim.cmd("unmap sa")
vim.cmd("unmap sd")
vim.cmd("unmap sr")
