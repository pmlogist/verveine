local M = {}

---@alias VerveineHLConfig table<string, VerveineHLConfig>

---@type VerveineHLConfig
M.highlights = nil
---@param colors VerveineColor
---@param overrides VerveineHLConfig
---@param transparent ?boolean
function M.init_highlights(colors, overrides, transparent)
	---@type VerveineHLConfig
	local default_highlights = {
		--- [[ Editor ]] ---
		ColorColumn = {}, -- Used for the columns set with 'colorcolumn'.
		Conceal = {}, -- Placeholder characters substituted for concealed text (see 'conceallevel').
		CurSearch = {}, -- Used for highlighting a search pattern under the cursor (see 'hlsearch').
		Cursor = {}, -- Character under the cursor.
		lCursor = {}, -- Character under the cursor when |language-mapping| is used (see 'guicursor').
		CursorIM = {}, -- Like Cursor, but used when in IME mode. *CursorIM*
		CursorColumn = {}, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = colors.shade3 }, -- Screen-line at the cursor, when 'cursorline' is set. --  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory = {}, -- Directory names (and other special names in listings).
		DiffAdd = { fg = colors.green }, -- Diff mode: Added line.
		DiffChange = { fg = colors.sun }, -- Diff mode: Changed line.
		DiffDelete = { fg = colors.red }, -- Diff mode: Deleted line. |diff.txt|
		DiffText = {}, -- Diff mode: Changed text within a changed line. |diff.txt|
		EndOfBuffer = { fg = colors.shade1 }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		TermCursor = {}, -- Cursor in a focused terminal.
		TermCursorNC = {}, -- Cursor in an unfocused terminal.
		ErrorMsg = { link = "DiffDelete" }, -- Error messages on the command line.
		WinSeparator = { fg = colors.shade5, bg = colors.shade1 }, -- Separators between window splits.
		Folded = {}, -- Line used for closed folds.
		FoldColumn = {}, -- 'foldcolumn'
		SignColumn = { bg = colors.shade2 }, -- Column where |signs| are displayed.
		IncSearch = {}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c".
		Substitute = {}, --	|:substitute| replacement text highlighting.
		LineNr = { fg = colors.shade4 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove = { fg = colors.shade7, bg = colors.shade2 }, --  Line number for when the 'relativenumber' option is set, above the cursor line.
		LineNrBelow = { fg = colors.shade7, bg = colors.shade2 }, --  Line number for when the 'relativenumber' option is set, below the cursor line.
		CursorLineNr = { fg = colors.shade11, bold = true }, -- CursorLineN Like LineNr when 'cursorline' is set and 'cursorlineopt' contains "number" or is "both", for the cursor line.
		CursorLineFold = { bold = true, underline = true }, --	Like FoldColumn when 'cursorline' is set for the cursor line.
		CursorLineSign = { bg = colors.shade2 }, --	Like SignColumn when 'cursorline' is set for the cursor line.
		MatchParen = {}, --	Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = {}, -- 'showmode' message (e.g., "-- INSERT --").
		MsgArea = {}, -- Area for messages and cmdline.
		-- MsgSeparator -- Separator for scrolled messages |msgsep|.
		-- MoreMsg -- |more-prompt|
		-- NonText -- '@' at the end of the window from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { fg = colors.shade11, bg = transparent and "NONE" or colors.shade1 }, -- Normal text. *hl-Normal*
		NormalFloat = { bg = colors.shade4 }, -- NormalFloat	Normal text in floating windows. *hl-NormalFloat*
		FloatBorder = { fg = colors.shade4 }, -- Border of floating windows.
		-- FloatTitle -- Title of floating windows.
		-- NormalNC -- Normal text in non-current windows.
		Pmenu = { fg = colors.shade10, bg = colors.shade4 }, -- Popup menu: Normal item.
		PmenuSel = { fg = colors.shade12, bg = colors.shade6 }, -- Popup menu: Selected item.
		PmenuKind = {}, -- Popup menu: Normal item "kind".
		-- PmenuKindSel -- Popup menu: Selected item "kind".
		-- PmenuExtra -- Popup menu: Normal item "extra text".
		-- PmenuExtraSel -- Popup menu: Selected item "extra text".
		PmenuSbar = { bg = colors.shade5 }, -- Popup menu: Scrollbar.
		PmenuThumb = { bg = colors.shade6 }, -- Popup menu: Thumb of the scrollbar.
		-- Question -- |hit-enter| prompt and yes/no questions.
		-- QuickFixLine -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = { fg = colors.shade1, bg = colors.orange }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out. SpecialKey	Unprintable characters: Text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = { fg = colors.red, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		Statusline = { fg = colors.shade1, bg = colors.cyan }, -- Status line of current window.
		-- StatusLineNC -- Status lines of not-current windows. Note: If this is equal to "StatusLine", Vim will use "^^^" in the status line of the current window.
		-- TabLine -- Tab pages line, not active tab page label.
		-- TabLineFill -- Tab pages line, where there are no labels.
		-- TabLineSel -- ab pages line, active tab page label.
		Title = { fg = colors.shade12, bold = true }, -- Titles for output from ":set all", ":autocmd" etc.
		-- Visual -- Visual mode selection.
		-- VisualNOS -- Visual mode selection when vim is "Not Owning the Selection".
		-- WarningMsg -- Warning messages.
		-- Whitespace -- "nbsp", "space", "tab", "multispace", "lead" and "trail" in 'listchars'.
		-- WildMenu -- Current match in 'wildmenu' completion.
		-- WinBar -- Window bar of current window.
		-- WinBarNC -- Window bar of not-current windows.

		--- [[ Syntax ]] ---
		Comment = { fg = colors.shade7, italic = true },
		Constant = { fg = colors.shade11 },
		String = { fg = colors.grass },
		Character = {},
		Number = { fg = colors.pink },
		Boolean = { fg = colors.lavender },
		Float = { link = "Number" },
		NonText = { fg = colors.shade2 },
		Identifier = { fg = colors.shade12 },
		Function = { fg = colors.shade12, bold = false },
		Statement = { link = "Keyword" },
		Conditional = { link = "Keyword" },
		Repeat = { link = "Keyword" },
		Label = { fg = colors.blue },
		Operator = { fg = colors.shade11 },
		Keyword = { fg = colors.stone },
		Exception = {},
		PreProc = { fg = colors.green },
		Include = { fg = colors.stone },
		Define = {},
		Macro = { fg = colors.yellow },
		PreCondit = {},
		Type = { fg = colors.yellow },
		StorageClass = {},
		Structure = { colors.shade11 },
		Typedef = {},
		Special = { fg = colors.shade12 },
		Tag = { fg = colors.blue },
		Delimiter = { fg = colors.shade11 },
		SpecialComment = {},
		Debug = {},
		Underlined = { fg = colors.green, underline = true },
		Ignore = { fg = colors.shade6 },
		Error = { fg = colors.red },
		Todo = { fg = colors.crimson },
	}

	local addons_highlights = {
		-- Gitsigns
		GitSignsAdd = { fg = colors.green, bg = colors.shade2 },
		GitSignsAddNr = { fg = colors.green, bg = colors.shade2 },
		GitSignsAddLn = { fg = colors.green, bg = colors.shade2 },
		GitSignsChange = { fg = colors.orange, bg = colors.shade2 },
		GitSignsChangeNr = { fg = colors.orange, bg = colors.shade2 },
		GitSignsChangeLn = { fg = colors.orange, bg = colors.shade2 },
		GitSignsDelete = { fg = colors.red, bg = colors.shade2 },
		GitSignsDeleteNr = { fg = colors.red, bg = colors.shade2 },
		GitSignsDeleteLn = { fg = colors.red, bg = colors.shade2 },

		-- Indent Blankline
		IndentBlanklineChar = { fg = colors.shade6 },
		IndentBlanklineContextChar = { fg = colors.shade11 },

		-- Neotree
		NeoTreeNormal = { bg = colors.shade2 },
		NeoTreeDirectoryName = { fg = colors.shade9 },
		NeoTreeDirectoryIcon = { fg = colors.shade8 },
		NeoTreeVertSplit = { link = "VertSplit" },
		NeoTreeWinSeparator = { link = "WinSeparator" },
		NeoTreeEndOfBuffer = { fg = colors.shade2 },

		NeoTreeGitAdded = { link = "DiffAdd" }, -- File name when the git status is added.
		NeoTreeGitConflict = {}, -- File name when the git status is conflict.
		NeoTreeGitDeleted = { link = "DiffDelete" }, -- File name when the git status is deleted.
		NeoTreeGitIgnored = {}, -- File name when the git status is ignored.
		NeoTreeGitModified = { link = "DiffChange" }, -- File name when the git status is modified.
		NeoTreeGitUnstaged = {}, -- Used for git unstaged symbol.
		NeoTreeGitUntracked = {}, -- File name when the git status is untracked.
		NeoTreeGitStaged = {}, -- Used for git staged symbol.

		NeoTreeIndentMarker = { link = "IndentBlanklineChar" },

		-- Noice
		NoiceMini = { link = "Pmenu" },

		-- Diagnostics
		DiagnosticError = { fg = colors.red, bg = colors.shade2 },
		DiagnosticVirtualTextError = { fg = colors.shade1, bg = colors.red },
		DiagnosticWarn = { fg = colors.orange },
		DiagnosticVirtualTextWarn = { fg = colors.shade1, bg = colors.orange },
		DiagnosticInfo = { fg = colors.lightblue },
		DiagnosticVirtualTextInfo = { fg = colors.shade1, bg = colors.lightblue },
		DiagnosticHint = { fg = colors.shade11 },
		DiagnosticVirtualTextHint = { fg = colors.shade1, bg = colors.shade7 },

		LspCodeLens = { fg = colors.shade7 },

		-- Treesitter
		["@comment"] = { link = "Comment" },
		["@conditional"] = { link = "Conditional" },
		["@conditional.ternary"] = { colors.pink },
		["@constructor"] = { fg = colors.shade12 },
		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { fg = colors.pink },
		["@error"] = { link = "Error" },
		["@function"] = { link = "Function" },
		["@function.builtin"] = { link = "@function.call" },
		["@function.call"] = { fg = colors.blue },
		["@field"] = { fg = colors.shade9 },
		["@keyword"] = { link = "Keyword" },
		["@operator"] = { link = "Operator" },
		["@method"] = { link = "@function" },
		["@method.call"] = { link = "@function.call" },
		["@namespace.builtin"] = { fg = colors.shade11 },
		["@none"] = { fg = colors.shade11 },
		-- ["@punctuation.bracket"] = { fg = colors.shade11 },
		["@punctuation.delimiter"] = { link = "Delimiter" },
		["@parameter"] = { fg = colors.shade10 },
		["@property"] = { link = "@field" },
		["@tag"] = { link = "Tag" },
		["@tag.delimiter"] = { link = "Delimiter" },
		["@tag.attribute"] = { fg = colors.shade11 },
		-- -- ["@text.uri"] = { fg = "#67A8AC", spec = "underline" },
		-- ["@text.title.1"] = { fg = colors.shade10, bold = true },
		-- ["@text.title.2"] = { fg = colors.shade10, bold = true },
		-- ["@text.title.3"] = { fg = colors.shade10, bold = true },
		-- ["@text.title.4"] = { fg = colors.shade10, bold = true },
		-- ["@text.title.5"] = { fg = colors.shade10, bold = true },
		-- ["@text.title.6"] = { fg = colors.shade10, bold = true },
		-- ["@text.title.1.marker"] = { fg = "orange" },
		-- ["@text.title.2.marker"] = { fg = "orange" },
		-- ["@text.title.3.marker"] = { fg = "orange" },
		-- ["@text.title.4.marker"] = { fg = "orange" },
		-- ["@text.title.5.marker"] = { fg = "orange" },
		-- ["@text.title.6.marker"] = { fg = "orange" },
		["@text.uri"] = { fg = colors.green, italic = true, underline = true },
		--
		["@variable"] = { fg = colors.shade11 },
		["@variable.builtin"] = { fg = colors.pink },
		["@type"] = { link = "Type" },
		["@type.builtin"] = { fg = colors.gold },
		-- lua
		["@constructor.lua"] = { link = "Delimiter" },
		-- -- ["@field.lua"] = { fg = colors.yellow },
		-- -- ["@property.lua"] = { fg = colors.syntax.property },
		-- -- vimdoc
		-- ["@label.vimdoc"] = { fg = colors.lavender },
		-- ["@text.literal.block.vimdoc"] = { fg = colors.shade7 },
	}

	local semantics_highlights = {}
	if vim.version().minor >= 9 then
		semantics_highlights = {
			["@lsp.type.class"] = { link = "@constructor" },
			["@lsp.type.parameter"] = { link = "@parameter" },
			["@lsp.type.property"] = { link = "@property" },
			["@lsp.type.variable"] = { link = "@variable" },
			["@lsp.type.type"] = { link = "@type" },
			["@lsp.type.function"] = { link = "@function.call" },
		}
	end

	M.highlights =
		vim.tbl_deep_extend("force", default_highlights, addons_highlights, semantics_highlights, overrides or {})
end

---@param color string
function M.get_colors(color)
	return require("verveine.colors")[color]
end

function M.setup(opts)
	package.loaded["verveine"] = nil
	package.loaded["verveine.internal"] = nil
	package.loaded["verveine.colors"] = nil

	opts = opts or { theme = "night" }

	if vim.g.colors_name then
		vim.cmd([[hi clear]])
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "verveine"

	local highlight = require("verveine.internal").highlight
	local colors = require("verveine.colors")

	M.init_highlights(opts.theme and colors[opts.theme] or colors.night, opts.hl_overrides or {}, opts.transparent)

	for group, hls in pairs(M.highlights) do
		highlight(group, hls)
	end

	vim.api.nvim_command("redraw")

	local ok, _ = pcall(require, "lualine")
	if not ok then
		return
	else
		package.loaded["lualine"].refresh()
	end
end

function M.reload()
	package.loaded["verveine"] = nil
	package.loaded["verveine.internal"] = nil
	package.loaded["verveine.colors"] = nil

	M.setup()
end

return M
