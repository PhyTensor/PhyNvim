local port = 6005 -- os.getenv("GDScript_Port") or "6005"
-- local connect = vim.lsp.rpc.connect("127.0.0.1", port)
-- local pipe = "/tmp/godot.pipe" -- I use /tmp/godot.pipe

return {
	name = "godot",
	-- Connect directly to the RPC server (Godot's built-in LSP)
	cmd = { "netcat", "127.0.0.1", port },
	filetypes = { "gdscript", "gdshader" },
	root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".godot", ".git" }, { upward = true })[1]),
	root_markers = { "project.godot", ".godot", ".git" },
	-- on_attach = function(client, bufnr)
	-- vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
	-- end,
}
