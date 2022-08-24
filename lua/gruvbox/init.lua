local function set_highlights(hlgroups)
  for group, colors in pairs(hlgroups) do
    if not vim.tbl_isempty(colors) then
      vim.api.nvim_set_hl(0, group, colors)
    end
  end
end

local M = {}

M.config = {
  contrast = "medium",
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

function M.setup(config)
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

  set_highlights(hlgroups)
end

return M
