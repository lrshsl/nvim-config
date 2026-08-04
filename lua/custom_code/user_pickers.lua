-- File picker
function AskUserPickFile(dir, callback)
   local finders = require 'telescope.finders'
   AskUserCallback(
      'Choose a file',
      finders.new_oneshot_job({ 'fd', '--base-directory', dir, '--type', 'f' }, {}),
      callback
   )
end

-- Callback-based version
function AskUserCallback(prompt, source, callback)
   local pickers      = require 'telescope.pickers'
   local conf         = require 'telescope.config'.values
   local actions      = require 'telescope.actions'
   local action_state = require 'telescope.actions.state'
   pickers.new({}, {
      prompt_title = prompt,
      finder = source,
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr, _)
         actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            if selection then callback(selection.value) end
         end)
         return true
      end,
   }):find()
end

-- Coroutine-based version
function AskUser(prompt, source)
   local co = coroutine.running()
   if not co then error('AskUser must be called inside a coroutine') end
   local pickers      = require 'telescope.pickers'
   local conf         = require 'telescope.config'.values
   local actions      = require 'telescope.actions'
   local action_state = require 'telescope.actions.state'

   pickers.new({}, {
      prompt_title = prompt,
      finder = source,
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr, _)
         actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            coroutine.resume(co, selection.value)
         end)
         return true
      end,
   }):find()

   return coroutine.yield()
end
