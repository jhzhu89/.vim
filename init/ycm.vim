let g:ycm_confirm_extra_conf= 0
let g:ycm_server_keep_logfiles = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

augroup cpp
  autocmd!

  autocmd FileType c,cpp set noexpandtab
  autocmd FileType c,cpp set nolist

  autocmd FileType c,cpp setl sw=2 sts=8 ts=8 et

  autocmd FileType c,cpp nmap <leader>jd :YcmCompleter GoToDefinition<CR>
  autocmd FileType c,cpp nmap <leader>jD :YcmCompleter GoToDeclaration<CR>
  autocmd FileType c,cpp nmap <leader>ji :YcmCompleter GoToInclude<CR>
  autocmd FileType c,cpp nmap <leader>gt :YcmCompleter GetType<CR>
  autocmd FileType c,cpp nmap <leader>gp :YcmCompleter GetParent<CR>
  autocmd FileType c,cpp nmap <leader>gd :YcmCompleter GetDoc<CR>
augroup END
