return {
  -- Auto configs for languages, can modify language options here as well
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        angularls = {},
        -- tsserver = {},
        cssls = {},
        tailwindcss = {
          filetypes_exclude = { "markdown" },
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        angularls = function()
          require("lspconfig").angularls.setup({})
        end,
      },
    },
  },

  -- Nvim Language support (providing highlighting, indenting, etc)
  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })

      opts.context_commentstring = {
        enable = true,
      }
    end,
  },
}
