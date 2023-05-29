local M = {}

---@class VerveineColor
M.day = {
	shade1 = "#fbfdfc", -- Client background
	shade2 = "#f8faf9", -- Subtle background
	shade3 = "#f1f4f3", -- Focus / Active background
	shade4 = "#ecefed", -- Menu and floating windows
	shade5 = "#dfe4e2",
	shade6 = "#d7dcda",
	shade7 = "#AEB7B3", -- Comment
	shade8 = "#8a918e", -- Comment, default icons
	shade9 = "#808784", -- Field, properties and
	shade10 = "#6a716e", -- Variables, parameters and delimiters
	shade11 = "#1D3029", -- Normal text, variables and parameters / operator
	shade12 = "#111c18", -- Method, functions

	stone = "#7B818A",
	orange = "#bb815d",
	gold = "#B4914C",
	sun = "#c5ad67",
	yellow = "#BAA947",
	lemon = "#82AC67",
	grass = "#64AA64",
	green = "#67ac8d",
	lightblue = "#6DBAD2",
	cyan = "#4FA5C0",
	blue = "#627694",
	indigo = "#565AA4",
	lavender = "#665b8d",
	violet = "#836ca6",
	magenta = "#b07fb9",
	pink = "#c18eaf",
	crimson = "#bf5a6d",
	red = "#e04242",
}

---@type VerveineColor
M.night = {
	shade1 = "#161616",
	shade2 = "#1c1c1c",
	shade3 = "#232323",
	shade4 = "#282828",
	shade5 = "#2e2e2e",
	shade6 = "#343434",
	shade7 = "#4f4f4f",
	shade8 = "#636363",
	shade9 = "#757575",
	shade10 = "#828282",
	shade11 = "#9e9e9e",
	shade12 = "#ededed",

	stone = "#757A85",
	orange = "#CBAA91",
	gold = "#c1a56c",
	sun = "#c1a56c",
	yellow = "#CBC791",
	lemon = "#82ac67",
	grass = "#79B190",
	green = "#9BB987",
	lightblue = "lightblue",
	cyan = "#64B0C8",
	blue = "#879BB9",
	indigo = "",
	lavender = "#8F8BB5",
	violet = "#948bb4",
	magenta = "#C099C3",
	pink = "#CDADCF",
	crimson = "#BA5454",
	red = "#D87474",
}

return M
