set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

"---------------------------core plugins--------------------------
Plugin 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/indentLine'

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
"-------------------------------------------------------------------------------
"" solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized
" second line allows toogle between schemes using F5 key
colorscheme solarized
call togglebg#map ("<F5>") 

" syntax highlighting"
syntax on


"-------------Core Setup-------------------------------------------
" alternative #1: sets the 80 character limit notifier as vertical bar
"highlight ColorColumn ctermbg=magenta
"call matchadd( 'ColorColumn','\%81v', 100 )

" alternative #2: sets the 80 character limit notifier; everything after 80 is
" is colored!
au BufWinEnter * let w:m2=matchadd ('ErrorMsg','\%>79v.\+', -1)

" set highlight for the cursor's line; you can see your place easier.
set cursorline

" These were original setttings for the handling of surrounds
" 'tpope/vim-surround' is currently handling the surrounds
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i


"-------------myKeyMapSettings------------------------------------------
" toggles NerdTree
nnoremap <C-k> :NERDTreeToggle<Enter>

"-------------inentline EXPERIMENT------------------------------------------
let g:indentLine_char = '|' " for indentline plugin EXPERIMENT
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
"----------------------powerline tweeks----------------------------------------
let g:Powerline_symbols = 'fancy' " EXPERIMENT
set laststatus=2 "ensures that powerline status bar is always displayed
"--------------------------------------------------------------

"PEP8 for python standards
" sets the line numbers
set number  
" id file, row, & column locations
set ruler
au BufNewFile,BufRead *.py
    \ set tabstop=4 " size of a hard tabstop
    \ set softtabstop=4
    \ set shiftwidth=4 " size of an indent
    \ set textwidth=79
    \ set expandtab "  converts tabs into whitespace
    \ set autoindent
	\ set encoding=utf-8 " EXPERIMENT
"    \ set fileformat=utf-8 "unix 

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
