" ----------
" Vim Config
" ----------
"
"
" How this works:
"
" This file is minimal.  Most of the vim settings and initialization is in
" several files in .vim/init.  This makes it easier to find things and to
" merge between branches and repos.
"
" Please do not add configuration to this file, unless it *really* needs to
" come first or last, like Vundle and sourcing the machine-local config.
" Instead, add it to one of the files in .vim/init, or create a new one.

set nocompatible               " be iMproved
filetype off                   " required!

let need_to_install_plugins=0
if empty(system("grep lazy_load ~/.vim/bundle/Vundle.vim/autoload/vundle.vim"))
  echoerr "Vundle plugins are not installed. Please run ~/.vim/bin/install"
else
  set rtp+=~/.vim/bundle/Vundle.vim

  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'

  "
  " Colorschemes
  "
  Plugin 'molokai'
  " Plugin 'altercation/vim-colors-solarized'
  Plugin 'flazz/vim-colorschemes'

  "
  " General Editing
  "
  Plugin 'sjl/gundo.vim'
  Plugin 'godlygeek/tabular'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'easymotion/vim-easymotion'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'editorconfig/editorconfig-vim'

  "
  " Navigation
  "
  Plugin 'scrooloose/nerdtree'
  Plugin 'majutsushi/tagbar'

  "
  " Languages
  "
  Plugin 'plasticboy/vim-markdown'
  Plugin 'fatih/vim-go'
  Plugin 'chrisbra/csv.vim'
  Plugin 'elzr/vim-json'

  "
  " Development Tool Integration
  "
  Plugin 'tpope/vim-fugitive'
  Plugin 'airblade/vim-gitgutter'
"
  " Misc
  "
  Plugin 'tpope/vim-abolish'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'SirVer/ultisnips'
  Plugin 'jiangmiao/auto-pairs'

  " Plugin 'vim-scripts/L9'
  " Plugin 'MarcWeber/vim-addon-mw-utils'
  " Plugin 'SirVer/ultisnips'
  " Plugin 'YankRing.vim'
  " Plugin 'tpope/vim-dispatch'

  call vundle#end()

  filetype plugin indent on

  syntax on

  runtime! init/**.vim

  if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
  endif
endif
