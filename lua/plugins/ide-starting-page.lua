return {
  {
    "echasnovski/mini.starter",
    opts = function()
      local pad = string.rep(" ", 22)
      local starter = require("mini.starter")
      --stylua: ignore
      local config = {
        evaluate_single = true,
        header = "Welcome, devforey!",
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
      return config
    end,
  },
}
