require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'neon'
  },
  sections = {
    lualine_x = {
      { 'diagnostics', sources = {"nvim_lsp"} },
      'encoding',
      'filetype'
    }
  }
}
