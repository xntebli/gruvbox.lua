local M = {}

local opts = {
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

M.load = function()
  for key, value in pairs(opts) do
    local opt = "gruvbox_" .. key
    if vim.fn.exists("g:" .. opt) ~= 1 then
      vim.g[opt] = value
    end
  end

  if not vim.g.gruvbox_inverse then
    vim.g.gruvbox_invert_selection = false
  end

  if not vim.g.gruvbox_italic then
    vim.g.gruvbox_italicize_comments = false
  end

  if vim.g.colors_name then
    vim.cmd "hi clear"
  end

  vim.g.colors_name = "gruvbox"

  local colors = require("gruvbox.colors").setup()
  local hlgroups = require("gruvbox.hlgroups").setup(colors)

  for group, settings in pairs(hlgroups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
