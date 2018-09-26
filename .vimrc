" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'matze/vim-move'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()
filetype plugin indent on

" syntax highlighting
syntax enable

" backspace
set backspace=indent,eol,start

" UI
set ttyfast
set mouse=a
set number
set noshowmode
set showcmd
set cursorline
set wildmenu
set wildmode=list:full
set wildignore=*.swp,*.bak,*.pyc,*.class,~*
set lazyredraw
set showmatch
set ruler
set wrap
set guicursor+=a:blinkon0
set laststatus=2

" auto
set autoread
set autowrite
set autowriteall
set autochdir

" search
set incsearch
set hlsearch
set ignorecase
set smartcase

" vim-move
let g:move_key_modifier = 'C'

" nerdTREE
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyo$', '\.pyc$', '\.svn[\//]$', '\.swp$']
map <C-o> :NERDTreeToggle<CR>
" end if nerdtree is only remaining buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" editorconfig
" let g:EditorConfig_core_mode = 'python_external'

" redraw
map ;l :redraw!<CR>

" sudowrite
cnoremap w!! w !sudo tee % >/dev/null

