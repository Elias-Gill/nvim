local M = {}

-- Configuration
M.config = {
	db = "",
	user = vim.g.sql_default_user or "postgres",
	tmp_file = "/tmp/vim_sql_query.sql",
	result_file = "/tmp/vim_sql_result.txt",
	graph_file = "/tmp/vim_sql_graph.txt",
}

-- Utility functions
local function system_list(cmd)
	local handle = io.popen(cmd)
	if not handle then
		return nil
	end
	local result = {}
	for line in handle:lines() do
		table.insert(result, line)
	end
	handle:close()
	return result
end

local function echoerr(msg)
	vim.api.nvim_err_writeln(msg)
end

-- Database operations
function M.list_databases()
	local cmd = string.format(
		"psql -U %s -lt --no-align --tuples-only | cut -d'|' -f1 | sed -e 's/ //g' | grep -v '^$' | grep -v '^template[0-9]' | grep -v '^postgres$'",
		vim.fn.shellescape(M.config.user)
	)

	local databases = system_list(cmd)
	if not databases or #databases == 0 then
		echoerr("Error al listar bases de datos")
		return {}
	end

	-- Filter results
	local filtered = {}
	for _, db in ipairs(databases) do
		if not (db:match("^%s*$") or db == "template0" or db == "template1") then
			table.insert(filtered, db)
		end
	end

	if #filtered == 0 then
		echoerr("No hay bases de datos disponibles")
		return {}
	end

	return filtered
end

function M.select_database()
	local dbs = M.list_databases()
	if #dbs == 0 then
		return
	end

	local output = { "Select database:" }
	for i, db in ipairs(dbs) do
		table.insert(output, string.format("%2d. %s", i, db))
	end
	table.insert(output, "")

	local choice = vim.fn.input(table.concat(output, "\n") .. "Database number or name: ")
	choice = vim.trim(choice)

	if choice:match("^%d+$") then
		local index = tonumber(choice)
		if index > 0 and index <= #dbs then
			M.config.db = dbs[index]
		else
			echoerr("Selección inválida")
		end
	elseif vim.tbl_contains(dbs, choice) then
		M.config.db = choice
	else
		echoerr("Nombre inválido de base de datos")
	end
end

function M.change_user()
	M.config.user = vim.fn.input("PostgreSQL username: ", M.config.user)
end

-- SQL Execution
function M.open_result_file()
	local result_file = M.config.result_file
	vim.cmd("silent! vsplit | view " .. result_file)
	vim.cmd("setlocal readonly")
	vim.cmd("setlocal nomodifiable")
	vim.cmd("match DiagnosticError '.*ERROR.*'")
	vim.cmd("2match DiagnosticOk '.*----.*'")
end

function M.execute(file)
	vim.notify("Ejecutando archivo: " .. file, vim.log.levels.INFO)

	if M.config.db == "" then
		M.select_database()
		if M.config.db == "" then
			echoerr("No se proporciono DB")
			return
		end
	end

	local cmd = string.format(
		"psql -U %s -d %s -a -f %s > %s 2>&1",
		vim.fn.shellescape(M.config.user),
		vim.fn.shellescape(M.config.db),
		vim.fn.shellescape(file),
		vim.fn.shellescape(M.config.result_file)
	)

	local result = vim.fn.system(cmd)
	if vim.v.shell_error ~= 0 then
		echoerr("Error al ejecutar el script SQL")
	end

	M.open_result_file()
end

-- Graph Visualization Functions
function M.get_foreign_keys()
	-- Verificar conexión primero
	if M.config.db == "" then
		M.select_database() -- Asegúrate que esto devuelve nil o establece M.config.db
		if M.config.db == "" then
			vim.notify("No database selected", vim.log.levels.ERROR)
			return nil
		end
	end

	-- Consulta SQL optimizada
	local query = [[
    SELECT
      tc.table_name,
      kcu.column_name,
      ccu.table_name,
      ccu.column_name
    FROM
      information_schema.table_constraints tc
      JOIN information_schema.key_column_usage kcu
        ON tc.constraint_name = kcu.constraint_name
        AND tc.table_schema = kcu.table_schema
      JOIN information_schema.constraint_column_usage ccu
        ON ccu.constraint_name = tc.constraint_name
        AND ccu.table_schema = tc.table_schema
    WHERE tc.constraint_type = 'FOREIGN KEY'
    AND tc.table_schema = 'public'
    ORDER BY 1, 2, 3, 4
  ]]

	-- Construir comando psql seguro
	local cmd = {
		"psql",
		"-U",
		M.config.user,
		"-d",
		M.config.db,
		"-c",
		query,
		"--no-align",
		"--tuples-only",
		"-F",
		"|",
	}

	-- Ejecutar y capturar resultado
	local result = vim.fn.system(cmd)
	if vim.v.shell_error ~= 0 then
		vim.notify("Error getting foreign keys: " .. result, vim.log.levels.ERROR)
		return nil
	end

	-- Parsear resultados
	local fks = {}
	for line in vim.gsplit(result, "\n") do
		line = vim.trim(line)
		if line ~= "" then
			local parts = vim.split(line, "|")
			if #parts >= 4 then
				table.insert(fks, {
					from_table = parts[1],
					from_column = parts[2],
					to_table = parts[3],
					to_column = parts[4],
				})
			end
		end
	end

	return #fks > 0 and fks or nil
