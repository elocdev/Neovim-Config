local status_ok, ts = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

ts.setup({
	ensure_installed = {
		"c",
		"lua",
		"python",
		"json",
		"vim",
		"javascript",
		"typescript",
		"css",
		"yaml",
		"tsx",
		"html",
	},

	sync_install = false,
	auto_install = true,
	highlight = {
		enabled = true,
		additional_vim_regex_highlight = false,
	},
	autopairs = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})
