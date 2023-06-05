local actions = require('fzf-lua.actions')

require('fzf-lua').setup({
  actions = {
    buffers = {
      ['default'] = actions.file_edit_or_qf,
      ['alt-q']   = actions.file_sel_to_qf,
    }
  }
})
