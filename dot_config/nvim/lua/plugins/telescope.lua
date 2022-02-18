-- local inspect = require('inspect')
-- print(vim.inspect(require('telescope._extensions')))
local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ['<C-c>'] = actions.close
      }
    }
  },
  -- extensions = {
  --   fzf = {
  --     fuzzy = true,
  --     override_generic_sorter = true,
  --     override_file_sorter = true,
  --     case_mode = 'smart_case'
  --   }
  -- },
  -- pickers = {
  --   find_files = {
  --     theme = 'dropdown'
  --   },
  --   grep_string = {
  --     theme = 'dropdown'
  --   },
  --   live_grep = {
  --     theme = 'dropdown'
  --   }
  -- }
}

require('telescope').load_extension('file_browser')
require('telescope').load_extension('project')
require('telescope').load_extension('fzf')
