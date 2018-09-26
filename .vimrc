" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'matze/vim-move'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'edkolev/tmuxline.vim'
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
set showmode
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

" tmux statusbar
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
    \ 'a': '#S',
    \ 'b': ['#(whoami)', '#(uptime | cut -d " " -f 3,4,5,6,7 | sed "s/,$//")'],
    \ 'c': '#W',
    \ 'win': ['#I', '#W'],
    \ 'cwin': ['#I', '#W'],
    \ 'x': '%a',
    \ 'y': ['%b %d', '%R'],
    \ 'z': '#H'}

let g:tmuxline_theme = {
    \   'a'    : [ 236, 103 ],
    \   'b'    : [ 253, 239 ],
    \   'c'    : [ 244, 236 ],
    \   'x'    : [ 244, 236 ],
    \   'y'    : [ 253, 239 ],
    \   'z'    : [ 236, 103 ],
    \   'win'  : [ 103, 236 ],
    \   'cwin' : [ 236, 103 ],
    \   'bg'   : [ 244, 236 ],
\ }

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[5 q"
endif
