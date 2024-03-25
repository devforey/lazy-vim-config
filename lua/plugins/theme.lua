return {
  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        -- ...
      })

      vim.cmd("colorscheme github_light_high_contrast")

      -- Changes color of VertSplit highlights; highlights
      -- are Nvim's way of customizing colors
      -- Highlight reference: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/v2.x/doc/neo-tree.txt

      vim.cmd([[hi VertSplit guifg=#A0A0A0 guibg=#FFFFFF]])
      vim.cmd([[hi StatusLine guibg=#FFFFFF]])
    end,
  },
}
