local M = {}

local function setup_terminal_colors(colors)
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

M.setup = function(colors, config)
  config = vim.tbl_extend("force", require("gruvbox").config, config or {})

  local hls_cursor = colors[config.hls_cursor]
  local hls_highlight = colors[config.hls_highlight]
  local number_column = colors[config.number_column]
  local sign_column = colors[config.sign_column]
  local color_column = colors[config.color_column]
  local vert_split = colors[config.vert_split]
  local tabline_sel = colors[config.tabline_sel]

  local hlgroups = {
    -- Gruvbox Hi Groups: {{{
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
    GruvboxRedBold = { fg = colors.red, bold = config.bold },
    GruvboxGreen = { fg = colors.green },
    GruvboxGreenBold = { fg = colors.green, bold = config.bold },
    GruvboxYellow = { fg = colors.yellow },
    GruvboxYellowBold = { fg = colors.yellow, bold = config.bold },
    GruvboxBlue = { fg = colors.blue },
    GruvboxBlueBold = { fg = colors.blue, bold = config.bold },
    GruvboxPurple = { fg = colors.purple },
    GruvboxPurpleBold = { fg = colors.purple, bold = config.bold },
    GruvboxAqua = { fg = colors.aqua },
    GruvboxAquaBold = { fg = colors.aqua, bold = config.bold },
    GruvboxOrange = { fg = colors.orange },
    GruvboxOrangeBold = { fg = colors.orange, bold = config.bold },

    GruvboxRedSign = { fg = colors.red, bg = sign_column, reverse = config.invert_signs },
    GruvboxGreenSign = { fg = colors.green, bg = sign_column, reverse = config.invert_signs },
    GruvboxYellowSign = { fg = colors.yellow, bg = sign_column, reverse = config.invert_signs },
    GruvboxBlueSign = { fg = colors.blue, bg = sign_column, reverse = config.invert_signs },
    GruvboxPurpleSign = { fg = colors.purple, bg = sign_column, reverse = config.invert_signs },
    GruvboxAquaSign = { fg = colors.aqua, bg = sign_column, reverse = config.invert_signs },
    GruvboxOrangeSign = { fg = colors.orange, bg = sign_column, reverse = config.invert_signs },

    GruvboxRedUnderline = { undercurl = config.undercurl, sp = colors.red },
    GruvboxGreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    GruvboxYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    GruvboxBlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    GruvboxPurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    GruvboxAquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    GruvboxOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
    -- }}}

    -- General UI: {{{
    Normal = { fg = colors.fg1, bg = colors.bg0 },

    CursorLine = { bg = colors.bg1 },
    CursorColumn = { link = "CursorLine" },

    TabLineFill = { fg = colors.bg4, bg = colors.bg1, reverse = config.invert_tabline },
    TabLineSel = { fg = tabline_sel, bg = colors.bg1, reverse = config.invert_tabline },
    TabLine = { link = "TabLineFill" },

    MatchParen = { bg = colors.bg3, bold = config.bold },

    ColorColumn = { bg = color_column },
    Conceal = { fg = colors.blue },
    CursorLineNr = { fg = colors.yellow, bg = colors.bg1 },

    NonText = { link = "GruvboxBg2" },
    SpecialKey = { link = "GruvboxFg4" },

    Visual = { bg = colors.bg3, reverse = config.invert_selection },
    VisualNOS = { link = "Visual" },

    Search = { fg = hls_highlight, bg = colors.bg0, reverse = config.inverse },
    IncSearch = { fg = hls_cursor, bg = colors.bg0, reverse = config.inverse },

    QuickFixLine = { fg = colors.bg0, bg = colors.yellow, bold = config.bold },

    Underlined = { fg = colors.blue, underline = config.underline },

    StatusLine = { fg = colors.bg2, bg = colors.fg1, reverse = config.inverse },
    StatusLineNC = { fg = colors.bg1, bg = colors.fg4, reverse = config.inverse },

    VertSplit = { fg = colors.bg3, bg = vert_split },

    WildMenu = { fg = colors.blue, bg = colors.bg2, bold = config.bold },

    Directory = { link = "GruvboxGreenBold" },

    Title = { link = "GruvboxGreenBold" },

    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },

    MoreMsg = { link = "GruvboxYellowBold" },
    ModeMsg = { link = "GruvboxYellowBold" },
    Question = { link = "GruvboxOrangeBold" },
    WarningMsg = { link = "GruvboxRedBold" },
    -- }}}

    --- Gutter: {{{
    LineNr = { fg = colors.bg4, bg = number_column },
    SignColumn = { bg = sign_column },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = config.italic },
    FoldColumn = { fg = colors.gray, bg = colors.bg1 },
    --- }}}

    -- Cursor: {{{
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    -- }}}

    -- Syntax Highlighting: {{{
    Special = config.improved_strings and {
      fg = colors.orange,
      bg = colors.bg1,
      italic = config.italic_strings,
    } or { link = "GruvboxOrange" },

    Comment = { fg = colors.gray, italic = config.italicize_comments },
    Todo = { fg = colors.fg0, bold = config.bold, italic = config.italic },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },

    Statement = { link = "GruvboxRed" },
    Conditional = { link = "GruvboxRed" },
    Repeat = { link = "GruvboxRed" },
    Label = { link = "GruvboxRed" },
    Exception = { link = "GruvboxRed" },
    Operator = { fg = colors.orange, italic = config.italicize_operators },
    Keyword = { link = "GruvboxRed" },

    Identifier = { link = "GruvboxBlue" },
    Function = { link = "GruvboxGreenBold" },

    PreProc = { link = "GruvboxAqua" },
    Include = { link = "GruvboxAqua" },
    Define = { link = "GruvboxAqua" },
    Macro = { link = "GruvboxAqua" },
    PreCondit = { link = "GruvboxAqua" },

    Constant = { link = "GruvboxPurple" },
    Character = { link = "GruvboxPurple" },
    String = not config.improved_strings and {
      fg = colors.green,
      italic = config.italic_strings,
    } or {
      fg = colors.fg1,
      bg = colors.bg1,
      italic = config.italic_strings,
    },
    Boolean = { link = "GruvboxPurple" },
    Number = { link = "GruvboxPurple" },
    Float = { link = "GruvboxPurple" },

    Type = { link = "GruvboxYellow" },
    StorageClass = { link = "GruvboxOrange" },
    Structure = { link = "GruvboxAqua" },
    Typedef = { link = "GruvboxYellow" },
    -- }}}

    -- Completion Menu: {{{
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    -- }}}

    -- Diffs: {{{
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = config.inverse },
    DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = config.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = config.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    -- }}}

    -- Spelling: {{{
    SpellCap = not config.improved_warnings and { link = "GruvboxBlueUnderline" } or {
      fg = colors.green,
      bold = config.bold,
      italic = config.italic,
    },
    SpellBad = { link = "GruvboxRedUnderline" },
    SpellLocal = { link = "GruvboxAquaUnderline" },
    SpellRare = { link = "GruvboxPurpleUnderline" },
    -- }}}

    -- LSP: {{{
    DiagnosticError = { link = "GruvboxRed" },
    DiagnosticSignError = { link = "GruvboxRedSign" },
    DiagnosticUnderlineError = { link = "GruvboxRedUnderline" },

    DiagnosticWarn = { link = "GruvboxYellow" },
    DiagnosticSignWarn = { link = "GruvboxYellowSign" },
    DiagnosticUnderlineWarn = { link = "GruvboxYellowUnderline" },

    DiagnosticInfo = { link = "GruvboxBlue" },
    DiagnosticSignInfo = { link = "GruvboxBlueSign" },
    DiagnosticUnderlineInfo = { link = "GruvboxBlueUnderline" },

    DiagnosticHint = { link = "GruvboxAqua" },
    DiagnosticSignHint = { link = "GruvboxAquaSign" },
    DiagnosticUnderlineHint = { link = "GruvboxAquaUnderline" },

    LspReferenceText = { link = "GruvboxYellowBold" },
    LspReferenceRead = { link = "GruvboxYellowBold" },
    LspReferenceWrite = { link = "GruvboxOrangeBold" },

    LspCodeLens = { link = "GruvboxGray" },
    -- }}}

    -- Treesitter: {{{
    TSKeywordOperator = { link = "GruvboxRed" },
    -- }}}

    -- GitCommit: {{{
    gitcommitSelectedFile = { link = "GruvboxGreen" },
    gitcommitDiscardedFile = { link = "GruvboxRed" },
    -- }}}

    -- gitsigns.nvim {{{
    GitSignsAdd = { link = "GruvboxGreenSign" },
    GitSignsChange = { link = "GruvboxAquaSign" },
    GitSignsDelete = { link = "GruvboxRedSign" },
    -- }}}

    -- Dirvish: {{{
    DirvishPathTail = { link = "GruvboxAqua" },
    DirvishArg = { link = "GruvboxYellow" },
    -- }}}

    -- Netrw : {{{
    netrwDir = { link = "GruvboxAqua" },
    netrwClassify = { link = "GruvboxAqua" },
    netrwLink = { link = "GruvboxGray" },
    netrwSymLink = { link = "GruvboxFg1" },
    netrwExe = { link = "GruvboxYellow" },
    netrwComment = { link = "GruvboxGray" },
    netrwList = { link = "GruvboxBlue" },
    netrwHelpCmd = { link = "GruvboxAqua" },
    netrwCmdSep = { link = "GruvboxFg3" },
    netrwVersion = { link = "GruvboxGreen" },
    -- }}}

    -- Telescope: {{{
    TelescopeNormal = { link = "GruvboxFg1" },
    TelescopeSelection = { link = "GruvboxOrangeBold" },
    TelescopeSelectionCaret = { link = "GruvboxRed" },
    TelescopeMultiSelection = { link = "GruvboxGray" },
    TelescopeBorder = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopeNormal" },
    TelescopeMatching = { link = "GruvboxBlue" },
    TelescopePromptPrefix = { link = "GruvboxRed" },
    TelescopePrompt = { link = "TelescopeNormal" },
    -- }}}

    -- nvim-cmp: {{{
    CmpItemAbbr = { link = "GruvboxFg0" },
    CmpItemAbbrDeprecated = { link = "GruvboxFg1" },
    CmpItemAbbrMatch = { link = "GruvboxBlueBold" },
    CmpItemAbbrMatchFuzzy = { link = "GruvboxBlueUnderline" },
    CmpItemMenu = { link = "GruvboxGray" },
    CmpItemKindText = { link = "GruvboxOrange" },
    CmpItemKindMethod = { link = "GruvboxBlue" },
    CmpItemKindFunction = { link = "GruvboxBlue" },
    CmpItemKindConstructor = { link = "GruvboxYellow" },
    CmpItemKindField = { link = "GruvboxBlue" },
    CmpItemKindClass = { link = "GruvboxYellow" },
    CmpItemKindInterface = { link = "GruvboxYellow" },
    CmpItemKindModule = { link = "GruvboxBlue" },
    CmpItemKindProperty = { link = "GruvboxBlue" },
    CmpItemKindValue = { link = "GruvboxOrange" },
    CmpItemKindEnum = { link = "GruvboxYellow" },
    CmpItemKindKeyword = { link = "GruvboxPurple" },
    CmpItemKindSnippet = { link = "GruvboxGreen" },
    CmpItemKindFile = { link = "GruvboxBlue" },
    CmpItemKindEnumMember = { link = "GruvBoxAqua" },
    CmpItemKindConstant = { link = "GruvboxOrange" },
    CmpItemKindStruct = { link = "GruvboxYellow" },
    CmpItemKindTypeParameter = { link = "GruvboxYellow" },
    -- }}}

    --  Filetype specific
    -- Diff: {{{
    diffAdded = { link = "GruvboxGreen" },
    diffRemoved = { link = "GruvboxRed" },
    diffChanged = { link = "GruvboxAqua" },
    diffFile = { link = "GruvboxOrange" },
    diffNewFile = { link = "GruvboxYellow" },
    diffLine = { link = "GruvboxBlue" },
    -- }}}

    -- Markdown: {{{
    markdownItalic = { fg = colors.fg3, italic = config.italic },
    markdownBold = { fg = colors.fg3, bold = config.bold },
    markdownBoldItalic = { fg = colors.fg3, bold = config.bold, italic = config.italic },
    markdownH1 = { link = "GruvboxGreenBold" },
    markdownH2 = { link = "GruvboxGreenBold" },
    markdownH3 = { link = "GruvboxYellowBold" },
    markdownH4 = { link = "GruvboxYellowBold" },
    markdownH5 = { link = "GruvboxYellow" },
    markdownH6 = { link = "GruvboxYellow" },
    markdownCode = { link = "GruvboxAqua" },
    markdownCodeBlock = { link = "GruvboxAqua" },
    markdownCodeDelimiter = { link = "GruvboxAqua" },
    markdownBlockquote = { link = "GruvboxGray" },
    markdownListMarker = { link = "GruvboxGray" },
    markdownOrderedListMarker = { link = "GruvboxGray" },
    markdownRule = { link = "GruvboxGray" },
    markdownHeadingRule = { link = "GruvboxGray" },
    markdownUrlDelimiter = { link = "GruvboxFg3" },
    markdownLinkDelimiter = { link = "GruvboxFg3" },
    markdownLinkTextDelimiter = { link = "GruvboxFg3" },
    markdownHeadingDelimiter = { link = "GruvboxOrange" },
    markdownUrl = { link = "GruvboxPurple" },
    markdownUrlTitleDelimiter = { link = "GruvboxGreen" },
    markdownLinkText = { fg = colors.gray, underline = config.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    -- }}}

    --- Misc:
    -- Neovim: {{{
    healthError = { fg = colors.bg0, bg = colors.red },
    healthSuccess = { fg = colors.bg0, bg = colors.green },
    healthWarning = { fg = colors.bg0, bg = colors.yellow },
    --}}}
  }

  setup_terminal_colors(colors)

  return hlgroups
end

return M
