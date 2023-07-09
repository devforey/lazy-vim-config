return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        themable = true,
        style_preset = { 4, 2 }, -- 4 = no italic, 2 = minimal
        offsets = {
          -- doesn't seem to work
          -- filetype = "neo-tree",
          -- text = "File Explorer",

          text_align = "left",
          -- separator = true,
        },
      },
    },
  },
}
