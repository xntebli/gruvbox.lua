local M = {}

M.config = {
  contrast = "medium",
  bold = true,
  italic = false,
  underline = true,
  undercurl = true,
  inverse = true,
  italicize_comments = false,
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

function M.setup(config)
  M.config.italicize_comments = config.italic or M.config.italic
  M.config.invert_selection = M.config.inverse

  M.config = vim.tbl_extend("force", M.config, config or {})
end

M.load = function()
  if vim.g.colors_name then
    vim.cmd "hi clear"
  end

  vim.g.colors_name = "gruvbox"
  vim.o.termguicolors = true

  local colors = require("gruvbox.colors").setup()
  local hlgroups = require("gruvbox.hlgroups").setup(colors)

  for group, settings in pairs(hlgroups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
