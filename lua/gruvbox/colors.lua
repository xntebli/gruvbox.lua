local M = {}

M.setup = function(configs)
  local bg = vim.o.background

  local colors = {
    dark0_hard = "#1d2021",
    dark0 = "#282828",
    dark0_soft = "#32302f",
    dark1 = "#3c3836",
    dark2 = "#504945",
    dark3 = "#665c54",
    dark4 = "#7c6f64",
    light0_hard = "#f9f5d7",
    light0 = "#fbf1c7",
    light0_soft = "#f2e5bc",
    light1 = "#ebdbb2",
    light2 = "#d5c4a1",
    light3 = "#bdae93",
    light4 = "#a89984",
    bright_red = "#fb4934",
    bright_green = "#b8bb26",
    bright_yellow = "#fabd2f",
    bright_blue = "#83a598",
    bright_purple = "#d3869b",
    bright_aqua = "#8ec07c",
    bright_orange = "#fe8019",
    neutral_red = "#cc241d",
    neutral_green = "#98971a",
    neutral_yellow = "#d79921",
    neutral_blue = "#458588",
    neutral_purple = "#b16286",
    neutral_aqua = "#689d6a",
    neutral_orange = "#d65d0e",
    faded_red = "#9d0006",
    faded_green = "#79740e",
    faded_yellow = "#b57614",
    faded_blue = "#076678",
    faded_purple = "#8f3f71",
    faded_aqua = "#427b58",
    faded_orange = "#af3a03",
    gray = "#928374",
  }

  local bg0 = colors.dark0
  local bg1 = colors.dark1
  local bg2 = colors.dark2
  local bg3 = colors.dark3
  local bg4 = colors.dark4

  local fg0 = colors.light0
  local fg1 = colors.light1
  local fg2 = colors.light2
  local fg3 = colors.light3
  local fg4 = colors.light4

  local red = colors.bright_red
  local green = colors.bright_green
  local yellow = colors.bright_yellow
  local blue = colors.bright_blue
  local purple = colors.bright_purple
  local aqua = colors.bright_aqua
  local orange = colors.bright_orange
  local gray = colors.gray

  if bg == "light" then
    bg0 = colors.light0
    bg1 = colors.light1
    bg2 = colors.light2
    bg3 = colors.light3
    bg4 = colors.light4
    fg0 = colors.dark0
    fg1 = colors.dark1
    fg2 = colors.dark2
    fg3 = colors.dark3
    fg4 = colors.dark4
    red = colors.faded_red
    green = colors.faded_green
    yellow = colors.faded_yellow
    blue = colors.faded_blue
    purple = colors.faded_purple
    aqua = colors.faded_aqua
    orange = colors.faded_orange
  end

  if configs.contrast_dark ~= "medium" then
    bg0 = colors[bg .. "0_" .. configs.contrast_dark]
  end

  if configs.contrast_light ~= "medium" then
    bg0 = colors[bg .. "0_" .. configs.contrast_light]
  end

  colors.bg0 = bg0
  colors.bg1 = bg1
  colors.bg2 = bg2
  colors.bg3 = bg3
  colors.bg4 = bg4
  colors.gray = gray
  colors.fg0 = fg0
  colors.fg1 = fg1
  colors.fg2 = fg2
  colors.fg3 = fg3
  colors.fg4 = fg4
  colors.red = red
  colors.green = green
  colors.yellow = yellow
  colors.blue = blue
  colors.purple = purple
  colors.aqua = aqua
  colors.orange = orange
  colors.NONE = "NONE"

  return colors
end

return M
