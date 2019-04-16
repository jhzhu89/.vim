" Automatically delete Fugitive buffers that are no longer being used.
" Otherwise, they tend to fill up the buffer list.
"
" Credit to Drew Neil of Vimcasts:
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/

augroup fugitiveSettings
  autocmd!
  autocmd FileType gitcommit setlocal nolist
  autocmd BufReadPost fugitive://* setlocal bufhidden=delete
  " Unset 'list' in :Gstatus window (which usually contains tab characters).
  autocmd BufReadPost .git/index set nolist
augroup END

" Fix broken syntax highlight in gitcommit files
" (https://github.com/tpope/vim-git/issues/12)
let g:fugitive_git_executable = 'LANG=en_US.UTF-8 git'
