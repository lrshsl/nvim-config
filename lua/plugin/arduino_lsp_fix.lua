local util = require('lspconfig.util')

require('lspconfig').arduino_language_server.setup({
   on_new_config = function(config, root_dir)
      local fqbn = "arduino:avr:uno" -- fallback default

      -- Try to parse sketch.yaml dynamically if it exists
      local sketch_yaml = root_dir .. '/sketch.yaml'
      local file = io.open(sketch_yaml, "r")
      if file then
         for line in file:lines() do
            local match = line:match("^default_fqbn%s*:%s*(.-)%s*$")
            if match then
               fqbn = match:gsub('"', ''):gsub("'", "") -- clean quotes
               break
            end
         end
         file:close()
      end

      -- Inject the discovered FQBN straight into the command arguments
      config.cmd = {
         "arduino-language-server",
         "-cli-config", "/home/lnx/.arduino15/arduino-cli.yaml",
         "-fqbn", fqbn
      }
   end
})
