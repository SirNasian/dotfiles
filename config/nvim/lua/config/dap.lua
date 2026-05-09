local dap = require("dap")

vim.keymap.set("n", "<F9>",  dap.continue,          { desc = "Debug: continue" })
vim.keymap.set("n", "<F21>", dap.terminate,         { desc = "Debug: terminate" })
vim.keymap.set("n", "<F8>",  dap.step_over,         { desc = "Debug: step over" })
vim.keymap.set("n", "<F7>",  dap.step_into,         { desc = "Debug: step into" })
vim.keymap.set("n", "<F20>", dap.step_out,          { desc = "Debug: step out" }) -- Shift+F8
vim.keymap.set("n", "<F4>",  dap.run_to_cursor,     { desc = "Debug: run to cursor" })
vim.keymap.set("n", "<F5>",  dap.toggle_breakpoint, { desc = "Debug: toggle breakpoint" })

dap.adapters.netcoredbg = {
	type = "executable",
	command = "netcoredbg",
	args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
	{
		type = "netcoredbg",
		name = "netcoredbg",
		request = "launch",
		console = "internalConsole",
		program = function()
			local items = {}
			local csproj = vim.fn.glob("**/*.csproj")
			for x in csproj:gmatch("[^\n]+") do items[#items + 1] = x end
			vim.ui.select(items, {}, function(x) csproj = x end)

			-- TODO: consider AssemblyName in csproj (if set)
			local base = vim.fn.fnamemodify(csproj, ":h")
			local name = vim.fn.fnamemodify(csproj, ":t:r")
			return vim.fn.glob(vim.fs.joinpath(base, "bin", "Debug", "*", name .. ".dll"))
		end,
	},
}
