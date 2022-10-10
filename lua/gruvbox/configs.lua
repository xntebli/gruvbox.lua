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
  vert_split = "bg0",
  tabline_sel = "green",
}

M.setup = function(opts)
  local configs = vim.tbl_extend("force", M.configs, opts or {})
  if not opts.inverse then
    configs.invert_selection = false
  end

  if not opts.italic then
    configs.italicize_comments = false
  end

  return configs
end

return M
