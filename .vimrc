" Enable filetype detection
filetype plugin on
filetype plugin indent on
syntax enable
		    
" General settings
set nocompatible  
set ruler
set number
set softtabstop=4
set shiftwidth=4
set noexpandtab
set showcmd
set incsearch
set hlsearch
set backspace=2 " Make backspace work like most other app
set colorcolumn=80
set splitbelow
set splitright
highlight ColorColumn ctermbg=darkgray

" Window Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Line break
nnoremap <CR> i<CR><ESC>

" Allow usage of mouse in iTerm
set mouse=a

" Fast terminal connection
set ttyfast

" Copy paste to/from clipboard
map <silent><leader>p :set paste<CR>"*]p:set nopaste<CR>"
set clipboard=unnamed

" Automatically reload .vimrc when saved 
au BufWritePost .vimrc so ~/.vimrc

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
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim' " Run shell commands in the background
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

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

