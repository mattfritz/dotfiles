require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- TODO: enable this again after indentation bugs are fixed
  -- indent = {
  --   enable = true
  -- }
}
