local colors = require("evernight.colors")

local M = {}

function M.setup(config)
  config = config or require("evernight.config")

  local theme = {}
  theme.config = config
  theme.colors = colors.setup(config)
  local c = theme.colors

  theme.base = {
    Comment = { fg = c.comment, style = config.commentStyle }, -- any comment
    ColorColumn = { bg = c.bg1 }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.gray0 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.bg, bg = c.green }, -- character under the cursor
    lCursor = { fg = c.bg, bg = c.orange }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { fg = c.bg, bg = c.fg }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = c.bg1 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = c.bg1 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = { fg = c.green }, -- directory names (and other special names in listings)
    DiffAdd = { bg = c.git.add }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.git.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.git.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.git.text }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor  = { }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = { fg = c.error }, -- error messages on the command line
    VertSplit = { fg = c.bg0 }, -- the column separating vertically split windows
    Folded = { fg = c.green, bg = c.bg2 }, -- line used for closed folds
    FoldColumn = { bg = c.bg, fg = c.comment }, -- 'foldcolumn'
    SignColumn = { bg = config.transparent and c.none or c.bg, fg = c.bg2 }, -- column where |signs| are displayed
    SignColumnSB = { bg = c.bg0, fg = c.bg2 }, -- column where |signs| are displayed
    Substitute = { bg = c.red, fg = c.bg }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.bg2 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.gray2 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = c.orange, style = "bold" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.fgd, style = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.fgd }, -- Area for messages and cmdline
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.blue }, -- |more-prompt|
    NonText = { fg = c.gray0 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.fg, bg = config.transparent and c.none or c.bg }, -- normal text
    NormalNC = { fg = c.fg, bg = config.transparent and c.none or c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.fgd, bg = c.bg0 }, -- normal text in non-current windows
    NormalFloat = { fg = c.fg, bg = c.bg0 }, -- Normal text in floating windows.
    FloatBorder = { fg = c.bg2, bg = c.bg0 },
    Pmenu = { bg = c.bg1, fg = c.fg }, -- Popup menu: normal item.
    PmenuSel = { bg = c.bg2 }, -- Popup menu: selected item.
    PmenuSbar = { bg = c.bg1 }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.bg2 }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.blue }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.bgb, style = "bold" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = c.bgv, fg = c.fg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { bg = c.orange, fg = c.bg }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    SpecialKey = { fg = c.gray0 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { sp = c.error, style = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.warning, style = "undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.info, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.hint, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.fgd, bg = c.bg2 }, -- status line of current window
    StatusLineNC = { fg = c.bg2, bg = c.bg1 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = c.bg1, fg = c.bg2 }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.bg }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.bg, bg = c.blue }, -- tab pages line, active tab page label
    Title = { fg = c.blue, style = "bold" }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.bgb }, -- Visual mode selection
    VisualNOS = { bg = c.bgb }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.warning }, -- warning messages
    Whitespace = { fg = c.bg2 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.bgb }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = c.orange }, -- (preferred) any constant
    String = { fg = c.teal }, --   a string constant: "this is a string"
    Character = { fg = c.green }, --  a character constant: 'c', '\n'
    Number = { fg = c.purple }, --   a number constant: 234, 0xff
    Boolean = { fg = c.orange }, --  a boolean constant: TRUE, false
    Float = { fg = c.purple }, --    a floating point constant: 2.3e10

    Identifier = { fg = c.blue, style = config.variableStyle }, -- (preferred) any variable name
    Function = { fg = c.green, style = config.functionStyle }, -- function name (also: methods for classes)

    Statement = { fg = c.red }, -- (preferred) any statement
    Conditional = { fg = c.red }, --  if, then, else, endif, switch, etc.
    Repeat = { fg = c.red }, --   for, do, while, etc.
    Label = { fg = c.orange }, --    case, default, etc.
    Operator = { fg = c.orange }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = c.red, style = config.keywordStyle }, --  any other keyword
    Exception = { fg = c.red }, --  try, catch, throw

    PreProc = { fg = c.purple }, -- (preferred) generic Preprocessor
    Include = { fg = c.purple }, --  preprocessor #include
    Define = { fg = c.purple }, --   preprocessor #define
    Macro = { fg = c.purple }, --    same as Define
    PreCondit = { fg = c.purple }, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = c.yellow }, -- (preferred) int, long, char, etc.
    StorageClass = { fg = c.orange }, -- static, register, volatile, etc.
    Structure = { fg = c.orange }, --  struct, union, enum, etc.
    Typedef = { fg = c.red }, --  A typedef

    Special = { fg = c.yellow }, -- (preferred) any special symbol
    SpecialChar = { fg = c.yellow }, --  special character in a constant
    Tag = { fg = c.orange }, --    you can use CTRL-] on this
    Delimiter = { fg = c.fg }, --  character that needs attention
    SpecialComment = { fg = c.gray1 }, -- special things inside a comment
    Debug = { fg = c.orange }, --    debugging statements

    Underlined = { style = "underline" }, -- (preferred) text that stands out, HTML links
    Bold = { style = "bold" },
    Italic = { style = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.error }, -- (preferred) any erroneous construct
    Todo = { bg = c.yellow, fg = c.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = { fg = c.gray2 },
    qfFileName = { fg = c.blue },

    htmlH1 = { fg = c.magenta, style = "bold" },
    htmlH2 = { fg = c.blue, style = "bold" },

    -- mkdHeading = { fg = c.orange, style = "bold" },
    -- mkdCode = { bg = c.gray0, fg = c.fg },
    mkdCodeDelimiter = { bg = c.gray0, fg = c.fg },
    mkdCodeStart = { fg = c.teal, style = "bold" },
    mkdCodeEnd = { fg = c.teal, style = "bold" },
    -- mkdLink = { fg = c.blue, style = "underline" },

    markdownHeadingDelimiter = { fg = c.orange, style = "bold" },
    markdownCode = { fg = c.teal },
    markdownCodeBlock = { fg = c.teal },
    markdownH1 = { fg = c.magenta, style = "bold" },
    markdownH2 = { fg = c.blue, style = "bold" },
    markdownLinkText = { fg = c.blue, style = "underline" },

    debugPC = { bg = c.bg0 }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = c.red, fg = c.bg }, -- used for breakpoint colors in terminal-debug

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = c.bg2 }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.bg2 }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.bg2 }, -- used for highlighting "write" references

    DiagnosticError = { fg = c.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = c.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = c.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = c.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticVirtualTextError = { bg = c.error, fg = c.bg }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { bg = c.warning, fg = c.bg }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { bg = c.info, fg = c.bg }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { bg = c.hint, fg = c.bg }, -- Used for "Hint" diagnostic virtual text

    DiagnosticUnderlineError = { style = "undercurl", sp = c.error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { style = "undercurl", sp = c.warning }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { style = "undercurl", sp = c.info }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { style = "undercurl", sp = c.hint }, -- Used to underline "Hint" diagnostics

    LspSignatureActiveParameter = { fg = c.orange },
    LspCodeLens = { fg = c.comment },

    ALEErrorSign = { fg = c.error },
    ALEWarningSign = { fg = c.warning },
  }

  if not vim.diagnostic then
    local severity_map = {
      Error = "Error",
      Warn = "Warning",
      Info = "Information",
      Hint = "Hint",
    }
    local types = { "Default", "VirtualText", "Underline" }
    for _, type in ipairs(types) do
      for snew, sold in pairs(severity_map) do
        theme.base["LspDiagnostics" .. type .. sold] = {
          link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
        }
      end
    end
  end

  theme.plugins = {

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    TSAnnotation = { fg = c.purple }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    TSAttribute = { fg = c.purple }, -- (unstable) TODO: docs
    TSBoolean = { fg = c.orange }, -- For booleans.
    TSCharacter = { fg = c.teal }, -- For characters.
    TSComment = { fg = c.comment }, -- For comment blocks.
    TSNote = { fg = c.bg0, bg = c.info },
    TSWarning = { fg = c.bg0, bg = c.warning },
    TSDanger = { fg = c.bg0, bg = c.error },
    TSConstructor = { fg = c.magenta }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    TSConditional = { fg = c.red }, -- For keywords related to conditionnals.
    TSConstant = { fg = c.orange }, -- For constants
    TSConstBuiltin = { fg = c.blue }, -- For constant that are built in the language: `nil` in Lua.
    TSConstMacro = { fg = c.blue }, -- For constants that are defined by macros: `NULL` in C.
    TSError = { fg = c.error }, -- For syntax/parser errors.
    TSException = { fg = c.error }, -- For exception related keywords.
    TSField = { fg = c.fg }, -- For fields.
    TSFloat = { fg = c.purple }, -- For floats.
    TSFunction = { fg = c.green }, -- For function (calls and definitions).
    TSFuncBuiltin = { fg = c.green }, -- For builtin functions: `table.insert` in Lua.
    TSFuncMacro = { fg = c.green }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude = { fg = c.red }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword = { fg = c.red, style = config.keywordStyle }, -- For keywords that don't fall in previous categories.
    TSKeywordFunction = { fg = c.red, style = config.functionStyle }, -- For keywords used to define a fuction.
    TSLabel = { fg = c.orange }, -- For labels: `label:` in C and `:label:` in Lua.
    TSMethod = { fg = c.green }, -- For method calls and definitions.
    TSNamespace = { fg = c.yellow, style = config.keywordStyle }, -- For identifiers referring to modules and namespaces.
    TSNone = { fg = c.fg }, -- TODO: docs
    TSNumber = { fg = c.purple }, -- For all numbers
    TSOperator = { fg = c.blue }, -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter = { fg = c.yellow }, -- For parameters of a function.
    TSParameterReference = { fg = c.fg }, -- For references to parameters of a function.
    TSProperty = { fg = c.fg }, -- Same as `TSField`.
    TSPunctDelimiter = { fg = c.gray0 }, -- For delimiters ie: `.`
    TSPunctBracket = { fg = c.fgd }, -- For brackets and parens.
    TSPunctSpecial = { fg = c.blue }, -- For special punctutation that does not fall in the catagories before.
    TSRepeat = { fg = c.red }, -- For keywords related to loops.
    TSString = { fg = c.teal }, -- For strings.
    TSStringRegex = { fg = c.cyan }, -- For regexes.
    TSStringEscape = { fg = c.magenta }, -- For escape characters within a string.
    TSSymbol = { fg = c.fg }, -- For identifiers referring to symbols or atoms.
    TSType = { fg = c.yellow }, -- For types.
    TSTypeBuiltin = { fg = c.yellow, style = config.variableStyle }, -- For builtin types.
    TSVariable = { fg = c.fg, style = config.variableStyle }, -- Any variable name that does not have another highlight.
    TSVariableBuiltin = { fg = c.blue }, -- Variable names that are defined by the languages, like `this` or `self`.

    TSTag = { fg = c.orange }, -- Tags like html tag names.
    TSTagDelimiter = { fg = c.green }, -- Tag delimiter like `<` `>` `/`
    TSText = { fg = c.green }, -- For strings considered text in a markup language.
    TSTextReference = { fg = c.teal },
    -- TSEmphasis          = { };    -- For text to be represented with emphasis.
    -- TSUnderline         = { };    -- For text to be represented with an underline.
    -- TSStrike            = { };    -- For strikethrough text.
    -- TSTitle             = { };    -- Text that is part of a title.
    -- TSLiteral           = { };    -- Literal text.
    -- TSURI               = { };    -- Any URI like a link or email.

    -- Lua
    -- luaTSProperty = { fg = c.red }, -- Same as `TSField`.

    -- LspTrouble
    LspTroubleText = { fg = c.fgd },
    LspTroubleCount = { fg = c.magenta, bg = c.bg2 },
    LspTroubleNormal = { fg = c.fgd, bg = c.bg0 },

    -- Illuminate
    illuminatedWord = { bg = c.bg2 },
    illuminatedCurWord = { bg = c.bg2 },

    -- diff
    diffAdded = { fg = c.git.add },
    diffRemoved = { fg = c.git.delete },
    diffChanged = { fg = c.git.change },
    diffOldFile = { fg = c.yellow },
    diffNewFile = { fg = c.orange },
    diffFile = { fg = c.blue },
    diffLine = { fg = c.comment },
    diffIndexLine = { fg = c.magenta },

    -- Neogit
    NeogitBranch = { fg = c.red },
    NeogitRemote = { fg = c.purple },
    NeogitHunkHeader = { bg = c.bg1, fg = c.fg },
    NeogitHunkHeaderHighlight = { bg = c.bg2, fg = c.blue },
    NeogitDiffContextHighlight = { bg = c.bg2, fg = c.fgd },
    NeogitDiffDeleteHighlight = { fg = c.git.delete, bg = c.git.delete },
    NeogitDiffAddHighlight = { fg = c.git.add, bg = c.git.add },

    -- GitGutter
    GitGutterAdd = { fg = c.git.add }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = c.git.change }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = c.git.delete }, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd = { fg = c.git.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.git.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.git.delete }, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopeBorder = { fg = c.bg2, bg = c.bg0 },
    TelescopeNormal = { fg = c.fg, bg = c.bg0 },

    -- NvimTree
    NvimTreeNormal = { fg = c.fg, bg = c.bg0 },
    NvimTreeNormalNC = { fg = c.fg, bg = c.bg0 },
    NvimTreeRootFolder = { fg = c.gray, style = "bold" },
    NvimTreeFolderName = { fg = c.green },
    NvimTreeFolderIcon = { fg = c.orange },
    NvimTreeEmptyFolderName = { fg = c.green },
    NvimTreeOpenedFolderName = { fg = c.green },
    NvimTreeExecFile = { fg = c.fg },
    NvimTreeOpenedFile = { fg = c.fg },
    NvimTreeSpecialFile = { fg = c.fg },
    NvimTreeImageFile = { fg = c.fg },
    NvimTreeMarkdownFile = { fg = c.cyan },
    NvimTreeGitDirty = { fg = c.git.change },
    NvimTreeGitNew = { fg = c.git.add },
    NvimTreeGitDeleted = { fg = c.git.delete },
    NvimTreeGitMerge = { fg = c.orange },
    NvimTreeGitRename = { fg = c.purple },
    NvimTreeGitStaged = { fg = c.blue },
    NvimTreeLspDiagnosticsError = { fg = c.error },
    NvimTreeLspDiagnosticsWarning = { fg = c.warning },
    NvimTreeLspDiagnosticsInformation = { fg = c.info },
    NvimTreeLspDiagnosticsHint = { fg = c.hint },
    NvimTreeIndentMarker = { fg = c.bg2 },
    NvimTreeSymlink = { fg = c.teal },

    -- Fern
    FernBranchText = { fg = c.blue },

    -- glyph palette
    GlyphPalette1 = { fg = c.red },
    GlyphPalette2 = { fg = c.green },
    GlyphPalette3 = { fg = c.yellow },
    GlyphPalette4 = { fg = c.blue },
    GlyphPalette6 = { fg = c.green },
    GlyphPalette7 = { fg = c.fg },
    GlyphPalette9 = { fg = c.red },

    -- Dashboard
    DashboardShortCut = { fg = c.cyan },
    DashboardHeader = { fg = c.blue },
    DashboardCenter = { fg = c.magenta },
    DashboardFooter = { fg = c.yellow, style = "italic" },

    -- WhichKey
    WhichKey = { fg = c.red },
    WhichKeyGroup = { fg = c.yellow },
    WhichKeyDesc = { fg = c.blue },
    WhichKeySeperator = { fg = c.comment },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyFloat = { bg = c.bg0 },
    WhichKeyValue = { fg = c.gray2 },

    -- LspSaga
    DiagnosticWarning = { link = "DiagnosticWarn" },
    DiagnosticInformation = { link = "DiagnosticInfo" },

    LspSagaAutoPreview = { fg = c.green },
    LspSagaDiagnosticBorder = { fg = c.orange },
    LspSagaDiagnosticTruncateLine = { fg = c.orange },
    LspFloatWinNormal = { bg = c.bg0 },
    LspFloatWinBorder = { fg = c.bg2 },
    LspSagaBorderTitle = { fg = c.cyan },
    LspSagaHoverBorder = { fg = c.blue },
    LspSagaRenameBorder = { fg = c.purple },
    LspSagaDefPreviewBorder = { fg = c.blue },
    LspSagaCodeActionBorder = { fg = c.purple },
    LspSagaFinderSelection = { fg = c.fgd },
    LspSagaCodeActionTitle = { fg = c.blue },
    LspSagaCodeActionContent = { fg = c.purple },
    LspSagaSignatureHelpBorder = { fg = c.red },
    ReferencesCount = { fg = c.purple },
    DefinitionCount = { fg = c.purple },
    DefinitionIcon = { fg = c.blue },
    ReferencesIcon = { fg = c.blue },
    TargetWord = { fg = c.cyan },

    -- NeoVim
    healthError = { fg = c.error },
    healthSuccess = { fg = c.green },
    healthWarning = { fg = c.warning },

    -- BufferLine
    BufferLineIndicatorSelected = { fg = c.git.change },
    BufferLineFill = { bg = c.bg },

    -- Barbar
    BufferCurrent = { bg = c.bg2, fg = c.fg },
    BufferCurrentIndex = { bg = c.bg2, fg = c.info },
    BufferCurrentMod = { bg = c.bg2, fg = c.warning },
    BufferCurrentSign = { bg = c.bg2, fg = c.info },
    BufferCurrentTarget = { bg = c.bg2, fg = c.red },
    BufferVisible = { bg = c.bg1, fg = c.fg },
    BufferVisibleIndex = { bg = c.bg1, fg = c.info },
    BufferVisibleMod = { bg = c.bg1, fg = c.warning },
    BufferVisibleSign = { bg = c.bg1, fg = c.info },
    BufferVisibleTarget = { bg = c.bg1, fg = c.red },
    BufferInactive = { bg = c.bg1, fg = c.gray2 },
    BufferInactiveIndex = { bg = c.bg1, fg = c.gray2 },
    BufferInactiveMod = { bg = c.bg1, fg = c.warning },
    BufferInactiveSign = { bg = c.bg1, fg = c.bg2 },
    BufferInactiveTarget = { bg = c.bg1, fg = c.red },
    BufferTabpages = { bg = c.bg1, fg = c.none },
    BufferTabpage = { bg = c.bg1, fg = c.bg2 },

    -- Sneak
    Sneak = { fg = c.bg1, bg = c.magenta },
    SneakScope = { bg = c.bgb },

    -- Hop
    HopNextKey = { fg = c.magenta, style = "bold" },
    HopNextKey1 = { fg = c.blue, style = "bold" },
    HopNextKey2 = { fg = c.teal },
    HopUnmatched = { fg = c.gray0 },

    LightspeedGreyWash = { fg = c.gray0 },
    -- LightspeedCursor = { link = "Cursor" },
    LightspeedLabel = { fg = c.magenta, style = "bold,underline" },
    LightspeedLabelDistant = { fg = c.green, style = "bold,underline" },
    LightspeedLabelDistantOverlapped = { fg = c.green2, style = "underline" },
    LightspeedLabelOverlapped = { fg = c.magenta, style = "underline" },
    LightspeedMaskedChar = { fg = c.orange },
    LightspeedOneCharMatch = { bg = c.magenta, fg = c.fg, style = "bold" },
    LightspeedPendingOpArea = { bg = c.magenta, fg = c.fg },
    LightspeedShortcut = { bg = c.magenta, fg = c.fg, style = "bold,underline" },
    -- LightspeedShortcutOverlapped = { link = "LightspeedShortcut" },
    -- LightspeedUniqueChar = { link = "LightspeedUnlabeledMatch" },
    LightspeedUnlabeledMatch = { fg = c.blue, style = "bold" },

    -- Cmp
    CmpDocumentation = { fg = c.fg, bg = c.bg0 },
    CmpDocumentationBorder = { fg = c.bg2, bg = c.bg0 },

    CmpItemAbbr = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated = { fg = c.fgd, bg = c.none, style = "strikethrough" },
    CmpItemAbbrMatch = { fg = c.blue, bg = c.none },
    CmpItemAbbrMatchFuzzy = { fg = c.blue, bg = c.none },

    CmpItemKindDefault = { fg = c.fgd, bg = c.none },
    CmpItemMenu = { fg = c.comment, bg = c.none },

    CmpItemKindKeyword = { fg = c.red, bg = c.none },

    CmpItemKindVariable = { fg = c.blue, bg = c.none },
    CmpItemKindConstant = { fg = c.blue, bg = c.none },
    CmpItemKindReference = { fg = c.blue, bg = c.none },
    CmpItemKindValue = { fg = c.blue, bg = c.none },

    CmpItemKindFunction = { fg = c.green, bg = c.none },
    CmpItemKindMethod = { fg = c.green, bg = c.none },
    CmpItemKindConstructor = { fg = c.green, bg = c.none },

    CmpItemKindClass = { fg = c.yellow, bg = c.none },
    CmpItemKindInterface = { fg = c.yellow, bg = c.none },
    CmpItemKindStruct = { fg = c.yellow, bg = c.none },
    CmpItemKindEvent = { fg = c.orange, bg = c.none },
    CmpItemKindEnum = { fg = c.yellow, bg = c.none },
    CmpItemKindUnit = { fg = c.purple, bg = c.none },

    CmpItemKindModule = { fg = c.yellow, bg = c.none },

    CmpItemKindProperty = { fg = c.blue, bg = c.none },
    CmpItemKindField = { fg = c.green, bg = c.none },
    CmpItemKindTypeParameter = { fg = c.yellow, bg = c.none },
    CmpItemKindEnumMember = { fg = c.purple, bg = c.none },
    CmpItemKindOperator = { fg = c.orange, bg = c.none },
    CmpItemKindSnippet = { fg = c.teal, bg = c.none },
  }

  theme.defer = {}

  return theme
end

return M
