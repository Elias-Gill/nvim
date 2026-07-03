return {
    "junegunn/gv.vim",
    lazy = true,
    cmd = { "GV" },
    dependencies = {
        {
            "tpope/vim-fugitive",
            cmd = { "G", "Gdiffsplit" },
            keys = {
                {
                    "<leader>G",
                    "<cmd>G<cr>",
                    mode = { "n" },
                    desc = "Open git fugitive",
                },
            },
        },
    },
}
