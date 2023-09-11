return {
  -- { "nvim-neotest/neotest-jest" },
  { "nvim-neotest/neotest-vim-test" },
  { "vim-test/vim-test" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        -- "neotest-jest",
        {
          "neotest-vim-test",
        },
      },
    },
    keys = {
      {
        "<leader>tvn",
        function()
          vim.cmd("TestNearest")
        end,
        desc = "vim-test TestNearest",
      },
      {
        "<leader>tvf",
        function()
          vim.cmd("TestFile")
        end,
        desc = "vim-test TestFile",
      },
    },
  },
}
