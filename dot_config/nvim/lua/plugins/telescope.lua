local telescope = require('telescope')
local previewers = require('telescope.previewers')
local Job = require('plenary.job')

local exclude_binary_preview_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = 'file',
    args = { '--mime-type', '-b', filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], '/')[1]
      if mime_type == 'text' then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
        end)
      end
    end
  }):sync()
end

telescope.setup({
  defaults = require('telescope.themes').get_ivy({
    buffer_previewer_maker = exclude_binary_preview_maker,
    mappings = {
      i = {
        -- ['<C-h>'] = 'which_key'
      }
    }
  }),
  pickers = {
    live_grep = {
      mappings = {
        i = { ["<c-f>"] = require('telescope.actions').to_fuzzy_refine },
      }
    }
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  }
})

local extensions = {
  'fzf',
  'file_browser',
  'repo',
}

for _, extension in pairs(extensions) do
  telescope.load_extension(extension)
end
