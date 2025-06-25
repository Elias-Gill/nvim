" Log File Syntax Highlighting
if exists("b:current_syntax")
    finish
endif

" 1. Fechas/Horas entre corchetes (formato ISO 8601)
syntax match logDate /\[\d\{4}-\d\{2}-\d\{2}[ T]\d\{2}:\d\{2}:\d\{2}\(\.\d\+\)\?\([+-]\d\{2}:\d\{2}\)\?\]/
syntax match logDate /\[\w\{3} \w\{3} [ \d]\d \d\{2}:\d\{2}:\d\{2} \d\{4}\]/  " Formato alternativo

" 2. Niveles de log (ERROR, WARN, INFO, etc.)
syntax match logError /\c\<\(ERROR\|FAIL\|FAILED\|CRITICAL\|SEVERE\|FATAL\)\>/
syntax match logWarn /\c\<\(WARN\|WARNING\|ALERT\)\>/
syntax match logInfo /\c\<\(INFO\|NOTICE\|STATUS\)\>/
syntax match logDebug /\c\<\(DEBUG\|TRACE\|VERBOSE\)\>/

" 3. Elementos comunes en logs
syntax match logNumber /\<\d\+\>/
syntax match logIP /\<\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}\>/
syntax match logFile /\(\(\/\|\~\)[\/a-zA-Z0-9_.-]\+\)\+/
syntax match logURL /https\?:\/\/[[:alnum:]#?/&=._-]\+/
syntax match logUUID /\<[0-9a-fA-F]\{8}-[0-9a-fA-F]\{4}-[0-9a-fA-F]\{4}-[0-9a-fA-F]\{4}-[0-9a-fA-F]\{12\}\>/

" 4. Mensajes de error especiales
syntax match logStackTrace /^\s*at\s.*/
syntax match logException /\c\<\(Exception\|Error\|Throwable\)\>/

" Asignación de colores
highlight default link logDate Comment
highlight default link logError ErrorMsg
highlight default link logWarn WarningMsg
highlight default link logInfo Identifier
highlight default link logDebug Debug
highlight default link logNumber Number
highlight default link logIP Special
highlight default link logFile Underlined
highlight default link logURL Underlined
highlight default link logUUID Special
highlight default link logStackTrace PreProc
highlight default link logException ErrorMsg

let b:current_syntax = "log"
