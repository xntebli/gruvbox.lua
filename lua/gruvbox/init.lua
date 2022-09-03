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

  overrides = {},
}

local function check_config(config)
  local contrasts = { "soft", "medium", "hard" }

  if not vim.tbl_contains(contrasts, config.contrast) then
    vim.notify_once(string.format "gruvbox: contrast invalid value", vim.log.levels.ERROR)
  end

  local style_opts = {
    "bold",
    "italic",
    "underline",
    "undercurl",
    "inverse",
    "italicize_comments",
    "italicize_strings",
    "italicize_operators",
    "invert_selection",
    "invert_signs",
    "invert_indent_guides",
    "invert_tabline",
    "improved_strings",
    "improved_warnings",
  }

  for _, opt in ipairs(style_opts) do
    if type(config[opt]) ~= "boolean" then
      vim.notify_once(string.format("gruvbox: %s should be a boolean", opt), vim.log.levels.ERROR)
    end
  end

  local hl_opts = {
    "hls_cursor",
    "hls_highlight",
    "number_column",
    "sign_column",
    "color_column",
    "vert_split",
    "tabline_sel",
  }

  local colors = require("gruvbox.colors").setup()
  local colors_name = vim.tbl_keys(colors)

  for _, opt in ipairs(hl_opts) do
    if not vim.tbl_contains(colors_name, config[opt]) then
      vim.notify_once(string.format("gruvbox: %s invalid color value", opt), vim.log.levels.ERROR)
    end
  end
end

function M.setup(config)
  M.config.italicize_comments = config.italic or M.config.italic
  M.config.invert_selection = M.config.inverse

  M.config = vim.tbl_extend("force", M.config, config or {})
  check_config(M.config)
end

M.load = function()
  if vim.g.colors_name then
    vim.cmd "hi clear"
  end

  vim.g.colors_name = "gruvbox"
  vim.opt.termguicolors = true

  local colors = require("gruvbox.colors").setup()
  local hlgroups = require("gruvbox.hlgroups").setup(colors)

  for group, settings in pairs(hlgroups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
