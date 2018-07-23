"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""		  
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype plugins
filetype plugin on
filetype plugin indent on
syntax enable

" Disable strange Vi defaults
set nocompatible  

" Set ruler & line number
set ruler
set number

" Keep the default tab stop size of 2
set tabstop=2

" Auto-Indentation >> << ==
set shiftwidth=2 

" Use spaces instead of tabs 
set expandtab 

" Show commands
set showcmd

" Ignore case when searching
set ignorecase 

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch

" Highlight search results
set hlsearch

" Make backspace work like most other app
set backspace=2
set splitbelow
set splitright
set colorcolumn=80
highlight ColorColumn ctermbg=red

" Allow usage of mouse in iTerm
set mouse=a

" Fast terminal connection
set ttyfast

" Disable any annoying beeps on errors
set noerrorbells
set visualbell


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings, etc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Window Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Line break
nnoremap <CR> i<CR><ESC>

" Y yanks from the cursor to the end of line.
nnoremap Y y$

" Copy paste to/from clipboard
map <silent><leader>p :set paste<CR>"*]p:set nopaste<CR>"
set clipboard=unnamed

" Return to last edit position when opening files
autocmd BufReadPost *
	    \ if line ("'\"") > 0 && line("'\"") <= line("$") |
	    \   exe "normal! g`\"" | 
	    \ endif

" Remember info about open buffers on close
set viminfo^=%

" Automatically reload .vimrc when saved 
au BufWritePost .vimrc so ~/.vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatic vim-plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'raimondi/delimitmate'
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim' " Run shell commands in the background
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot' " Use vim-polyglot instead of individual syntax hl
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

call plug#end()

" Ale
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

" Allow jsx syntax highlighting for .js files
let g:jsx_ext_required = 0

" NerdTree
noremap <silent><leader>t :NERDTreeToggle<CR>

" Nerdcommenter
let g:NERDSpaceDelims = 1

" Ctrl-P
let g:ctrlp_map = '<c-p>'
nnoremap <leader>l :CtrlPLine<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" Change cursor shape in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Autocommand for format on save
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" Powerline
set rtp+=/usr/local/lib/python3.7/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256

