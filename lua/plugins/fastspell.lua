return {
	"lucaSartore/fastspell.nvim",

	-- Build/install script
	build = function()
		local base_path = vim.fn.stdpath("data") .. "/lazy/fastspell.nvim"
		local cmd = base_path .. "/lua/scripts/install." .. (vim.fn.has("win32") == 1 and "cmd" or "sh")
		vim.fn.system(cmd)
	end,

	config = function()
		local fastspell = require("fastspell")

		-- Setup Fastspell with English dictionary
		fastspell.setup({
			cspell_json_file_path = vim.fn.stdpath("config") .. "/cspell.json"
		})

		-- Ensure we have a minimal cspell.json
		local cspell_path = vim.fn.stdpath("config") .. "/cspell.json"
		if vim.fn.filereadable(cspell_path) == 0 then
			local f = io.open(cspell_path, "w")
			f:write([[{
    "language": "en",
    "words": []
}]])
			f:close()
		end
		vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufEnter", "WinScrolled" }, {
			callback = function(_)
				local first_line = vim.fn.line('w0') - 1
				local last_line = vim.fn.line('w$')
				fastspell.sendSpellCheckRequest(first_line, last_line)
			end,
		})
		vim.api.nvim_set_keymap("n", "<leader>sc", "", {
			noremap = true,
			silent = true,
			desc = "[S]pell [C]heck",
			callback = function()
				local buffer = vim.api.nvim_get_current_buf()
				local first_line = 0
				local last_line = vim.api.nvim_buf_line_count(buffer)
				fastspell.sendSpellCheckRequest(first_line, last_line)
			end,
		})
	end,
}
