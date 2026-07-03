-- FILE: lua/fex/render.lua  (sin cambios)
local api = vim.api
local paths = require("fex.paths")

local M = {}

function M.render(ctx, path, selectName)
	local lines = {}
	local entries = {}

	local handle = vim.loop.fs_scandir(path)
	if not handle then
		return lines
	end

	while true do
		local name, t = vim.loop.fs_scandir_next(handle)
		if not name then
			break
		end
		table.insert(entries, { name = name, isDir = (t == "directory") })
	end

	table.sort(entries, function(a, b)
		if a.isDir ~= b.isDir then
			return a.isDir
		end
		return a.name < b.name
	end)

	table.insert(lines, {
		name = path,
		isRoot = true,
		isDir = true,
		text = path,
	})

	for _, entry in ipairs(entries) do
		local text = entry.name .. (entry.isDir and "/" or "")
		table.insert(lines, {
			name = paths.add(path, entry.name),
			isDir = entry.isDir,
			text = text,
		})
	end

	local buf = ctx.buf
	api.nvim_buf_set_option(buf, "modifiable", true)
	api.nvim_buf_set_lines(buf, 0, -1, false, vim.tbl_map(function(l) return l.text end, lines))
	api.nvim_buf_set_option(buf, "modifiable", false)

	api.nvim_buf_clear_namespace(buf, ctx.ns, 0, -1)
	for i, entry in ipairs(lines) do
		if entry.isDir then
			api.nvim_buf_add_highlight(buf, ctx.ns, "Directory", i-1, 0, #entry.text)
		end
	end

	api.nvim_buf_set_var(buf, "lines", lines)

	if selectName and selectName ~= "" then
		for i, entry in ipairs(lines) do
			if not entry.isRoot and paths.name(entry.name) == selectName then
				api.nvim_win_set_cursor(ctx.win, { i, 0 })
				break
			end
		end
	end

	return lines
end

return M
