---@class groups
local groups = {}

local colors = require "greenlight.colors"
local config = require "greenlight.config"

---@type groups
local defaults = {
    Boolean = { fg = colors.seagreen },
    Character = { fg = colors.fg },
    Constant = { fg = colors.lightblue },
    Float = { fg = colors.seagreen },
    Number = { fg = colors.seagreen },
    String = { fg = colors.cyan },

    StorageClass = { fg = colors.greenlight },
    Structure = { fg = colors.greenlight },
    Type = { fg = colors.greenlight },
    Typedef = { fg = colors.lightblue },

    Function = { fg = colors.white },
    Identifier = { fg = colors.fg },

    Keyword = { fg = colors.lightblue },
    Label = { fg = colors.greenlight },
    Operator = { fg = colors.fg },
    Statement = { fg = colors.white },

    Define = { fg = colors.greenlight },
    Include = { fg = colors.greenlight },
    Macro = { fg = colors.cyan },
    PreCondit = { fg = colors.greenlight },
    PreProc = { fg = colors.greenlight },
    Conceal = { fg = colors.fg },

    Delimiter = { fg = colors.fg },
    Special = { fg = colors.fg },
    SpecialChar = { fg = colors.seagreen },
    SpecialComment = { fg = colors.seagreen },
    Tag = { fg = colors.fg },

    Comment = { fg = colors.limegreen, italic = config.italics },
    Todo = { fg = colors.white, bold = true, italic = config.italics },

    Error = { fg = colors.red },
    Ignore = { fg = colors.fg },
    Underlined = { fg = colors.green, underline = true },

    ColorColumn = { bg = colors.dark_blue },
    Cursor = { fg = colors.greenlight, bg = colors.fg },
    CursorColumn = { bg = colors.vulcan },
    CursorLine = { bg = colors.bg },
    CursorLineNr = { fg = colors.seagreen },
    ErrorMsg = { fg = colors.pink },
    FloatTitle = { fg = colors.seagreen },
    LineNr = { fg = colors.dark_gray },
    MatchParen = { bg = colors.dark_gray, bold = true },
    ModeMsg = { fg = colors.peanut },
    MoreMsg = { fg = colors.peanut },
    Nontext = { fg = colors.dark_gray },
    Normal = { fg = colors.fg, bg = config.transparent and colors.none or colors.bg },
    NormalFloat = { link = "Normal" },
    Question = { fg = colors.peanut },
    CurSearch = { bg = colors.palevioletred2, fg = colors.brown4 },
    Search = { link = CurSearch },
    SignColumn = {},
    StatusLine = { fg = colors.bg, bg = colors.fg },
    StatusLineNC = { fg = colors.light_gray, bg = colors.dark_blue },
    Tabline = { fg = colors.fg, bg = colors.dark_blue, reverse = false },
    VertSplit = { fg = colors.fg },
    Visual = { bg = colors.blue },
    WarningMsg = { fg = colors.peanut },

    Directory = { fg = colors.aqua },
    SpecialKey = { fg = colors.pink },
    Title = { fg = colors.yellow },

    -- checkhealth
    healthSuccess = { fg = colors.green },
    healthWarning = { fg = colors.yellow },
    helpCommand = { fg = colors.orange },
    helpHyperTextJump = { fg = colors.aqua },
    helpHeader = { fg = colors.white },
    helpSectionDelim = { fg = colors.green },

    -- treesitter
    ["@annotation"] = { link = "PreProc" },
    ["@attribute"] = { link = "PreProc" },
    ["@boolean"] = { link = "Boolean" },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "SpecialChar" },
    ["@comment"] = { link = "Comment" },
    ["@conditional"] = { link = "Conditional" },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { fg = colors.white },
    ["@constant.macro"] = { link = "Define" },
    ["@constructor"] = { fg = colors.greenlight },
    ["@debug"] = { link = "Debug" },
    ["@define"] = { link = "Define" },
    ["@error"] = { link = "Error" },
    ["@exception"] = { link = "Exception" },
    ["@field"] = { link = "Identifier" },
    ["@float"] = { link = "Float" },
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { link = "Function" },
    ["@function.call"] = { link = "Function" },
    ["@function.macro"] = { link = "Macro" },
    ["@include"] = { link = "Include" },
    ["@keyword"] = { link = "Keyword" },
    ["@keyword.function"] = { link = "Function" },
    ["@keyword.operator"] = { link = "Operator" },
    ["@keyword.return"] = { fg = colors.lightblue },
    ["@label"] = { link = "Label" },
    ["@method"] = { link = "Function" },
    ["@method.call"] = { link = "Function" },
    ["@namespace"] = { link = "Include" },
    ["@none"] = {},
    ["@number"] = { link = "Number" },
    ["@operator"] = { link = "Operator" },
    ["@parameter"] = { fg = colors.fg, italic = config.italics },
    ["@parameter.reference"] = { link = "@parameter" },
    ["@preproc"] = { link = "PreProc" },
    ["@property"] = { link = "Identifier" },
    ["@punctuation.bracket"] = { link = "Delimiter" },
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    ["@punctuation.special"] = { link = "Delimiter" },
    ["@repeat"] = { link = "Repeat" },
    ["@storageclass"] = { link = "StorageClass" },
    ["@string"] = { link = "String" },
    ["@string.escape"] = { link = "SpecialChar" },
    ["@string.regex"] = { link = "String" },
    ["@string.special"] = { link = "SpecialChar" },
    ["@symbol"] = { link = "Identifier" },
    ["@tag"] = { link = "Label" },
    ["@tag.attribute"] = { link = "Identifier" },
    ["@tag.delimiter"] = { link = "Delimiter" },
    ["@text"] = { link = "Normal" },
    ["@text.danger"] = { link = "WarningMsg" },
    ["@text.emphasis"] = { italic = config.italics },
    ["@text.environment"] = { link = "Macro" },
    ["@text.environment.name"] = { link = "Type" },
    ["@text.literal"] = { link = "String" },
    ["@text.math"] = { link = "Special" },
    ["@text.note"] = { link = "SpecialComment" },
    ["@text.reference"] = { link = "Constant" },
    ["@text.strike"] = { strikethrough = true },
    ["@text.strong"] = { bold = true },
    ["@text.title"] = { link = "Title" },
    ["@text.underline"] = { underline = true },
    ["@text.uri"] = { fg = colors.lightblue, undercurl = true },
    ["@text.warning"] = { link = "WarningMsg" },
    ["@todo"] = { link = "Todo" },
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { link = "Type" },
    ["@type.definition"] = { link = "Typedef" },
    ["@type.qualifier"] = { link = "Type" },
    ["@variable"] = { fg = colors.fg },
    ["@variable.builtin"] = { fg = colors.white },

    -- semantic tokens
    ["@lsp.mod.deprecated"] = { fg = colors.light_gray, strikethrough = true },
    ["@lsp.mod.documentation"] = { link = "@constant" },
    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.macro"] = { link = "@function" },
    ["@lsp.type.method"] = { link = "@function" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.string"] = { link = "@string" },
    ["@lsp.type.struct"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type" },
    ["@lsp.type.xmlDocCommentName"] = { fg = colors.pink },
    ["@lsp.type.xmlDocCommentAttributeQuotes"] = { fg = colors.yellow },
    ["@lsp.type.xmlDocCommentAttributeName"] = { fg = colors.green },

    -- nvim-ts-rainbow 2
    TSRainbowRed = { fg = colors.dark_red },
    TSRainbowOrange = { fg = colors.orange },
    TSRainbowYellow = { fg = colors.yellow },
    TSRainbowGreen = { fg = colors.green },
    TSRainbowBlue = { fg = colors.aqua },
    TSRainbowViolet = { fg = colors.purple },
    TSRainbowCyan = { fg = colors.cyan },

    -- rainbow-delimiters
    RainbowDelimiterRed = { fg = colors.dark_red },
    RainbowDelimiterOrange = { fg = colors.orange },
    RainbowDelimiterYellow = { fg = colors.yellow },
    RainbowDelimiterGreen = { fg = colors.green },
    RainbowDelimiterBlue = { fg = colors.aqua },
    RainbowDelimiterViolet = { fg = colors.purple },
    RainbowDelimiterCyan = { fg = colors.cyan },

    -- diff
    DiffAdd = { bg = colors.green:darken(0.3) },
    DiffChange = { fg = colors.white:darken(0.3) },
    DiffDelete = { bg = colors.red:darken(0.3) },
    DiffText = { bg = colors.cyan:darken(0.3) },

    diffAdded = { fg = colors.green },
    diffChanged = { fg = colors.white },
    diffFile = { fg = colors.white },
    diffIndexLine = { fg = colors.cyan },
    diffLine = { fg = colors.purple },
    diffRemoved = { fg = colors.pink },
    diffSubname = { fg = colors.cyan },

    -- fold
    FoldColumn = { bg = colors.dark_blue },
    Folded = { fg = colors.gray, bg = colors.dark_blue },

    -- popup menu
    Pmenu = { fg = colors.fg, bg = colors.bglighten },
    PmenuSel = { fg = colors.lightblue, bg = colors.bglighten:lighten(0.9) },
    PmenuThumb = { fg = colors.dark_green, bg = colors.dark_gray },

    -- diagnostics
    DiagnosticError = { fg = colors.pink },
    DiagnosticHint = { fg = colors.light_gray },
    DiagnosticInfo = { fg = colors.white },
    DiagnosticUnderlineError = { sp = colors.red, underline = true },
    DiagnosticUnderlineHint = { sp = colors.light_gray, underline = true },
    DiagnosticUnderlineInfo = { sp = colors.green, underline = true },
    DiagnosticUnderlineWarn = { sp = colors.yellow, underline = true },
    DiagnosticWarn = { fg = colors.peanut },
    DiagnosticUnnecessary = { fg = colors.fg:darken(0.6) },

    -- lsp document highlight
    LspReferenceRead = { bg = colors.vulcan, bold = true },
    LspReferenceText = { bg = colors.vulcan, bold = true },
    LspReferenceWrite = { bg = colors.vulcan, bold = true },

    -- vim-illuminate
    IlluminatedWordRead = { link = "LspReferenceRead" },
    IlluminatedWordText = { link = "LspReferenceText" },
    IlluminatedWordWrite = { link = "LspReferenceWrite" },

    LspInlayHint = { link = "Comment" },

    -- nvim-lspconfig
    LspInfoBorder = { link = "FloatBorder" },
    LspInfoFiletype = { fg = colors.white },
    LspInfoList = { fg = colors.lightblue },
    LspInfoTitle = { fg = colors.cyan },

    -- telescope
    TelescopeBorder = { link = "FloatBorder" },
    TelescopeNormal = { link = "Normal" },
    TelescopePromptCounter = { fg = colors.lightblue },
    TelescopeTitle = { fg = colors.lightblue },

    -- leap
    LeapBackdrop = { fg = colors.gray },
    LeapLabelPrimary = { fg = colors.dark_pink },
    LeapLabelSecondary = { fg = colors.dark_cyan },
    LeapMatch = { fg = colors.dark_pink, underline = true },

    -- sj
    SjLabel = { fg = colors.dark_pink },
    SjLimit = { link = "ErrorMsg" },
    SjOverlay = { link = "Comment" },
    SjSearch = { link = "IncSearch" },
    SjWarning = { link = "WarningMsg" },

    -- flash
    FlashMatch = { link = "Search" },
    FlashCurrent = { link = "IncSearch" },
    FlashBackdrop = { link = "Comment" },
    FlashLabel = { fg = colors.dark_pink },

    -- mason
    MasonError = { fg = colors.red },
    MasonHeader = { fg = colors.dark_green, bg = colors.cyan, bold = true },
    MasonHeaderSecondary = { fg = colors.dark_green, bg = colors.yellow, bold = true },
    MasonHeading = { fg = colors.white, bold = true },
    MasonHighlight = { fg = colors.aqua },
    MasonHighlightBlock = { fg = colors.dark_blue, bg = colors.cyan },
    MasonHighlightBlockBold = { fg = colors.dark_blue, bg = colors.cyan, bold = true },
    MasonHighlightBlockBoldSecondary = { fg = colors.dark_blue, bg = colors.yellow, bold = true },
    MasonHighlightBlockSecondary = { fg = colors.dark_blue, bg = colors.yellow },
    MasonHighlightSecondary = { fg = colors.yellow },
    MasonLink = { fg = colors.aqua },
    MasonMuted = { fg = colors.pink },
    MasonMutedBlock = { fg = colors.dark_blue, bg = colors.light_gray },
    MasonMutedBlockBold = { fg = colors.dark_blue, bg = colors.light_gray, bold = true },

    -- dashboard
    DashboardCenter = { fg = colors.pink },
    DashboardFooter = { fg = colors.aqua },
    DashboardHeader = { fg = colors.peanut },

    -- nvimtree
    NvimTreeBookmark = { fg = colors.yellow },
    NvimTreeEmptyFolderName = { link = "Directory" },
    NvimTreeExecFile = { fg = colors.yellow, bold = true },
    NvimTreeFolderIcon = { fg = colors.yellow },
    NvimTreeFolderName = { link = "Directory" },
    NvimTreeGitDeleted = { fg = colors.red },
    NvimTreeGitDirty = { fg = colors.pink },
    NvimTreeGitIgnored = { link = "Comment" },
    NvimTreeGitMerge = { fg = colors.purple },
    NvimTreeGitNew = { fg = colors.green },
    NvimTreeGitRenamed = { fg = colors.pink },
    NvimTreeGitStaged = { fg = colors.green },
    NvimTreeImageFile = { fg = colors.purple, bold = true },
    NvimTreeIndentMarker = { fg = colors.light_gray },
    NvimTreeLiveFilterPrefix = { fg = colors.pink, bold = true },
    NvimTreeLiveFilterValue = { bold = true },
    NvimTreeOpenedFile = { fg = colors.yellow, bold = true },
    NvimTreeOpenedFolderName = { link = "Directory" },
    NvimTreeRootFolder = { fg = colors.pink },
    NvimTreeSpecialFile = { fg = colors.green, bold = true, underline = true },
    NvimTreeSymlink = { fg = colors.pink, bold = true },
    NvimTreeWindowPicker = { fg = colors.white, bg = colors.aqua, bold = true },

    -- bufferline
    BufferLineDiagnostic = { fg = colors.dark_gray },
    BufferLineDiagnosticSelected = { fg = colors.light_gray, bold = true, italic = config.italics },
    BufferLineDiagnosticVisible = { fg = colors.dark_gray },
    BufferLineErrorDiagnostic = { fg = colors.dark_gray, sp = colors.red },
    BufferLineErrorDiagnosticSelected = { fg = colors.red, sp = colors.red, bold = true, italic = config.italics },
    BufferLineErrorDiagnosticVisible = { fg = colors.red },
    BufferLineHintDiagnostic = { fg = colors.dark_gray, sp = colors.light_gray },
    BufferLineHintDiagnosticSelected = {
        fg = colors.light_gray,
        sp = colors.light_gray,
        bold = true,
        italic = config.italics,
    },
    BufferLineHintDiagnosticVisible = { fg = colors.light_gray },
    BufferLineIndicatorSelected = { fg = colors.aqua },
    BufferLineInfoDiagnostic = { fg = colors.dark_gray, sp = colors.green },
    BufferLineInfoDiagnosticSelected = {
        fg = colors.green,
        sp = colors.green,
        bold = true,
        italic = config.italics,
    },
    BufferLineInfoDiagnosticVisible = { fg = colors.green },
    BufferLineModified = { fg = colors.pink },
    BufferLineModifiedSelected = { fg = colors.pink },
    BufferLineModifiedVisible = { fg = colors.pink },
    BufferLineNumbers = { fg = colors.purple },
    BufferLineNumbersSelected = { fg = colors.purple },
    BufferLineNumbersVisible = { fg = colors.purple },
    BufferLineWarningDiagnostic = { fg = colors.dark_gray, sp = colors.yellow },
    BufferLineWarningDiagnosticSelected = {
        fg = colors.yellow,
        sp = colors.yellow,
        bold = true,
        italic = config.italics,
    },
    BufferLineWarningDiagnosticVisible = { fg = colors.yellow },

    -- whichkey
    WhichKey = { fg = colors.yellow },
    WhichKeySeparator = { fg = colors.seagreen },

    -- nvim-cmp
    CmpItemAbbrDeprecated = { fg = colors.light_gray, strikethrough = true },
    CmpItemAbbrMatch = { fg = colors.lightblue },
    CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
    CmpItemKindClass = { fg = colors.fg },
    CmpItemKindConstant = { fg = colors.cyan },
    CmpItemKindConstructor = { link = "@constructor" },
    CmpItemKindEnum = { fg = colors.cyan },
    CmpItemKindEnumMember = { fg = colors.yellow },
    CmpItemKindEvent = { fg = colors.yellow },
    CmpItemKindField = { fg = colors.yellow },
    CmpItemKindFile = { fg = colors.white },
    CmpItemKindFolder = { fg = colors.yellow },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindInterface = { fg = colors.fg },
    CmpItemKindKeyword = { fg = colors.white },
    CmpItemKindMethod = { link = "Function" },
    CmpItemKindModule = { fg = colors.fg },
    CmpItemKindOperator = { link = "Operator" },
    CmpItemKindProperty = { fg = colors.yellow },
    CmpItemKindStruct = { fg = colors.fg },
    CmpItemKindText = { fg = colors.white },
    CmpItemKindUnit = { fg = colors.orange },
    CmpItemKindValue = { fg = colors.white },
    CmpItemKindVariable = { fg = colors.cyan },

    -- git-conflict
    GitConflictCurrent = { bg = colors.cyan:darken(0.4) },
    GitConflictIncoming = { bg = colors.green:darken(0.4) },
    GitConflictCurrentLabel = { fg = colors.white },
    GitConflictIncomingLabel = { fg = colors.white },

    -- lazy
    LazyButton = { fg = colors.white, bg = colors.vulcan },
    LazyButtonActive = { fg = colors.black, bg = colors.white },
    LazyComment = { link = "Comment" },
    LazyCommit = { fg = colors.green },
    LazyDimmed = { link = "Comment" },
    LazyCommitIssue = { link = "Number" },
    LazyCommitScope = { italic = config.italics },
    LazyCommitType = { fg = colors.yellow, bold = true },
    LazyDir = { fg = colors.yellow },
    LazyH1 = { fg = colors.black, bg = colors.white },
    LazyH2 = { fg = colors.white, bold = true },
    LazyNoCond = { link = "DiagnosticWarn" },
    LazyNormal = { link = "NormalFloat" },
    LazyProgressDone = { fg = colors.green },
    LazyProgressTodo = { fg = colors.light_gray },
    LazyProp = { fg = colors.gray },
    LazyReasonCmd = { fg = colors.green },
    LazyReasonEvent = { fg = colors.yellow },
    LazyReasonFt = { fg = colors.orange },
    LazyReasonImport = { fg = colors.pink },
    LazyReasonKeys = { fg = colors.cyan },
    LazyReasonPlugin = { fg = colors.purple },
    LazyReasonRuntime = { fg = colors.cyan },
    LazyReasonSource = { fg = colors.aqua },
    LazyReasonStart = { fg = colors.green },
    LazySpecial = { fg = colors.pink },
    LazyTaskError = { link = "ErrorMsg" },
    LazyTaskOutput = { link = "MsgArea" },
    LazyUrl = { fg = colors.aqua, undercurl = true },
    LazyValue = { fg = colors.fg },

    -- nvim-navic
    NavicIconsArray = { link = "Type" },
    NavicIconsBoolean = { link = "Boolean" },
    NavicIconsClass = { link = "CmpItemKindClass" },
    NavicIconsConstant = { link = "CmpItemKindConstant" },
    NavicIconsConstructor = { link = "CmpItemKindConstructor" },
    NavicIconsEnum = { link = "CmpItemKindEnum" },
    NavicIconsEnumMember = { link = "CmpItemKindEnumMember" },
    NavicIconsEvent = { link = "CmpItemKindEvent" },
    NavicIconsField = { link = "CmpItemKindField" },
    NavicIconsFile = { link = "CmpItemKindFile" },
    NavicIconsFunction = { link = "CmpItemKindFunction" },
    NavicIconsInterface = { link = "CmpItemKindInterface" },
    NavicIconsKey = { link = "CmpItemKindValue" },
    NavicIconsMethod = { link = "CmpItemKindMethod" },
    NavicIconsModule = { link = "CmpItemKindModule" },
    NavicIconsNamespace = { link = "CmpItemKindModule" },
    NavicIconsNull = { link = "Constant" },
    NavicIconsNumber = { link = "Number" },
    NavicIconsObject = { link = "CmpItemKindProperty" },
    NavicIconsOperator = { link = "CmpItemKindOperator" },
    NavicIconsPackage = { link = "CmpItemKindModule" },
    NavicIconsProperty = { link = "CmpItemKindProperty" },
    NavicIconsString = { link = "String" },
    NavicIconsStruct = { link = "CmpItemKindStruct" },
    NavicIconsTypeParameter = { link = "CmpItemKindTypeParameter" },
    NavicIconsVariable = { link = "CmpItemKindVariable" },
    NavicSeparator = { fg = colors.aqua },
    NavicText = { link = "Normal" },

    -- indent-blankline
    IndentBlanklineIndent1 = { fg = colors.pink, nocombine = true },
    IndentBlanklineIndent2 = { fg = colors.yellow, nocombine = true },
    IndentBlanklineIndent3 = { fg = colors.green, nocombine = true },
    IndentBlanklineIndent4 = { fg = colors.cyan, nocombine = true },
    IndentBlanklineIndent5 = { fg = colors.aqua, nocombine = true },
    IndentBlanklineIndent6 = { fg = colors.purple, nocombine = true },

    -- crates
    CratesNvimError = { fg = colors.red },
    CratesNvimLoading = { fg = colors.purple },
    CratesNvimNoMatch = { fg = colors.pink },
    CratesNvimPopupEnabled = { fg = colors.green },
    CratesNvimPopupFeature = { fg = colors.aqua },
    CratesNvimPopupPreRelease = { fg = colors.cyan },
    CratesNvimPopupTitle = { fg = colors.purple },
    CratesNvimPopupTransitive = { fg = colors.pink },
    CratesNvimPopupUrl = { fg = colors.aqua },
    CratesNvimPopupVersion = { fg = colors.green },
    CratesNvimPopupYanked = { fg = colors.pink },
    CratesNvimPreRelease = { fg = colors.cyan },
    CratesNvimUpgrade = { fg = colors.yellow },
    CratesNvimVersion = { fg = colors.green },
    CratesNvimYanked = { fg = colors.red },

    -- notify
    NotifyDEBUGBody = { fg = colors.fg },
    NotifyDEBUGBorder = { fg = colors.purple },
    NotifyDEBUGIcon = { fg = colors.purple },
    NotifyDEBUGTitle = { fg = colors.purple },
    NotifyERRORBody = { fg = colors.fg },
    NotifyERRORBorder = { fg = colors.red },
    NotifyERRORIcon = { fg = colors.red },
    NotifyERRORTitle = { fg = colors.red },
    NotifyINFOBody = { fg = colors.fg },
    NotifyINFOBorder = { fg = colors.green },
    NotifyINFOIcon = { fg = colors.green },
    NotifyINFOTitle = { fg = colors.green },
    NotifyTRACEBody = { fg = colors.fg },
    NotifyTRACEBorder = { fg = colors.white },
    NotifyTRACEIcon = { fg = colors.white },
    NotifyTRACETitle = { fg = colors.white },
    NotifyWARNBody = { fg = colors.fg },
    NotifyWARNBorder = { fg = colors.yellow },
    NotifyWARNIcon = { fg = colors.yellow },
    NotifyWARNTitle = { fg = colors.yellow },
}

-- hide all semantic highlights by default,
-- only enable those from the default table
for _, semantic_group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    if not defaults[semantic_group] then
        defaults[semantic_group] = {}
    end
end

groups = vim.deepcopy(defaults)

return groups
