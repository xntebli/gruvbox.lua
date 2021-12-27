local theme = require "gruvbox.theme"
local util = require "gruvbox.util"
local colors = require "gruvbox.colors"

local M = {}

M.load = function()
  if vim.g.colors_name then
    vim.cmd "hi clear"
  end

  vim.g.colors_name = "gruvbox"

  local groups = theme.groups(colors)
  util.syntax(groups)
  util.terminal(colors)
end

return M
