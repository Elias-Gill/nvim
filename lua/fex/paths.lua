-- FILE: lua/fex/paths.lua
local M = {}
local fn = vim.fn
M.full = function(p)
	return fn.fnamemodify(p, ":p")
end
M.name = function(p)
	return fn.fnamemodify(p, ":t")
end
M.directory = function(p)
	return fn.fnamemodify(p, ":h")
end
M.currentFile = function()
	return fn.expand("%:p")
end
M.add = function(p, part)
	p = fn.fnamemodify(p, ":p")
	if p:sub(-1) ~= "/" then
		p = p .. "/"
	end
	return p .. part
end
return M
