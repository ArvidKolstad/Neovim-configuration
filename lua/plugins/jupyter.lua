return { {
	"GCBallesteros/jupytext.nvim",
	config = function()
		require("jupytext").setup({
			style = "markdown",
			output_extension = "md", -- Tvinga till .md istället för .py
			force_ft = "markdown",
		})
	end
},
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("quarto").setup({
				lspFeatures = {
					languages = { "python" },
					chunks = "all",
				},
			})
		end,
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
		opts = {
			file_types = { "markdown", "quarto", "ipynb" }, -- Lägg till ipynb här
			code = {
				sign = false,
				width = "full",
				left_pad = 4,
				right_pad = 4,
			},
		},
	}
}