end

function M.generate_graph()
	local fks = M.get_foreign_keys()
	if not fks then
		return
	end

	-- Format for easy-graph --boxes
	local graph_lines = {}
	for _, fk in ipairs(fks) do
		table.insert(graph_lines, string.format("[%s] -- %s --> [%s]", fk.from_table, fk.from_column, fk.to_table))
	end

	-- Write to temporary file
	local f = io.open(M.config.graph_file, "w")
	if f then
		f:write(table.concat(graph_lines, "\n"))
		f:close()
	else
		echoerr("No se pudo escribir el archivo de grafo")
		return
	end

	-- Call easy-graph
	local easy_graph_cmd = string.format(
		"cat %s | graph-easy --boxart > %s",
		vim.fn.shellescape(M.config.graph_file),
		vim.fn.shellescape(M.config.graph_file .. ".output")
	)

	local result = vim.fn.system(easy_graph_cmd)
	if vim.v.shell_error ~= 0 then
		echoerr("Error al generar el grafo. ¿Tienes easy-graph instalado?")
		return
	end

	-- Open the result
	vim.cmd("silent! vsplit | view " .. M.config.graph_file .. ".output")
	vim.cmd("setlocal readonly")
	vim.cmd("setlocal nomodifiable")
end

function M.show_config()
	local config_info = {
		"Configuración actual de SQL Runner:",
		string.format("  Base de datos: %s", M.config.db ~= "" and M.config.db or "(no seleccionada)"),
		string.format("  Usuario: %s", M.config.user),
		string.format("  Archivo temporal: %s", M.config.tmp_file),
		string.format("  Archivo de resultados: %s", M.config.result_file),
		string.format("  Archivo de grafo: %s", M.config.graph_file),
	}

	-- Mostrar en un buffer flotante
	local buf = vim.api.nvim_create_buf(false, true)
	local width = math.floor(vim.o.columns * 0.6)
	local height = #config_info + 2

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		col = math.floor((vim.o.columns - width) / 2),
		row = math.floor((vim.o.lines - height) / 2),
		style = "minimal",
		border = "rounded",
	})

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, config_info)
	vim.api.nvim_buf_set_option(buf, "modifiable", false)
	vim.api.nvim_buf_set_option(buf, "filetype", "markdown")

	-- Mapear q para cerrar la ventana
	vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>q!<CR>", { silent = true })
	vim.api.nvim_buf_set_keymap(buf, "n", "<ESC>", "<cmd>q!<CR>", { silent = true })
end

-- Setup function (modified for ftplugin)
function M.setup()
	-- Only setup for SQL files
	if vim.bo.filetype ~= "sql" then
		return
	end

	-- Create buffer-local commands
	vim.api.nvim_buf_create_user_command(0, "SqlRunSelection", function(opts)
		vim.cmd(string.format("%d,%dwrite! %s", opts.line1, opts.line2, M.config.tmp_file))
		M.execute(M.config.tmp_file)
	end, { range = true, nargs = 0 })

	vim.api.nvim_buf_create_user_command(0, "SqlRunFile", function()
		M.execute(vim.fn.expand("%"))
	end, { nargs = 0 })

	vim.api.nvim_buf_create_user_command(0, "SqlChangeUser", M.change_user, { nargs = 0 })
	vim.api.nvim_buf_create_user_command(0, "SqlChangeDB", M.select_database, { nargs = 0 })
	vim.api.nvim_buf_create_user_command(0, "SqlLogs", M.open_result_file, { nargs = 0 })
	vim.api.nvim_buf_create_user_command(0, "SqlGraph", M.generate_graph, { nargs = 0 })

	-- Buffer-local key mappings
	vim.keymap.set("n", "<leader>sr", "<cmd>SqlRunFile<CR>", { buffer = true })
	vim.keymap.set("v", "<leader>sr", "<cmd>SqlRunSelection<CR>", { buffer = true })
	vim.keymap.set("n", "<leader>sl", "<cmd>SqlLogs<CR>", { buffer = true })
	vim.keymap.set("n", "<leader>sg", "<cmd>SqlGraph<CR>", { buffer = true })

	-- Mostrar config del script
	vim.api.nvim_buf_create_user_command(0, "SqlInfo", M.show_config, { nargs = 0 })
	vim.keymap.set("n", "<leader>si", "<cmd>SqlInfo<CR>", { buffer = true, desc = "Mostrar configuración SQL" })
end

-- Auto-setup when loaded as ftplugin
M.setup()
