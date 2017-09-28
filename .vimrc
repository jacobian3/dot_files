
" Put your non-Plugin stuff before this line
"------------------------------------------------------------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Keep Plugin commands between vundle#begin/end.

" color scheme
Bundle 'altercation/vim-colors-solarized'

" utility
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Yggdroot/indentLine' "??? why isn't this working?

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"------------------------------------------------------------------------------

"enable 256 colors in vim, put this your .vimrc before setting the colorscheme
"this also allows compatibility with TMUX; if this isn't present, TMUX will
"invert the colors!!!
set t_Co=256

" ??? check what this does exactly
set nocompatible              " be iMproved, required
filetype off                  " required ???


"" solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized
" second line allows toogle between schemes using F5 key
colorscheme solarized
call togglebg#map ("<F5>") 

" syntax highlighting"
syntax on

" Vim "swap", "backup" and "undo" files put in a fixed directory to keep 
" things more organized.
" the "//" at the end of each directory means that file names will be built
" from the complete path to the file with all path separators substituted to
" percent "%" sign. This will ensure file name uniqueness in the preserve
" directory.
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//


" alternative #1: sets the 80 character limit notifier as vertical bar
"highlight ColorColumn ctermbg=magenta
"call matchadd( 'ColorColumn','\%81v', 100 )

" alternative #2: sets the 80 character limit notifier; everything after 79 is
" is colored!
au BufWinEnter * let w:m2=matchadd ('ErrorMsg','\%>79v.\+', -1)

" set highlight for the cursor's line; you can see your current row easier.
set cursorline

" These setttings are for the creation of surrounds
" 'tpope/vim-surround' is currently handling existing surrounds
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i

" toggles NerdTree
nnoremap <C-k> :NERDTreeToggle<Enter>

" sets the line numbers
set number  

" id file, row, & column locations
set ruler

"PEP8 for python standards
au BufNewFile,BufRead *.py
    \ set tabstop=4 " size of a hard tabstop
    \ set softtabstop=4
    \ set shiftwidth=4 " size of an indent
    \ set textwidth=79
    \ set expandtab "  converts tabs into whitespace
    \ set autoindent
    \ set encoding=utf-8 " EXPERIMENT
    \ set fileformat=utf-8 "unix 

"other web standards
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 "how many coluumns = 1x tab(normal mode)
    \ set softtabstop=2 "how many columns = 1x tab (insert mode)
    \ set shiftwidth=2
    \ set expandtab "  converts tabs into whitespace

" Enable code folding
set foldmethod=indent 
set foldlevel=99

"Enable folding with the spacebar 
nnoremap <space> za

"Remap new leader key: '\' -> ',' 
let mapleader = ","

"easy navigation between splits
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Automatically change the current directory
set autochdir

"Automatically use the mac system clipboard for copy and paste
set clipboard=unnamed " set clipboard=unnamedplus for linux system

"switch between paste and nopaste modes while editing
set pastetoggle=<F3>


"----------------------powerline tweeks----------------------------------------
" ???
"let g:Powerline_symbols = 'fancy' " EXPERIMENT
"set laststatus=2 "ensures that powerline status bar is always displayed
"--------------------------------------------------------------
