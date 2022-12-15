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
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'flazz/vim-colorschemes'

  "
  " General Editing
  "
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-surround'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'godlygeek/tabular'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'camelcasemotion'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'YankRing.vim'

  "
  " Searching
  "
  Plugin 'tpope/vim-abolish'
  Plugin 'yggdroot/leaderf'
  Plugin 'burntsushi/ripgrep'

  "
  " Navigation
  "
  Plugin 'scrooloose/nerdtree'
  Plugin 'majutsushi/tagbar'

  Plugin 'christoomey/vim-tmux-navigator'

  "
  " Languages
  "
  Plugin 'plasticboy/vim-markdown'
  Plugin 'tpope/vim-haml'
  Plugin 'fatih/vim-go'
  Plugin 'chrisbra/csv.vim'
  Plugin 'elzr/vim-json'

  "
  " Development Tool Integration
  "
  Plugin 'tpope/vim-fugitive'
  Plugin 'airblade/vim-gitgutter'

  "
  " Rust
  "
  Plugin 'rust-lang/rust.vim'
  Plugin 'racer-rust/vim-racer'

  Plugin 'Valloric/YouCompleteMe'
  Plugin 'rdnetto/YCM-Generator'

  "
  " TOML
  "
  Plugin 'cespare/vim-toml'

  Plugin 'ryanoasis/vim-devicons'

  Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
  Plugin 'junegunn/fzf.vim'

  call vundle#end()

  filetype plugin indent on

  syntax on

  runtime! init/**.vim

  if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
  endif
endif
