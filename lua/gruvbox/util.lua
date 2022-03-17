local M = {}

M.syntax = function(hlgroups)
  for group, opt in pairs(hlgroups) do
    if type(opt) == "table" then
      local style = opt.gui and "gui=" .. opt.gui or "gui=NONE"
      local fg = opt.fg and "guifg=" .. opt.fg or "guifg=NONE"
      local bg = opt.bg and "guibg=" .. opt.bg or "guibg=NONE"
      local sp = opt.sp and "guisp=" .. opt.sp or ""

      vim.cmd("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp .. " cterm=NONE")
    else
      vim.cmd(string.format("highlight! link %s %s", group, opt))
    end
  end
end

M.terminal = function(colors)
  vim.g.terminal_color_0 = colors.bg0
  vim.g.terminal_color_8 = colors.gray
  vim.g.terminal_color_1 = colors.neutral_red
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_2 = colors.neutral_green
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_3 = colors.neutral_yellow
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_4 = colors.neutral_blue
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_5 = colors.neutral_purple
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_6 = colors.neutral_aqua
  vim.g.terminal_color_14 = colors.aqua
  vim.g.terminal_color_7 = colors.fg4
  vim.g.terminal_color_15 = colors.fg1
end

-- check if vim.g.gruvbox_* color exists in current palette,
-- return default color otherwise
M.get_color_from_opt = function(opt, default, colors)
  if opt == nil then
    return colors[default]
  end

  local c = colors[opt]
  if c == nil then
    print(string.format("%s color could not be found, using default", opt))

    return colors[default]
  end

  return c
end

return M
