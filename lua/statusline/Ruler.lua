local Space = { provider = " " }
-- %l = current line number
-- %L = number of lines in the buffer
-- %c = column number
-- %P = percentage through file of displayed window

local Line = {
	provider = "L%l/%L"
}
local Column = {
	provider = "C%c"
}
local Percent = {
	provider = "%p%%"
}

local Ruler = {
	Line,
	Space,
	Column,
	Space,
	Percent,
}

return Ruler
