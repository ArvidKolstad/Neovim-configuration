return {
	"jpalardy/vim-slime",
	config = function()
		vim.g.slime_target = "tmux"
		vim.g.slime_default_config = {
			socket_name = "default",
			target_pane = "work.0"
		}
		vim.g.slime_dont_ask_default = 1
	end
}
