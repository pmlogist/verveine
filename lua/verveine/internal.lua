local M = {}

---@class VerveineHLValue
---@field fg string Foreground color
---@field bg string Background color
---@field sp string Decoration color
---@field blend number
---@field bold boolean
---@field standout boolean
---@field underline boolean
---@field undercurl boolean
---@field underdouble boolean
---@field underdotted boolean
---@field underdashed boolean
---@field strikethrough boolean
---@field italic boolean
---@field reverse boolean
---@field nocombine boolean
---@field link string Highlight group name
---@field default boolean
---@field ctermfg string
---@field ctermbg string
---@field cterm string

---@param group string
---@param val VerveineHLValue
function M.highlight(group, val)
	vim.api.nvim_set_hl(
		0,
		group,
		vim.tbl_extend("force", {}, {}, {
			bg = val.bg or "NONE",
			fg = val.fg or "NONE",
			sp = val.sp or "NONE",
			blend = val.blend, -- integer between 0 and 100
			bold = val.bold,
			standout = val.standout,
			underline = val.underline,
			undercurl = val.undercurl,
			underdouble = val.underdouble,
			underdotted = val.underdotted,
			underdashed = val.underdashed,
			strikethrough = val.strikethrough,
			italic = val.italic,
			reverse = val.reverse,
			nocombine = val.nocombine,
			link = val.link, -- name of another highlight group to link to, see |:hi-link|.
			default = val.default, -- : Don't override existing definition |:hi-default|
			ctermfg = val.ctermfg, -- Sets foreground of cterm color |ctermfg|
			ctermbg = val.ctermbg, --  Sets background of cterm color |ctermbg|
			cterm = val.cterm, -- cterm attribute map, like |highlight-args|. If not set, cterm attributes will match those from the attribute map documented above.
		})
	)
end

return M
