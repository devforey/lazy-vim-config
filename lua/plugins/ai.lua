return {
  -- Disabling this since it has performance issue
  -- { "github/copilot.vim" },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-CR>",
            accept_word = false,
            accept_line = false,
            next = "<C-l>",
            prev = "<C-h>",
            dismiss = "<C-BS>",
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = true,
        },
        copilot_node_command = "node", -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },
  { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = "yes", -- Disable extra information (e.g: system prompt) in the response.
      language = "English", -- Copilot answer language settings when using default prompts. Default language is English.
      -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
      window = {
        layout = "horizontal",
        height = 0.2,
      },
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>cce", ":CopilotChatExplain<cr>", desc = "CopilotChat - Explain code", mode = "x" },
      { "<leader>cct", ":CopilotChatTests<cr>", desc = "CopilotChat - Generate tests", mode = "x" },
      { "<leader>cco", ":CopilotChatOptimize<cr>", desc = "CopilotChat - Optimize Code", mode = "x" },
      { "<leader>ccd", ":CopilotChatDocs<cr>", desc = "CopilotChat - Generate Docs", mode = "x" },
      { "<leader>ccf", ":CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostics", mode = "x" },
      {
        "<leader>ccq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
    },
  },
}
