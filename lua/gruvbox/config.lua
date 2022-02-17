local util = require "gruvbox.util"

local configs = {
  bold = 1,
  italic = 0,
  underline = 1,
  undercurl = 1,
  inverse = 1,
  contrast_dark = "medium",
  contrast_light = "medium",
  italicize_comments = 1,
  italicize_strings = 0,
  italicize_operators = 0,
  invert_selection = 1,
  invert_signs = 0,
  invert_indent_guides = 0,
  invert_tabline = 0,
  improved_strings = 0,
  improved_warnings = 0,
}

for k, val in pairs(configs) do
  local key = "gruvbox_" .. k
  if vim.g[key] == nil then
    vim.g[key] = val
  end
end

local styles = {
  bold = "bold",
  italic = "italic",
  underline = "underline",
  undercurl = "undercurl",
  inverse = "inverse",
  invert_signs = nil,
  invert_selection = "inverse",
  invert_tabline = nil,
  italic_comments = "italic",
  italic_strings = nil,
  italicize_operators = nil,
}

if not util.is_true(vim.g.gruvbox_bold) then
  styles.bold = nil
end

if not util.is_true(vim.g.gruvbox_italic) then
  styles.italic = nil
end

if not util.is_true(vim.g.gruvbox_underline) then
  styles.underline = nil
end

if not util.is_true(vim.g.gruvbox_undercurl) then
  styles.undercurl = nil
end

if not util.is_true(vim.g.gruvbox_inverse) then
  styles.inverse = nil
end

if util.is_true(vim.g.gruvbox_invert_signs) then
  styles.invert_signs = "inverse"
end

if not util.is_true(vim.g.gruvbox_invert_selection) then
  styles.invert_selection = nil
end

if util.is_true(vim.g.gruvbox_invert_tabline) then
  styles.invert_tabline = "inverse"
end

if not util.is_true(vim.g.gruvbox_italicize_comments) then
  styles.italic_comments = nil
end

if util.is_true(vim.g.gruvbox_italicize_strings) then
  styles.italic_strings = "italic"
end

if util.is_true(vim.g.gruvbox_italicize_operators) then
  styles.italicize_operators = "italic"
end

return {
  configs = configs,
  styles = styles,
}
