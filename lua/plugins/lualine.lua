return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options = {
        theme = "ayu_light",
        section_separators = { left = "", right = "" },
      }
      opts.sections = {
        lualine_a = {},
        lualine_b = { "branch" },
        lualine_x = { "encoding", "filetype" },
        lualine_y = {},
        lualine_z = {},
      }
    end,
  },
}
