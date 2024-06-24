return {
  "lukas-reineke/indent-blankline.nvim",
  events = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = function(_, opts)
    return require("indent-rainbowline").make_opts(opts)
  end,
  dependencies = {"TheGLander/indent-rainbowline.nvim"},
}
