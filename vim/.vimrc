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
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'srcery-colors/srcery-vim'
Plugin 'tomtom/tcomment_vim'

call vundle#end()
filetype plugin indent on

" syntax highlighting
syntax enable
set background=dark
colorscheme srcery

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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
let g:EditorConfig_core_mode = 'external_command'

" delimiter expansion
let delimitMate_expand_cr = 1

" redraw
map ;l :redraw!<CR>

" sudowrite
cnoremap w!! w !sudo tee % >/dev/null

