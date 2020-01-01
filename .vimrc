"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""		  
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype plugins
filetype plugin on
filetype indent on
syntax enable

" Disable strange Vi defaults
set nocompatible  

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
set lazyredraw      " Lazy redraw
set encoding=UTF-8  " Set encoding

" Make backspace work like most other app
set backspace=2
set splitbelow
set splitright
set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey

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

" Additional Key-mapping
map ,b :w<cr>:!clear && bash %<cr>
map ,p :w<cr>:!clear && python3 %<cr>

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
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'skywind3000/asyncrun.vim' " Run shell commands in the background
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot' " Use vim-polyglot instead of individual syntax hl
Plug 'alpertuna/vim-header'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons' " Probably need to install the fonts
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-eunuch'

call plug#end()

" Vim-airline
let g:airline_powerline_fonts = 1

" Ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_completion_enabled = 0

" Allow jsx syntax highlighting for .js files
let g:jsx_ext_required = 0

" NerdTree
noremap <silent><leader>t :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

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

" vim-header
let g:header_auto_add_header = 0
let g:header_field_author = 'Derrick Park'
let g:header_field_author_email = 'park@wincbay.com'
let g:header_field_timestamp_format = '%c'

" vim-tagbar
nmap <silent><leader>T :TagbarToggle<CR>

" Color scheme
colorscheme gruvbox

""""""""""""""""""""""""
" vim-coc intellisense "
""""""""""""""""""""""""
set hidden
set nobackup
set nowritebackup
set updatetime=300
set cmdheight=2
" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for completion with chars ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Language Specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Rust
let g:rustfmt_autosave = 1

