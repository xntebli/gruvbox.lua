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
    -- Gruvbox Hi Groups
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

    --  General UI
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

    Folded = { fg = colors.gray, bg = colors.bg1, gui = styles.italic },
    FoldColumn = { fg = colors.gray, bg = colors.bg1 },
    SignColumn = { bg = colors.sign_column },
    LineNr = { fg = colors.bg4, bg = number_column },

    Tag = "GruvboxAquaBold",
    Delimiter = "GruvboxFg3",
    Debug = "GruvboxRed",
    Bold = { gui = styles.bold },
    Italic = { gui = styles.italic },
    Ignore = {},

    -- Gutter
    Cursor = { gui = styles.inverse },
    vCursor = "Cursor",
    iCursor = "Cursor",
    lCursor = "Cursor",
    CursorIM = "Cursor",

    -- Syntax Highlighting
    Special = util.is_true(vim.g.gruvbox_improved_strings) and {
      fg = colors.orange,
      bg = colors.bg1,
      gui = styles.italic_strings,
    } or "GruvboxOrange",

    Comment = { fg = colors.gray, gui = styles.italic_comments },
    Todo = { fg = colors.fg0, gui = table.concat({ styles.bold, styles.italic }, ",") },
    Error = { fg = colors.red, gui = table.concat({ styles.bold, styles.inverse }, ",") },

    Statement = "GruvboxRed",
    Conditional = "GruvboxRed",
    Repeat = "GruvboxRed",
    Label = "GruvboxRed",
    Exception = "GruvboxRed",
    Operator = "GruvboxFg1",
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
    FloatBorder = "Comment",

    Type = "GruvboxYellow",
    StorageClass = "GruvboxOrange",
    Structure = "GruvboxAqua",
    Typedef = "GruvboxYellow",
    SpecialChar = "GruvboxRed",

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

    -- html
    htmlTag = "GruvboxAquaBold",
    htmlEndTag = "GruvboxAquaBold",
    htmlTagName = "GruvboxBlue",
    htmlArg = "GruvboxOrange",
    htmlTagN = "GruvboxFg1",
    htmlSpecialTagName = "GruvboxBlue",
    htmlLink = { fg = colors.fg4, gui = styles.underline },
    htmlSpecialChar = "GruvboxRed",
    htmlBold = { fg = colors.fg0, bg = colors.bg0, gui = styles.bold },
    htmlBoldUnderline = {
      fg = colors.fg0,
      bg = colors.bg0,
      gui = table.concat({ styles.bold, styles.underline }, ","),
    },
    htmlBoldItalic = { fg = colors.fg0, bg = colors.bg0, gui = table.concat({ styles.bold, styles.italic }, ",") },
    htmlBoldUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      gui = table.concat({ styles.bold, styles.underline, styles.italic }, ","),
    },
    htmlUnderline = { fg = colors.fg0, bg = colors.bg0, gui = styles.underline },
    htmlUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      gui = table.concat({ styles.underline, styles.italic }, ","),
    },
    htmlItalic = { fg = colors.fg0, bg = colors.bg0, gui = styles.italic },

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

    -- signature
    SignatureMarkText = "GruvboxBlueSign",
    SignatureMarkerText = "GruvboxPurpleSign",

    -- vim-fugitive
    gitcommitSelectedFile = "GruvboxGreen",
    gitcommitDiscardedFile = "GruvboxRed",
    gitcommitUntrackedFile = "GruvboxRed",

    -- neovim
    healthError = { fg = colors.bg0, bg = colors.red },
    healthSuccess = { fg = colors.bg0, bg = colors.green },
    healthWarning = { fg = colors.bg0, bg = colors.yellow },

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

    -- NOTE: Backward Compatibilty prior to (https://github.com/neovim/neovim/pull/15585)
    LspDiagnosticsDefaultError = "GruvboxRed",
    LspDiagnosticsSignError = "GruvboxRedSign",
    LspDiagnosticsUnderlineError = "GruvboxRedUnderline",

    LspDiagnosticsDefaultWarning = "GruvboxYellow",
    LspDiagnosticsSignWarning = "GruvboxYellowSign",
    LspDiagnosticsUnderlineWarning = "GruvboxYellowUnderline",

    LspDiagnosticsDefaultInformation = "GruvboxBlue",
    LspDiagnosticsSignInformation = "GruvboxBlueSign",
    LspDiagnosticsUnderlineInformation = "GruvboxBlueUnderline",

    LspDiagnosticsDefaultHint = "GruvboxAqua",
    LspDiagnosticsSignHint = "GruvboxAquaSign",
    LspDiagnosticsUnderlineHint = "GruvboxAquaUnderline",

    LspDiagnosticsFloatingError = "GruvboxRed",
    LspDiagnosticsFloatingWarning = "GruvboxOrange",
    LspDiagnosticsFloatingInformation = "GruvboxBlue",
    LspDiagnosticsFloatingHint = "GruvboxAqua",

    LspDiagnosticsVirtualTextError = "GruvboxRed",
    LspDiagnosticsVirtualTextWarning = "GruvboxYellow",
    LspDiagnosticsVirtualTextInformation = "GruvboxBlue",
    LspDiagnosticsVirtualTextHint = "GruvboxAqua",

    LspReferenceText = "GruvboxYellowBold",
    LspReferenceRead = "GruvboxYellowBold",
    LspReferenceWrite = "GruvboxOrangeBold",

    LspCodeLens = "GruvboxGray",

    -- nvim-treesitter
    TSNone = {},
    TSError = {},
    TSKeywordOperator = "GruvboxRed",
    TSVariable = "GruvboxFg1",
    TSTextReference = { fg = colors.gray, gui = styles.underline },
    TSTag = "GruvboxOrange",
    TSTagDelimiter = "GruvboxGreen",

    -- telescope.nvim
    TelescopeNormal = "GruvboxFg1",
    TelescopeSelection = "GruvboxOrangeBold",
    TelescopeSlectionCaret = "GruvboxRed",
    TelescopeMultiSelection = "GruvboxGray",
    TelescopeBorder = "TelescopeNormal",
    TelescopePromptBorder = "TelescopeNormal",
    TelescopeResultsBorder = "TelescopeNormal",
    TelescopePreviewBorder = "TelescopeNormal",
    TelescopeMatching = "GruvboxBlue",
    TelescopePromptPrefix = "GruvboxRed",
    TelescopePrompt = "TelescopeNormal",

    -- lspsaga.nvim
    LspSagaDiagnosticBorder = "NormalNC",
    LspSagaDiagnosticHeader = "GruvboxRed",
    LspSagaDiagnosticTruncateLine = "NormalNC",
    LspFloatWinBorder = "NormalNC",
    LspSagaBorderTitle = "Title",
    TargetWord = "Error",
    ReferencesCount = "Title",
    ReferencesIcon = "Special",
    DefinitionCount = "Title",
    TargetFileName = "Comment",
    DefinitionIcon = "Special",
    ProviderTruncateLine = "NormalNC",
    SagaShadow = "GruvboxBg0",
    LspSagaFinderSelection = "Search",
    DiagnosticTruncateLine = "NormalNC",
    DiagnosticWarning = "DiagnosticWarn",
    DiagnosticInformation = "DiagnosticInfo",
    DefinitionPreviewTitle = "Title",
    LspSagaShTruncateLine = "NormalNC",
    LspSagaDocTruncateLine = "NormalNC",
    LineDiagTuncateLine = "NormalNC",
    LspSagaCodeActionTitle = "Title",
    LspSagaCodeActionTruncateLine = "NormalNC",
    LspSagaCodeActionContent = "Normal",
    LspSagaRenamePromptPrefix = "GruvboxFg2",
    LspSagaRenameBorder = { gui = styles.bold },
    LspSagaHoverBorder = { gui = styles.bold },
    LspSagaSignatureHelpBorder = { gui = styles.bold },
    LspSagaCodeActionBorder = { gui = styles.bold },
    LspSagaAutoPreview = {},
    LspSagaDefPreviewBorder = { gui = styles.bold },
    LspLinesDiagBorder = { gui = styles.bold },

    -- termdebug
    debugPC = { bg = colors.faded_blue },
    debugBreakpoint = "GruvboxRedSign",

    -- vim-dirvish
    DirvishPathTail = "GruvboxAqua",
    DirvishArg = "GruvboxYellow",

    -- NvimTree
    NvimTreeSymlink = "GruvboxFg0",
    NvimTreeFolderName = "GruvboxGreen",
    NvimTreeRootFolder = "GruvboxGray",
    NvimTreeFolderIcon = "GruvboxOrange",
    NvimTreeEmptyFolderName = "GruvboxGreen",
    NvimTreeOpenedFolderName = "GruvboxGreen",
    NvimTreeExecFile = "GruvboxFg0",
    NvimTreeOpenedFile = "GruvboxFg0",
    NvimTreeSpecialFile = "GruvboxFg0",
    NvimTreeImageFile = "GruvboxFg0",
    NvimTreeMarkdownFile = "GruvboxFg0",
    NvimTreeIndentMarker = "GruvboxGray",
    NvimTreeGitDirty = "GruvboxYellow",
    NvimTreeGitStaged = "GruvboxBlue",
    NvimTreeGitMerge = "GruvboxOrange",
    NvimTreeGitRenamed = "GruvboxPurple",
    NvimTreeGitNew = "GruvboxAqua",
    NvimTreeGitDeleted = "GruvboxRed",
    NvimTreeLspDiagnosticsError = "GruvboxRedSign",
    NvimTreeLspDiagnosticsWarning = "GruvboxYellowSign",
    NvimTreeLspDiagnosticsInformation = "GruvboxBlueSign",
    NvimTreeLspDiagnosticsHint = "GruvboxGreenSign",

    -- diff
    diffAdded = "GruvboxGreen",
    diffRemoved = "GruvboxRed",
    diffChanged = "GruvboxAqua",
    diffFile = "GruvboxOrange",
    diffNewFile = "GruvboxYellow",
    diffLine = "GruvboxBlue",

    -- gitsigns.nvim
    GitSignsAdd = "GruvboxGreenSign",
    GitSignsChange = "GruvboxAquaSign",
    GitSignsDelete = "GruvboxRedSign",
    GitSignsCurrentLineBlame = "NonText",

    -- nvim-cmp
    CmpItemAbbr = "GruvboxFg0",
    CmpItemAbbrDeprecated = "GruvboxFg0",
    CmpItemAbbrMatch = "GruvboxBlue",
    CmpItemAbbrMatchFuzzy = { gui = styles.underline, fg = colors.aqua },
    CmpItemKind = "GruvboxOrange",
    CmpItemMenu = "GruvboxGray",
    CmpDocumentation = { fg = colors.fg0, bg = colors.bg0 },
    CmpDocumentationBorder = { fg = colors.gray, bg = colors.bg0 },

    -- symbols-outline.nvim
    FocusedSymbol = { fg = colors.yellow, gui = styles.bold },
  }
end

return theme
