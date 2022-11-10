-- Mini starter
local status, starter = pcall(require, "mini.starter")
if not status then
    return
end

-- Mini startup page
starter.setup({
    content_hooks = {
        starter.gen_hook.indexing('all', { 'Builtin actions' }),
        starter.gen_hook.padding(55, 5),
        starter.gen_hook.aligning("left", "top"),
        starter.gen_hook.adding_bullet("   "),
    },
    evaluate_single = true,
    footer = os.date(),
    header = table.concat({
        '                                                     ',
        '                                                     ',
        '                                                     ',
        ' ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ',
        ' ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ',
        ' ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ',
        ' ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ',
        ' ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ',
        ' ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ',
        '                                                     ',
    }, "\n"),
    query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-]],
    items = {
        { action = "tab G", name = "Fugitive", section = "Git" },
        { action = "PackerSync", name = "Update Plugins", section = "Git" },
        starter.sections.recent_files(5, false, false),
    },
})

vim.cmd([[
  augroup MiniStarterJK
    au!
    au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
    au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
  augroup END

    hi MiniStarterItemPrefix guifg=#978fff 
    hi MiniStarterHeader guifg=#359dc2 
    hi MiniStarterSection guifg=#FFFFFF 
    hi MiniStarterItem guifg=#FFCF5C
]])
