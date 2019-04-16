" Keybindings
" -----------

let mapleader = ","
let maplocalleader = ";"

" Gracefully handle holding shift too long after : for common commands
cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev Tabe tabe
cabbrev Tabc tabc

"set pastetoggle keybinding
set pastetoggle=<F2>

" Make Y consistent with D and C
map Y           y$

" Search
nmap <leader>s  :%s/
vmap <leader>s  :s/

" Split screen
map <leader>v   :vsp<CR>

" Move between screens
" map <leader>w   ^Ww
" map <leader>=   ^W=
" map <leader>j   ^Wj
" map <leader>k   ^Wk
nmap <C-j>      <C-w>j
nmap <C-k>      <C-w>k
nmap <C-h>      <C-w>h
nmap <C-l>      <C-w>l

" Close current window
nmap <leader>q   :q<CR>
nmap <leader>w   :w<CR>
nmap <leader>qq  :q!<CR>
nmap <leader>wq  :wq<CR>

" Open .vimrc file in new tab. Think Command + , [Preferences...] but with Shift.
map <D-<>       :tabedit ~/.vimrc<CR>

" Reload .vimrc
map <leader>rv  :source ~/.vimrc<CR>

" Undo/redo - Doesn't MacVim already have this?
map <D-z>       :earlier 1<CR>
map <D-Z>       :later 1<CR>

" Auto-indent whole file
nmap <leader>=  gg=G``
map <silent> <F7> gg=G`` :delmarks z<CR>:echo "Reformatted."<CR>

" Jump to a new line in insert mode
imap <D-CR>     <Esc>o

" Fast scrolling
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>

" File tree browser
map \           :NERDTreeToggle<CR>

" File tree browser showing current file - pipe (shift-backslash)
map \|          :NERDTreeFind<CR>

" Previous/next quickfix file listings (e.g. search results)
map <M-D-Down>  :cn<CR>
map <M-D-Up>    :cp<CR>

" Open and close the quickfix window
map <leader>qo  :copen<CR>
map <leader>qc  :cclose<CR>

" Previous/next buffers
map <M-D-Left>  :bp<CR>
map <M-D-Right> :bn<CR>

"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

" map <leader>rt :!~/.vim/bin/update_ctags 2>/dev/null &<CR>

" Comment/uncomment lines
" map <leader>/   <plug>NERDCommenterToggle
" map <D-/>       <plug>NERDCommenterToggle
" imap <D-/>      <Esc><plug>NERDCommenterToggle i

" In command-line mode, <C-A> should go to the front of the line, as in bash.
cmap <C-A> <C-B>

" Copy current file path to system pasteboard
map <silent> <D-C> :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>
map <leader>C :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>

" Disable middle mouse button, F1
map <MiddleMouse>   <Nop>
imap <MiddleMouse>  <Nop>
map <F1>            <Nop>
imap <F1>           <Nop>

" Easy access to the shell
map <Leader><Leader> :!

" Recalculate diff when it gets messed up.
nmap du :diffupdate<CR>

" Gundo.vim
map <leader>u :GundoToggle<CR>

" Write all
map <silent> <F19>WriteAll :silent! wall<CR>

" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>""

" YankRing show registers
" :nnoremap <silent> <F6> :YRShow<CR>

" {{{
" ctrlp
  " <leader>f is the default trigger (set in init/ctrlp.vim)
  nnoremap <silent> <leader>F :CtrlPClearAllCaches<CR>:CtrlPCurWD<CR>

  " Additional mapping for buffer search
  nnoremap <silent> <leader>bb :CtrlPBuffer<cr>
  map <D-e> :CtrlPBuffer<CR>

  " Map most recently used
  nnoremap <silent> <C-p> :CtrlPMRU<cr>

  " Cmd-Shift-P to clear the cache
  nnoremap <silent> <D-P> :ClearCtrlPCache<cr>

  "Cmd-Shift-(M)ethod - jump to a method (tag in current file)
  "Ctrl-m is not good - it overrides behavior of Enter
  nnoremap <silent> <D-M> :CtrlPBufTag<CR>

  " Mappings inherited from FuzzyFinder
  map <leader><C-N> :CtrlPCurWD<CR>
  map <leader>n :CtrlPCurWD<CR>
  map <D-N> :CtrlPCurWD<CR>
" }}}


" {{{
  " fzf keybindings
  " -----------
  nnoremap <silent> <leader><space> :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>A :Windows<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>o :BTags<CR>
  nnoremap <silent> <leader>O :Tags<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>

  nnoremap <silent> KK :call SearchWordWithAg()<CR>
  vnoremap <silent> KK :call SearchVisualSelectionWithAg()<CR>
  nnoremap <silent> <leader>gf :GFiles<CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>
  nnoremap <silent> <leader>ft :Filetypes<CR>

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)

  function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction
" }}}

" {{{
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>ge :Gedit<CR>
  nnoremap <silent> <leader>gE :Gedit<space>
  nnoremap <silent> <leader>gr :Gread<CR>
  nnoremap <silent> <leader>gR :Gread<space>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>gW :Gwrite!<CR>
  nnoremap <silent> <leader>gq :Gwq<CR>
  nnoremap <silent> <leader>gQ :Gwq!<CR>

  function! ReviewLastCommit()
    if exists('b:git_dir')
      Gtabedit HEAD^{}
      nnoremap <buffer> <silent> q :<C-U>bdelete<CR>
    else
      echo 'No git a git repository:' expand('%:p')
    endif
  endfunction
  nnoremap <silent> <leader>g` :call ReviewLastCommit()<CR>
" }}}

" {{{
  nmap <silent> ]h :GitGutterNextHunk<CR>
  nmap <silent> [h :GitGutterPrevHunk<CR>
  nnoremap <silent> <Leader>gu :GitGutterRevertHunk<CR>
  nnoremap <silent> <Leader>gp :GitGutterPreviewHunk<CR><c-w>j
  nnoremap cog :GitGutterToggle<CR>
  nnoremap <Leader>gt :GitGutterAll<CR>
" }}}
