local colors = require("gruvbox.colors").setup()

return {
  normal = {
    a = { bg = colors.fg4, fg = colors.bg0, gui = "bold" },
    b = { bg = colors.bg2, fg = colors.fg4 },
    c = { bg = colors.bg1, fg = colors.fg4 },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.bg0, gui = "bold" },
    b = { bg = colors.bg2, fg = colors.fg1 },
    c = { bg = colors.bg1, fg = colors.fg4 },
  },
  visual = {
    a = { bg = colors.orange, fg = colors.bg0, gui = "bold" },
    b = { bg = colors.bg4, fg = colors.bg0 },
    c = { bg = colors.bg1, fg = colors.fg4 },
  },
  replace = {
    a = { bg = colors.aqua, fg = colors.bg0, gui = "bold" },
    b = { bg = colors.bg2, fg = colors.fg1 },
    c = { bg = colors.bg1, fg = colors.fg4 },
  },
  command = {
    a = { bg = colors.green, fg = colors.bg0, gui = "bold" },
    b = { bg = colors.bg2, fg = colors.fg1 },
    c = { bg = colors.bg1, fg = colors.fg4 },
  },
  inactive = {
    a = { bg = colors.bg1, fg = colors.bg4 },
    b = { bg = colors.bg1, fg = colors.bg4 },
    c = { bg = colors.bg1, fg = colors.bg4 },
  },
}
