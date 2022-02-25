vim.api.nvim_exec([[
  let s:docker_prefix = 'docker-compose run --rm -T -l traefik.enable=false -e RAILS_ENV=test app'

  function! DockerTransform(cmd) abort
    " TODO: check for homebot repo (by path, git remote, specific app names, etc.)
    if a:cmd =~ 'rspec' && filereadable(expand('./docker-compose.yml'))
      return s:docker_prefix.' '.a:cmd
    else
      return cmd
    endif
  endfunction

  " Use dispatch compilers to ensure correct formatting
  " Clobber `bundle exec` in order to apply formatting
  if !exists('g:dispatch_compilers')
    let g:dispatch_compilers = {}
  endif

  let g:dispatch_compilers[s:docker_prefix] = ''
  let g:dispatch_compilers['bundle exec'] = ''

  " Register transformation function
  let g:test#custom_transformations = {'docker': function('DockerTransform')}
  let g:test#transformation = 'docker'

  " Use dispatch.vim for rendering results
  let g:test#strategy = 'dispatch'
]], {})
