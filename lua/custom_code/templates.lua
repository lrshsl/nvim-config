require 'custom_code.user_pickers'

local nvim_base_path = os.getenv('HOME') .. '/.config/nvim'

local function strip_prefix(path, prefix)
	-- Ensure prefix ends with "/"
	if not prefix:match("/$") then
		prefix = prefix .. "/"
	end
	-- Remove the prefix
	if path:sub(1, #prefix) == prefix then
		return path:sub(#prefix + 1)
	else
		return path
	end
end

function SearchTemplate()
	local template_path = nvim_base_path .. "/vim_templates/"

	local substitutions = {
		['c/makefile'] = 'Project Name',
		['c/doxyfile'] = 'Project Name',
		['c/h'] = 'filename',
		['c/c'] = 'filename',
	}

	AskUserPickFile(template_path, function(path)
		local name = strip_prefix(path, template_path)
		name = name:sub(0, -(".template"):len() - 1) -- strip suffix
		LoadTemplate(name)

		local sub = substitutions[name]
		if sub ~= nil then
			InsertSubstitution(sub)
		end
	end)
end

function LoadTemplate(name)
	local template_path = nvim_base_path .. "/vim_templates/"
	vim.cmd("0r " .. template_path .. name .. ".template")
end

function InsertSubstitution(pattern)
	local go_left = vim.api.nvim_replace_termcodes('<left><left>', true, true, true)
	vim.api.nvim_feedkeys(':%s/<<\\[' .. pattern .. '\\]>>//g' .. go_left, 'n', false)
end

function Subtitude(pattern, value, flags)
	vim.cmd(':%s/<<\\[' .. pattern .. '\\]>>/' .. value .. '/' .. flags)
end
