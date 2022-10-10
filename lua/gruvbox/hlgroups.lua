local M = {}

M.setup = function(colors, configs)
  -- terminal colors
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

  local hls_cursor = colors[configs.hls_cursor]
  local hls_highlight = colors[configs.hls_highlight]
  local number_column = colors[configs.number_column]
  local sign_column = colors[configs.sign_column]
  local color_column = colors[configs.color_column]
  local vert_split = colors[configs.vert_split]
  local tabline_sel = colors[configs.tabline_sel]

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
    GruvboxRedBold = { fg = colors.red, bold = configs.bold },
    GruvboxGreen = { fg = colors.green },
    GruvboxGreenBold = { fg = colors.green, bold = configs.bold },
    GruvboxYellow = { fg = colors.yellow },
    GruvboxYellowBold = { fg = colors.yellow, bold = configs.bold },
    GruvboxBlue = { fg = colors.blue },
    GruvboxBlueBold = { fg = colors.blue, bold = configs.bold },
    GruvboxPurple = { fg = colors.purple },
    GruvboxPurpleBold = { fg = colors.purple, bold = configs.bold },
    GruvboxAqua = { fg = colors.aqua },
    GruvboxAquaBold = { fg = colors.aqua, bold = configs.bold },
    GruvboxOrange = { fg = colors.orange },
    GruvboxOrangeBold = { fg = colors.orange, bold = configs.bold },

    GruvboxRedSign = { fg = colors.red, bg = sign_column, reverse = configs.invert_signs },
    GruvboxGreenSign = { fg = colors.green, bg = sign_column, reverse = configs.invert_signs },
    GruvboxYellowSign = { fg = colors.yellow, bg = sign_column, reverse = configs.invert_signs },
    GruvboxBlueSign = { fg = colors.blue, bg = sign_column, reverse = configs.invert_signs },
    GruvboxPurpleSign = { fg = colors.purple, bg = sign_column, reverse = configs.invert_signs },
    GruvboxAquaSign = { fg = colors.aqua, bg = sign_column, reverse = configs.invert_signs },
    GruvboxOrangeSign = { fg = colors.orange, bg = sign_column, reverse = configs.invert_signs },

    GruvboxRedUnderline = { undercurl = configs.undercurl, sp = colors.red },
    GruvboxGreenUnderline = { undercurl = configs.undercurl, sp = colors.green },
    GruvboxYellowUnderline = { undercurl = configs.undercurl, sp = colors.yellow },
    GruvboxBlueUnderline = { undercurl = configs.undercurl, sp = colors.blue },
    GruvboxPurpleUnderline = { undercurl = configs.undercurl, sp = colors.purple },
    GruvboxAquaUnderline = { undercurl = configs.undercurl, sp = colors.aqua },
    GruvboxOrangeUnderline = { undercurl = configs.undercurl, sp = colors.orange },
    -- }}}

    -- General UI: {{{
    Normal = { fg = colors.fg1, bg = colors.bg0 },

    CursorLine = { bg = colors.bg1 },
    CursorColumn = { link = "CursorLine" },

    TabLineFill = { fg = colors.bg4, bg = colors.bg1, reverse = configs.invert_tabline },
    TabLineSel = { fg = tabline_sel, bg = colors.bg1, reverse = configs.invert_tabline },
    TabLine = { link = "TabLineFill" },

    MatchParen = { bg = colors.bg3, bold = configs.bold },

    ColorColumn = { bg = color_column },
    Conceal = { fg = colors.blue },
    CursorLineNr = { fg = colors.yellow, bg = colors.bg1 },

    NonText = { link = "GruvboxBg2" },
    SpecialKey = { link = "GruvboxFg4" },

    Visual = { bg = colors.bg3, reverse = configs.invert_selection },
    VisualNOS = { link = "Visual" },

    Search = { fg = hls_highlight, bg = colors.bg0, reverse = configs.inverse },
    IncSearch = { fg = hls_cursor, bg = colors.bg0, reverse = configs.inverse },

    QuickFixLine = { fg = colors.bg0, bg = colors.yellow, bold = configs.bold },

    Underlined = { fg = colors.blue, underline = configs.underline },

    StatusLine = { fg = colors.bg2, bg = colors.fg1, reverse = configs.inverse },
    StatusLineNC = { fg = colors.bg1, bg = colors.fg4, reverse = configs.inverse },

    VertSplit = { fg = colors.bg3, bg = vert_split },

    WildMenu = { fg = colors.blue, bg = colors.bg2, bold = configs.bold },

    Directory = { link = "GruvboxGreenBold" },

    Title = { link = "GruvboxGreenBold" },

    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = configs.bold },

    MoreMsg = { link = "GruvboxYellowBold" },
    ModeMsg = { link = "GruvboxYellowBold" },
    Question = { link = "GruvboxOrangeBold" },
    WarningMsg = { link = "GruvboxRedBold" },
    -- }}}

    --- Gutter: {{{
    LineNr = { fg = colors.bg4, bg = number_column },
    SignColumn = { bg = sign_column },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = configs.italic },
    FoldColumn = { fg = colors.gray, bg = colors.bg1 },
    --- }}}

    -- Cursor: {{{
    Cursor = { reverse = configs.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    -- }}}

    -- Syntax Highlighting: {{{
    Special = configs.improved_strings and {
      fg = colors.orange,
      bg = colors.bg1,
      italic = configs.italic_strings,
    } or { link = "GruvboxOrange" },

    Comment = { fg = colors.gray, italic = configs.italicize_comments },
    Todo = { fg = colors.fg0, bold = configs.bold, italic = configs.italic },
    Error = { fg = colors.red, bold = configs.bold, reverse = configs.inverse },

    Statement = { link = "GruvboxRed" },
    Conditional = { link = "GruvboxRed" },
    Repeat = { link = "GruvboxRed" },
    Label = { link = "GruvboxRed" },
    Exception = { link = "GruvboxRed" },
    Operator = { fg = colors.orange, italic = configs.italicize_operators },
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
    String = not configs.improved_strings and {
      fg = colors.green,
      italic = configs.italic_strings,
    } or {
      fg = colors.fg1,
      bg = colors.bg1,
      italic = configs.italic_strings,
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
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = configs.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    -- }}}

    -- Diffs: {{{
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = configs.inverse },
    DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = configs.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = configs.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = configs.inverse },
    -- }}}

    -- Spelling: {{{
    SpellCap = not configs.improved_warnings and { link = "GruvboxBlueUnderline" } or {
      fg = colors.green,
      bold = configs.bold,
      italic = configs.italic,
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

    -- Termdebug: {{{
    debugPC = { fg = colors.NONE, bg = colors.faded_blue },
    debugBreakpoint = { link = "GruvboxRedSign" },
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

    -- Dashboard: {{{
    DashboardHeader = { link = "GruvboxYellowBold" },
    DashboardCenter = { link = "GruvboxGreen" },
    DashboardCenterIcon = { link = "GruvboxAqua" },
    DashboardShortCut = { link = "GruvboxBlue" },
    DashboardFooter = { link = "GruvboxPurple" },
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

    -- html: {{{
    htmlTag = { link = "GruvboxAquaBold" },
    htmlEndTag = { link = "GruvboxAquaBold" },
    htmlTagName = { link = "GruvboxBlue" },
    htmlArg = { link = "GruvboxOrange" },
    htmlTagN = { link = "GruvboxFg1" },
    htmlSpecialTagName = { link = "GruvboxBlue" },
    htmlLink = { fg = colors.fg4, underline = configs.underline },
    htmlSpecialChar = { link = "GruvboxRed" },
    htmlBold = { fg = colors.fg0, bg = colors.bg0, bold = configs.bold },
    htmlBoldUnderline = {
      fg = colors.fg0,
      bg = colors.bg0,
      bold = configs.bold,
      underline = configs.underline,
    },
    htmlBoldItalic = { fg = colors.fg0, bg = colors.bg0, bold = configs.bold, italic = configs.italic },
    htmlBoldUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      bold = configs.bold,
      italic = configs.italic,
      underline = configs.underline,
    },
    htmlUnderline = { fg = colors.fg0, bg = colors.bg0, underline = configs.underline },
    htmlUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      italic = configs.italic,
      underline = configs.underline,
    },
    htmlItalic = { fg = colors.fg0, bg = colors.bg0, bold = configs.italic },
    -- }}}

    -- Markdown: {{{
    markdownItalic = { fg = colors.fg3, italic = configs.italic },
    markdownBold = { fg = colors.fg3, bold = configs.bold },
    markdownBoldItalic = { fg = colors.fg3, bold = configs.bold, italic = configs.italic },
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
    markdownLinkText = { fg = colors.gray, underline = configs.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    -- }}}

    -- mail: {{{
    mailQuoted1 = { link = "GruvboxAqua" },
    mailQuoted2 = { link = "GruvboxPurple" },
    mailQuoted3 = { link = "GruvboxYellow" },
    mailQuoted4 = { link = "GruvboxGreen" },
    mailQuoted5 = { link = "GruvboxRed" },
    mailQuoted6 = { link = "GruvboxOrange" },
    mailSignature = { link = "Comment" },
    -- }}}

    -- Neovim: {{{
    healthError = { fg = colors.bg0, bg = colors.red },
    healthSuccess = { fg = colors.bg0, bg = colors.green },
    healthWarning = { fg = colors.bg0, bg = colors.yellow },
    --}}}

    -- harpoon {{{
    HarpoonBorder = { link = "GruvboxFg1" },
    HarpoonWindow = { fg = colors.fg1, bg = colors.NONE },
    -- }}}
  }

  return hlgroups
end

return M
