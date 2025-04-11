return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		input = { enabled = true },
		picker = { 
            enabled = true,
            icons = { files = {enabled = false} },
            exclude = { "go/", "*.class", "VirtualBox/", "node_modules/" },
        },
        quickfile = { enabled = true },
	},

    keys = {
        { "<C-p>", function() Snacks.picker.files() end, desc = "Find files" },
        { "<leader>fr", function() Snacks.picker.resume() end, desc = "Resume last search" },
        { "<leader>ff", function() Snacks.picker.grep() end, desc = "Fuzzy grep" },
        { "<leader>fo", function() Snacks.picker.recent() end, desc = "Find History" },
        { "<leader>fm", function() Snacks.picker.pick() end, desc = "Picker menu" }, --
    }
}
