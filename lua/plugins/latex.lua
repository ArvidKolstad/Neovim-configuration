return {
	"lervag/vimtex",
	lazy = false, -- VimTeX handles its own loading based on file type
	init = function()
		-- 1. PDF Viewer Setup (Zathura is an excellent choice on Linux)
		vim.g.vimtex_view_method = "zathura"

		-- 2. Force Latexmk to run the full bibliography pass every time
		vim.g.vimtex_compiler_latexmk = {
			options = {
				"-pdf",
				"-shell-escape", -- Helpful if you use packages like minted/pygments
				"-verbose",
				"-bibtex", -- CRITICAL: Forces latexmk to run bibtex on every save
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
			},
		}

		-- 3. Automatically clean up junk files (.aux, .log, .bbl) on exit
		vim.g.vimtex_compiler_clean_on_nocache = 1

		-- 4. Set maplocalleader to space or a comma if you haven't already
		-- This makes your shortcuts look like <Space>ll instead of \ll
		if not vim.g.maplocalleader then
			vim.g.maplocalleader = " " -- You can change this to "," if preferred
		end
	end,
}
