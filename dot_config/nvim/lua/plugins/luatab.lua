vim.cmd([[au ColorScheme * hi TabLine gui=none guibg='#282C34' guifg='#5C6370']])
vim.cmd([[au ColorScheme * hi TabLineSel guibg='#B5BBC7' guifg='#282C34']])
vim.cmd([[au ColorScheme * hi TabLineFill guibg='#282C34' ]])

require('luatab').setup({})
