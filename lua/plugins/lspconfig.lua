return {
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    -- dependencies = {
    --   "jose-elias-alvarez/typescript.nvim",
    --   init = function()
    --     require("lazyvim.util").on_attach(function(_, buffer)
    --       -- stylua: ignore
    --       vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
    --       vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
    --     end)
    --   end,
    -- },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- For projects with Angular
        angularls = {},
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        -- tsserver = {},
        cssls = {},
        -- eslint = {},
        -- volar = {},
        tailwindcss = {
          filetypes_exclude = { "markdown" },
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- eslint = function()
        --   require("lazyvim.util").on_attach(function(client)
        --     if client.name == "eslint" then
        --       client.server_capabilities.documentFormattingProvider = true
        --     elseif client.name == "tsserver" then
        --       client.server_capabilities.documentFormattingProvider = false
        --     end
        --   end)
        -- end,
        angularls = function()
          require("lspconfig").angularls.setup({})
        end,
        tailwindcss = function(_, opts)
          local tw = require("lspconfig.server_configurations.tailwindcss")
          --- @param ft string
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, tw.default_config.filetypes)
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },
}
