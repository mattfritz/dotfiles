require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto'
  },
  sections = {
    lualine_x = {
      { 'diagnostics', sources = {"nvim_lsp"} },
      'encoding',
      'filetype'
    }
  },
  extensions = {
    'fugitive',
    'quickfix',
  }
}
