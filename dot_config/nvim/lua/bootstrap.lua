local dir = string.format('%s/site/pack/packer/opt/', vim.fn.stdpath 'data')
local clone_dir = dir .. 'packer.nvim'

local download_packer = function()
  if vim.fn.input 'Download Packer? (y for yes)' ~= 'y' then
    print('Skipping install...')
    return false
  end

  vim.fn.mkdir(dir, 'p')

  local out = vim.fn.system(
    string.format('git clone %s %s', 'https://github.com/wbthomason/packer.nvim', clone_dir)
  )

  print('')
  print(out)
  print 'Downloading packer.nvim...'
  print '( You\'ll need to restart now )'

  return false
end

return function()
  local cloned = vim.fn.empty(vim.fn.glob(clone_dir)) == 0

  if not cloned then
    return download_packer()
  end

  return true
end
