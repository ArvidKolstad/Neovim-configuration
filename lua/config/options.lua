vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.clipboard:append("unnamedplus")

vim.opt.mouse = ""

--venvfinder
local function find_venv()
	local cwd = vim.fn.getcwd()
	-- Look for .venv in current dir or up to 4 levels up
	local venv = vim.fn.finddir(".venv", cwd .. ";")
	if venv ~= "" then
		return vim.fn.fnamemodify(venv, ":p")
	end
	return nil
end

local venv_path = find_venv()

if venv_path then
	-- Set the environment variables globally for Neovim
	vim.env.VIRTUAL_ENV = venv_path
	if vim.fn.has("win32") == 1 then
		vim.env.PATH = venv_path .. "Scripts;" .. vim.env.PATH
	else
		vim.env.PATH = venv_path .. "bin:" .. vim.env.PATH
	end
end
-- use the correct clipboard tool
vim.g.clipboard = {
	name = 'wayland',
	copy = {
		['+'] = 'wl-copy',
		['*'] = 'wl-copy',
	},
	paste = {
		['+'] = 'wl-paste',
		['*'] = 'wl-paste',
	},
	cache_enabled = 0,
}
