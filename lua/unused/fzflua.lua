return {
	"elias-gill/fzf-lua",
	cmd = "FzfLua",
	config = function()
		require("fzf-lua").setup({
			"fzf-native",
			fzf_opts = { ["--algo"] = "v1" },
			-- provider setup
			files = {
				rg_opts = "--color=never --files --follow -g '!.git' -g '!go/' -g '!*.class' -g '!Escritorio*' -g '!facultad' -g '!VirtualBox*' -g '!node_modules*'",
				fd_opts = "--color=never --type f --follow --exclude .git --exclude *.class --exclude facultad/ --exclude node_modules/ --exclude go/ --exclude Escritorio",
			},
			-- config de grep
			grep = {
				rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512 -g '!.git' -g '!go/' -g '!*.class' -g '!facultad' -g '!VirtualBox*' -g '!node_modules*'",
			},
			-- config de live_grep
			live_grep = {
				rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512 -g '!.git' -g '!go/' -g '!*.class' -g '!facultad' -g '!VirtualBox*' -g '!node_modules*'",
			},
		})

		-- require "fzf-lua".register_ui_select()
	end,
}
