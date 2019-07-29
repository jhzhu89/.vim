" vim-go short-cuts
nmap <F8> :TagbarToggle<CR>

augroup go
  autocmd!

  autocmd FileType go set noexpandtab
  autocmd FileType go set nolist

  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
  autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  autocmd FileType go nmap <Leader>dh <Plug>(go-def-split)
  autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)

  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  autocmd FileType go nmap <leader>i :GoImport 
  autocmd FileType go nmap <leader>ia :GoImportAs 
  autocmd FileType go nmap <leader>id :GoDrop 

  autocmd FileType go nmap <leader>r :GoRename<cr>

  autocmd FileType go nmap <leader>rf :GoReferrers<cr>
  autocmd FileType go nmap <leader>ds :GoDescribe<cr>

  autocmd Filetype go nmap <leader>ae <Plug>(go-alternate-edit)
  autocmd Filetype go nmap <leader>as <Plug>(go-alternate-split)
  autocmd Filetype go nmap <leader>av <Plug>(go-alternate-vertical)

  autocmd FileType go nmap <leader>dd :GoDeclsDir<cr>

  autocmd FileType go nmap <leader>cp :GoChannelPeers<cr>

  autocmd FileType go nmap <F9> :GoCoverageToggle -short<cr>

  autocmd FileType go nmap <leader>cr :GoCallers<cr>
  autocmd FileType go nmap <leader>ce :GoCallees<cr>
  autocmd FileType go nmap <leader>cs :GoCallstack<cr>

  autocmd FileType go nmap <leader>at :GoAddTags<cr>
  autocmd FileType go nmap <leader>rt :GoRemoveTags<cr>
augroup END

let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_list_type = "quickfix"
let g:go_code_completion_enabled = 0
" let g:go_def_mode='gopls'

set updatetime=100

" let g:go_autodetect_gopath = 0
