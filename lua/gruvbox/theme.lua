local styles = require("gruvbox.config").styles
local util = require "gruvbox.util"

local theme = {}
theme.groups = function(colors)
  local hls_cursor = util.get_color_from_opt(vim.g.gruvbox_hls_cursor, "orange", colors)
  local hls_highlight = util.get_color_from_opt(vim.g.gruvbox_hls_highlight, "yellow", colors)
  local number_column = util.get_color_from_opt(vim.g.gruvbox_number_column, "NONE", colors)
  local sign_column = util.get_color_from_opt(vim.g.gruvbox_sign_column, "bg1", colors)
  local color_column = util.get_color_from_opt(vim.g.gruvbox_color_column, "bg1", colors)
  local vert_split = util.get_color_from_opt(vim.g.gruvbox_vert_split, "bg0", colors)
  local tabline_sel = util.get_color_from_opt(vim.g.gruvbox_tabline_sel, "green", colors)

  return {
    --
    -- Gruvbox Hi Groups
    --
    GruvboxFg0 = { fg = colors.fg0 },
    GruvboxFg1 = { fg = colors.fg1 },
    GruvboxFg2 = { fg = colors.fg2 },
    GruvboxFg3 = { fg = colors.fg3 },
    GruvboxFg4 = { fg = colors.fg4 },
    GruvboxGray = { fg = colors.gray },
    GruvboxBg0 = { fg = colors.bg0 },
    GruvboxBg1 = { fg = colors.bg1 },
    GruvboxBg2 = { fg = colors.bg2 },
    GruvboxBg3 = { fg = colors.bg3 },
    GruvboxBg4 = { fg = colors.bg4 },

    GruvboxRed = { fg = colors.red },
    GruvboxRedBold = { fg = colors.red, gui = styles.bold },
    GruvboxGreen = { fg = colors.green },
    GruvboxGreenBold = { fg = colors.green, gui = styles.bold },
    GruvboxYellow = { fg = colors.yellow },
    GruvboxYellowBold = { fg = colors.yellow, gui = styles.bold },
    GruvboxBlue = { fg = colors.blue },
    GruvboxBlueBold = { fg = colors.blue, gui = styles.bold },
    GruvboxPurple = { fg = colors.purple },
    GruvboxPurpleBold = { fg = colors.purple, gui = styles.bold },
    GruvboxAqua = { fg = colors.aqua },
    GruvboxAquaBold = { fg = colors.aqua, gui = styles.bold },
    GruvboxOrange = { fg = colors.orange },
    GruvboxOrangeBold = { fg = colors.orange, gui = styles.bold },

    GruvboxRedSign = { fg = colors.red, bg = sign_column, gui = styles.invert_signs },
    GruvboxGreenSign = { fg = colors.green, bg = sign_column, gui = styles.invert_signs },
    GruvboxYellowSign = { fg = colors.yellow, bg = sign_column, gui = styles.invert_signs },
    GruvboxBlueSign = { fg = colors.blue, bg = sign_column, gui = styles.invert_signs },
    GruvboxPurpleSign = { fg = colors.purple, bg = sign_column, gui = styles.invert_signs },
    GruvboxAquaSign = { fg = colors.aqua, bg = sign_column, gui = styles.invert_signs },
    GruvboxOrangeSign = { fg = colors.orange, bg = sign_column, gui = styles.invert_signs },

    GruvboxRedUnderline = { gui = styles.undercurl, sp = colors.red },
    GruvboxGreenUnderline = { gui = styles.undercurl, sp = colors.green },
    GruvboxYellowUnderline = { gui = styles.undercurl, sp = colors.yellow },
    GruvboxBlueUnderline = { gui = styles.undercurl, sp = colors.blue },
    GruvboxPurpleUnderline = { gui = styles.undercurl, sp = colors.purple },
    GruvboxAquaUnderline = { gui = styles.undercurl, sp = colors.aqua },
    GruvboxOrangeUnderline = { gui = styles.undercurl, sp = colors.orange },

    --
    -- General UI
    --
    Normal = { fg = colors.fg1, bg = colors.bg0 },

    CursorLine = { bg = colors.bg1 },
    CursorColumn = "CursorLine",

    TabLineFill = { fg = colors.bg4, bg = colors.bg1, gui = styles.invert_tabline },
    TabLineSel = { fg = tabline_sel, bg = colors.bg1, gui = styles.invert_tabline },
    TabLine = "TabLineFill",

    MatchParen = { bg = colors.bg3, gui = styles.bold },

    ColorColumn = { bg = color_column },
    Conceal = { fg = colors.blue },
    CursorLineNr = { fg = colors.yellow, bg = colors.bg1 },

    NonText = "GruvboxBg2",
    SpecialKey = "GruvboxFg4",

    Visual = { bg = colors.bg3, gui = styles.invert_selection },
    VisualNOS = "Visual",

    Search = { fg = hls_highlight, bg = colors.bg0, gui = styles.inverse },
    IncSearch = { fg = hls_cursor, bg = colors.bg0, gui = styles.inverse },

    QuickFixLine = { fg = colors.bg0, bg = colors.yellow, gui = styles.bold },

    Underlined = { fg = colors.blue, gui = styles.underline },

    StatusLine = { fg = colors.bg2, bg = colors.fg1, gui = styles.inverse },
    StatusLineNC = { fg = colors.bg1, bg = colors.fg4, gui = styles.inverse },

    VertSplit = { fg = colors.bg3, bg = vert_split },

    WildMenu = { fg = colors.blue, bg = colors.bg2, gui = styles.bold },

    Directory = "GruvboxGreenBold",

    Title = "GruvboxGreenBold",

    ErrorMsg = { fg = colors.bg0, bg = colors.red, gui = styles.bold },

    MoreMsg = "GruvboxYellowBold",
    ModeMsg = "GruvboxYellowBold",
    Question = "GruvboxOrangeBold",
    WarningMsg = "GruvboxRedBold",

    LineNr = { fg = colors.bg4, bg = number_column },
    SignColumn = { bg = colors.sign_column },
    Folded = { fg = colors.gray, bg = colors.bg1, gui = styles.italic },
    FoldColumn = { fg = colors.gray, bg = colors.bg1 },

    -- Gutter
    Cursor = { gui = styles.inverse },
    vCursor = "Cursor",
    iCursor = "Cursor",
    lCursor = "Cursor",

    -- Syntax Highlighting
    Special = util.is_true(vim.g.gruvbox_improved_strings) and {
      fg = colors.orange,
      bg = colors.bg1,
      gui = styles.italic_strings,
    } or "GruvboxOrange",

    Comment = { fg = colors.gray, gui = styles.italic_comments },
    Todo = { fg = "fg", gui = table.concat({ styles.bold, styles.italic }, ",") },
    Error = { fg = colors.red, gui = table.concat({ styles.bold, styles.inverse }, ",") },

    Statement = "GruvboxRed",
    Conditional = "GruvboxRed",
    Repeat = "GruvboxRed",
    Label = "GruvboxRed",
    Exception = "GruvboxRed",
    Operator = { fg = colors.orange, bg = colors.NONE, gui = styles.italicize_operators },
    Keyword = "GruvboxRed",

    Identifier = "GruvboxBlue",
    Function = "GruvboxGreenBold",

    PreProc = "GruvboxAqua",
    Include = "GruvboxAqua",
    Define = "GruvboxAqua",
    Macro = "GruvboxAqua",
    PreCondit = "GruvboxAqua",

    Constant = "GruvboxPurple",
    Character = "GruvboxPurple",
    String = not util.is_true(vim.g.gruvbox_improved_strings) and {
      fg = colors.green,
      gui = styles.italic_strings,
    } or {
      fg = colors.fg1,
      bg = colors.bg1,
      gui = styles.italic_strings,
    },
    Boolean = "GruvboxPurple",
    Number = "GruvboxPurple",
    Float = "GruvboxPurple",

    Type = "GruvboxYellow",
    StorageClass = "GruvboxOrange",
    Structure = "GruvboxAqua",
    Typedef = "GruvboxYellow",

    -- Completion Menu
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, gui = styles.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },

    -- Diffs
    DiffDelete = { fg = colors.red, bg = colors.bg0, gui = styles.inverse },
    DiffAdd = { fg = colors.green, bg = colors.bg0, gui = styles.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, gui = styles.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, gui = styles.inverse },

    -- Spelling
    SpellCap = not util.is_true(vim.g.gruvbox_improved_warnings) and "GruvboxBlueUnderline" or {
      fg = colors.green,
      gui = table.concat({ styles.bold, styles.italic }, ","),
    },
    SpellBad = "GruvboxRedUnderline",
    SpellLocal = "GruvboxAquaUnderline",
    SpellRare = "GruvboxPurpleUnderline",

    --
    --  Plugins
    --

    -- LSP
    DiagnosticError = "GruvboxRed",
    DiagnosticSignError = "GruvboxRedSign",
    DiagnosticUnderlineError = "GruvboxRedUnderline",
    DiagnosticWarn = "GruvboxYellow",
    DiagnosticSignWarn = "GruvboxYellowSign",
    DiagnosticUnderlineWarn = "GruvboxYellowUnderline",
    DiagnosticInfo = "GruvboxBlue",
    DiagnosticSignInfo = "GruvboxBlueSign",
    DiagnosticUnderlineInfo = "GruvboxBlueUnderline",
    DiagnosticHint = "GruvboxAqua",
    DiagnosticSignHint = "GruvboxAquaSign",
    DiagnosticUnderlineHint = "GruvboxAquaUnderline",
    DiagnosticFloatingError = "GruvboxRed",
    DiagnosticFloatingWarn = "GruvboxOrange",
    DiagnosticFloatingInfo = "GruvboxBlue",
    DiagnosticFloatingHint = "GruvboxAqua",
    DiagnosticVirtualTextError = "GruvboxRed",
    DiagnosticVirtualTextWarn = "GruvboxYellow",
    DiagnosticVirtualTextInfo = "GruvboxBlue",
    DiagnosticVirtualTextHint = "GruvboxAqua",
    LspReferenceText = "GruvboxYellowBold",
    LspReferenceRead = "GruvboxYellowBold",
    LspReferenceWrite = "GruvboxOrangeBold",
    LspCodeLens = "GruvboxGray",

    -- Treesitter
    TSKeywordOperator = "GruvboxRed",

    -- GitCommit
    gitcommitSelectedFile = "GruvboxGreen",
    gitcommitDiscardedFile = "GruvboxRed",

    -- netrw
    netrwDir = "GruvboxAqua",
    netrwClassify = "GruvboxAqua",
    netrwLink = "GruvboxGray",
    netrwSymLink = "GruvboxFg1",
    netrwExe = "GruvboxYellow",
    netrwComment = "GruvboxGray",
    netrwList = "GruvboxBlue",
    netrwHelpCmd = "GruvboxAqua",
    netrwCmdSep = "GruvboxFg3",
    netrwVersion = "GruvboxGreen",

    -- Telescope
    TelescopeNormal = "GruvboxFg1",
    TelescopeSelection = "GruvboxOrangeBold",
    TelescopeSlectionCaret = "GruvboxRed",
    TelescopeMultiSelection = "GruvboxGray",
    TelescopeBorder = "TelescopeNormal",
    TelescopeMatching = "GruvboxBlue",
    TelescopePromptPrefix = "GruvboxRed",
    TelescopePrompt = "TelescopeNormal",

    -- Dirvish
    DirvishPathTail = "GruvboxAqua",
    DirvishArg = "GruvboxYellow",

    -- Neovim
    healthError = { fg = colors.bg0, bg = colors.red },
    healthSuccess = { fg = colors.bg0, bg = colors.green },
    healthWarning = { fg = colors.bg0, bg = colors.yellow },

    -- Gitsigns
    GitSignsAdd = "GruvboxGreenSign",
    GitSignsChange = "GruvboxAquaSign",
    GitSignsDelete = "GruvboxRedSign",

    -- nvim-cmp
    CmpItemAbbr = "GruvboxFg0",
    CmpItemAbbrDeprecated = "GruvboxFg0",
    CmpItemAbbrMatch = "GruvboxBlue",
    CmpItemAbbrMatchFuzzy = "GruvboxBlue",
    CmpItemKind = "GruvboxOrange",
    CmpItemMenu = "GruvboxGray",

    -- lir.nvim
    LirEmptyDirText = "GruvboxBlueSign",

    LirGitStatusBracket = "GruvboxGray",
    LirGitStatusUntracked = "GruvboxGray",
    LirGitStatusIgnored = "GruvboxGray",

    --
    --  Filetypes
    --
    -- html
    htmlTag = "GruvboxAquaBold",
    htmlEndTag = "GruvboxAquaBold",
    htmlTagName = "GruvboxBlue",
    htmlArg = "GruvboxOrange",
    htmlTagN = "GruvboxFg1",
    htmlSpecialTagName = "GruvboxBlue",
    htmlLink = { fg = colors.fg4, gui = styles.underline },
    htmlSpecialChar = "GruvboxRed",
    htmlBold = { fg = "fg", bg = "bg", gui = styles.bold },
    htmlBoldUnderline = {
      fg = "fg",
      bg = "bg",
      gui = table.concat({ styles.bold, styles.underline }, ","),
    },
    htmlBoldItalic = { fg = "fg", bg = "bg", gui = table.concat({ styles.bold, styles.italic }, ",") },
    htmlBoldUnderlineItalic = {
      fg = "fg",
      bg = "bg",
      gui = table.concat({ styles.bold, styles.underline, styles.italic }, ","),
    },
    htmlUnderline = { fg = "fg", bg = "bg", gui = styles.underline },
    htmlUnderlineItalic = {
      fg = "fg",
      bg = "bg",
      gui = table.concat({ styles.underline, styles.italic }, ","),
    },
    htmlItalic = { fg = "fg", bg = "bg", gui = styles.italic },

    -- Markdown
    markdownItalic = { fg = colors.fg3, gui = styles.italic },
    markdownBold = { fg = colors.fg3, gui = styles.bold },
    markdownBoldItalic = {
      fg = colors.fg3,
      gui = table.concat({ styles.bold, styles.italic }, ","),
    },
    markdownH1 = "GruvboxGreenBold",
    markdownH2 = "markdownH1",
    markdownH3 = "GruvboxYellowBold",
    markdownH4 = "markdownH3",
    markdownH5 = "GruvboxYellow",
    markdownH6 = "markdownH5",
    markdownCode = "GruvboxAqua",
    markdownCodeBlock = "GruvboxAqua",
    markdownCodeDelimiter = "GruvboxAqua",
    markdownBlockquote = "GruvboxGray",
    markdownListMarker = "GruvboxGray",
    markdownOrderedListMarker = "GruvboxGray",
    markdownRule = "GruvboxGray",
    markdownHeadingRule = "GruvboxGray",
    markdownUrlDelimiter = "GruvboxFg3",
    markdownLinkDelimiter = "GruvboxFg3",
    markdownLinkTextDelimiter = "GruvboxFg3",
    markdownHeadingDelimiter = "GruvboxOrange",
    markdownUrl = "GruvboxPurple",
    markdownUrlTitleDelimiter = "GruvboxGreen",
    markdownLinkText = { fg = colors.gray, gui = styles.underline },
    markdownIdDeclaration = "markdownLinkText",

    -- diff
    diffAdded = "GruvboxGreen",
    diffRemoved = "GruvboxRed",
    diffChanged = "GruvboxAqua",
    diffFile = "GruvboxOrange",
    diffNewFile = "GruvboxYellow",
    diffLine = "GruvboxBlue",
  }
end

return theme
