local pickers = require("telescope.pickers")
local previewers = require("telescope.previewers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local config = require("telescope.config").values

local git_log_previewer = previewers.new_termopen_previewer({
	title = "Log",
	get_command = function(entry)
		return { "git" , "log", "--oneline", entry.value[1] }
	end
})

local git_branch_entry_maker = function(entry)
	return {
		value = entry,
		display = entry[1],
		ordinal = entry[1],
	}
end

local checkout_branch = function(opts)
	opts = opts or {}
	local results = {}

	local remotes = vim.split(vim.fn.system("git remote"), "\n")
	local remote_branches = vim.split(vim.fn.system("git branch -r --format=\"%(refname:short)\""), "\n")
	local local_branches = vim.split(vim.fn.system("git branch --format=\"%(refname:short)\""), "\n")
	local branch_set = {}

	for _, branch in pairs(local_branches) do
		if (branch ~= "") then
			table.insert(results, { branch, nil })
			branch_set[branch] = true
		end
	end

	for _, remote in pairs(remotes) do
		for _, branch in pairs(remote_branches) do
			if ((not branch_set[branch:gsub("^" .. remote .. "/", "")]) and (branch:find("^" .. remote .. "/") == 1)) then
				table.insert(results, { branch, remote })
			end
		end
	end

	pickers.new(opts, {
		prompt_title = "Checkout Branch",
		sorter = config.generic_sorter(opts),
		finder = finders.new_table({ results = results, entry_maker = git_branch_entry_maker }),
		previewer = git_log_previewer,
		attach_mappings = function(prompt_bufnr)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local entry = action_state.get_selected_entry()
				local branch = entry.value[1]
				local remote = entry.value[2]
				if (remote) then
					vim.cmd("G checkout -t " .. branch)
				else
					vim.cmd("G checkout " .. branch)
				end
			end)
			return true
		end,
	}):find()
end

local merge_branch = function(opts)
	opts = opts or {}
	local results = {}

	local remotes = vim.split(vim.fn.system("git remote"), "\n")
	local remote_branches = vim.split(vim.fn.system("git branch -r --format=\"%(refname:short)\""), "\n")
	local local_branches = vim.split(vim.fn.system("git branch --format=\"%(refname:short)\""), "\n")

	for _, branch in pairs(local_branches) do
		if (branch ~= "") then
			table.insert(results, { branch, nil })
		end
	end

	for _, remote in pairs(remotes) do
		for _, branch in pairs(remote_branches) do
			if (branch:find("^" .. remote .. "/") == 1) then
				table.insert(results, { branch, remote })
			end
		end
	end

	pickers.new(opts, {
		prompt_title = "Merge Branch",
		sorter = config.generic_sorter(opts),
		finder = finders.new_table({ results = results, entry_maker = git_branch_entry_maker }),
		previewer = git_log_previewer,
		attach_mappings = function(prompt_bufnr)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local entry = action_state.get_selected_entry()
				local branch = entry.value[1]
				vim.cmd("G merge " .. branch)
			end)
			return true
		end,
	}):find()
end

return {
	checkout_branch = checkout_branch,
	merge_branch = merge_branch,
}
