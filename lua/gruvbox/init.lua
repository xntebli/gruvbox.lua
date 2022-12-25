local M = {}

M.configs = {
  contrast_dark = "medium",
  contrast_light = "medium",

  bold = true,
  italic = false,
  underline = true,
  undercurl = true,
  inverse = true,

  italicize_comments = true,
  italicize_strings = false,
  italicize_operators = false,

  invert_selection = true,
  invert_signs = false,
  invert_indent_guides = false,
  invert_tabline = false,

  improved_strings = false,
  improved_warnings = false,

  hls_cursor = "orange",
  hls_highlight = "yellow",
  number_column = "NONE",
  sign_column = "bg1",
  color_column = "bg1",
  cursorline = "bg1",
  vert_split = "bg0",
  tabline_sel = "green",
}

M.setup = function(opts)
  M.configs = vim.tbl_extend("force", M.configs, opts or {})

  if opts.inverse == false then
    M.configs.invert_selection = false
  end

  if opts.italic == false then
    M.configs.italicize_comments = false
  end
end

M.load = function()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.g.colors_name = "gruvbox"
  vim.opt.termguicolors = true

  local colors = require("gruvbox.colors").setup(M.configs)
  local hlgroups = require("gruvbox.hlgroups").setup(colors, M.configs)

  for group, settings in pairs(hlgroups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
