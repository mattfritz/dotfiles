local home = vim.env.HOME

vim.g.wiki_path = home .. '/wiki'

vim.g.wiki = {
  name = 'KB',
  -- syntax = 'markdown',
  -- ext = '.md',
  path = vim.g.wiki_path,
  path_html = vim.g.wiki_path .. '/public/',
  auto_toc = 1,
  auto_diary_index = 1,
  auto_generate_links = 1,
  auto_tags = 1,
}

vim.g.til_wiki_path = vim.g.wiki_path .. '/til'
vim.g.til_wiki = {
  name = 'TIL',
  -- syntax = 'markdown',
  -- ext = '.md',
  path = vim.g.til_wiki_path,
  path_html = vim.g.til_wiki_path .. '/public',
  auto_tags = 1,
  auto_export = 1,
}

vim.g.local_wiki = {
  name = 'Local Wiki',
  -- syntax = 'markdown',
  -- ext = '.md',
  path = vim.g.wiki_path .. '/local',
}

vim.g.vimwiki_listsyms = '✗○◐●✓'
vim.g.vimwiki_auto_chdir = 1
vim.g.vimwiki_tags_header = 'Wiki tags'
vim.g.vimwiki_auto_header = 1
vim.g.vimwiki_hl_headers = 1
vim.g.vimwiki_conceal_pre = 1
vim.g.vimwiki_hl_cb_checked = 1
vim.g.vimwiki_list = { vim.g.wiki, vim.g.til_wiki, vim.g.local_wiki }

vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_folding = 'expr'
