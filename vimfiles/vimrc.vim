set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

syn on 
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

let g:netrw_cygwin= 0

filetype plugin indent on

set modelines=0

set linespace=0
" colorscheme slate
set background=dark
colorscheme solarized
set guifont=Monaco:h9
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set history=1000

au BufNewFile,BufRead *.tt set syntax=html
if has("autocmd")
  " *.tt & *.conf files
  augroup module

    autocmd BufRead,BufNewFile *.tt set filetype=html
    autocmd BufRead,BufNewFile *.tt set syntax=html

    autocmd BufRead,BufNewFile *.ftl set filetype=ftl
    autocmd BufRead,BufNewFile *.ftl set syntax=ftl

    autocmd BufRead,BufNewFile *.conf set expandtab
    autocmd BufRead,BufNewFile *.conf set tabstop=2
    autocmd BufRead,BufNewFile *.conf set softtabstop=2
    autocmd BufRead,BufNewFile *.conf set shiftwidth=2
    autocmd BufRead,BufNewFile *.conf set autoindent
    autocmd BufRead,BufNewFile *.conf set smartindent
    autocmd BufRead,BufNewFile *.conf set syntax=clojure

  augroup END
endif

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jj <ESC>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

set guifont=Menlo\ Regular:h12 

" F Keys Mapping
nnoremap <silent> <leader>e  :NERDTreeToggle<CR>

if version >= 703
    set relativenumber
    set undofile
    set undodir=~/.vim/tmp/undo//
endif

set ofu=syntaxcomplete#Complete

" Settings for VimClojure
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1

" Disable Cursor Blinking
set guicursor+=a:blinkon0

let g:SuperTabDefaultCompletionType = "context"
