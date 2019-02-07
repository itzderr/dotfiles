"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""		  
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype plugins
filetype plugin on
filetype indent on
syntax enable

" Disable strange Vi defaults
set nocompatible  

" Color scheme
colorscheme desert

" Set ruler & line number
set ruler
set number

set tabstop=2       " Keep the default tab stop size of 2 
set shiftwidth=2    " Auto-Indentation >> << == 
set expandtab       " Use spaces instead of tabs 
set smarttab        " Be smart when using tabs
set autoindent      " Auto indent
set smartindent     " Smart indent
set wrap            " Wrap lines
set showcmd         " Show commands
set ignorecase      " Ignore case when searching
set smartcase       " When searching try to be smart about cases
set incsearch       " Makes search act like search in modern browsers
set hlsearch        " Highlight search results

" Make backspace work like most other app
set backspace=2
set splitbelow
set splitright
set colorcolumn=80
highlight ColorColumn ctermbg=red

set mouse=a         " Allow usage of mouse in iTerm
set ttyfast         " Fast terminal connection

" Disable any annoying beeps on errors
set noerrorbells visualbell t_vb=
if has('autocmd')
	autocmd GUIEnter * set visualbell t_vb=
endif

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

" d<space> delete or change until the space
nnoremap d<space> dt<space>
nnoremap c<space> ct<space>

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
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'raimondi/delimitmate'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim' " Run shell commands in the background
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot' " Use vim-polyglot instead of individual syntax hl
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --js-completer' }
Plug 'alpertuna/vim-header'
Plug 'vim-airline/vim-airline'

call plug#end()

" Vim-airline
let g:airline_powerline_fonts = 1

" Ale
let g:ale_lint_on_text_changed = 'never'
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

" YouCompleteMe C-lang
let g:ycm_global_ycm_extra_conf = '/Users/park/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
highlight Pmenu ctermfg=10 ctermbg=0 guifg=#ffffff guibg=#000000
let g:ycm_rust_src_path = '/Users/park/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'
nnoremap <Leader>] :YcmCompleter GoTo<CR>

" vim-header
let g:header_auto_add_header = 0
let g:header_field_author = 'Derrick Park'
let g:header_field_author_email = 'park@wincbay.com'
let g:header_field_timestamp_format = '%c'
