command -buffer -range=% RunSqlSel call RunSql("/tmp/sql")
command -buffer RunSqlFile call RunSql("%")

nnoremap <buffer><leader>ri :RunSqlFile<cr>
vnoremap <buffer><leader>ri :RunSqlSel<cr>
