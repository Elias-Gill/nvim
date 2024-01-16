return {
    "jackMort/ChatGPT.nvim",
    cmd = "ChatGPT",
    config = function()
        require("chatgpt").setup()
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    }
}
