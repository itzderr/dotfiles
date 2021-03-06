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
set noshowmode      " Remove default mode indicator
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
set backspace=2     " Make backspace work like most other app
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

" Change cursor shape in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Default file type for .m and .mm
let filetype_m='objc'
let filetype_mm='objcpp'


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
nnoremap ya :%y+<CR>

" d<space> delete or change until the space
nnoremap d<space> dt<space>
nnoremap c<space> ct<space>

" Replace shortcut
nnoremap <leader>r *:%s//

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
map ,j :w<cr>:!clear && node %<cr>
map ,c :w<cr>:!clear && gcc -O -Wall -W -pedantic -std=c99 % -o run && ./run<cr>
" map ,c :w<cr>:!gcc -O -Wall -W -pedantic -std=c99 % -o run && ./run<cr>
" map ,c :w<cr>:!clear && g++ % -o run && ./run<cr>
" map ,c :w<cr>:!clear && sh compile-objc.sh && ./main<cr>


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
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'sheerun/vim-polyglot' " Use vim-polyglot instead of individual syntax hl
Plug 'alpertuna/vim-header'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons' " Probably need to install the fonts
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-eunuch'  " Unix commands in vim
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }

call plug#end()

" Vim-fugitive
command -nargs=* Glg Git! lg

" Vim-lightline
set laststatus=2
let g:lightline = {
  \   'colorscheme': 'seoul256',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }

" Allow jsx syntax highlighting for .js files
let g:jsx_ext_required = 0

" Fzf
nnoremap <C-p> :Files<CR>

" NerdTree
noremap <silent><leader>t :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=20
let NERDTreeIgnore=['\.o$', '.swp', '\.DS_Store$', '.git$[[dir]]']

" vim-header
let g:header_auto_add_header = 0
let g:header_field_author = 'Derrick Park'
let g:header_field_author_email = 'derrick.park@dpcodes.academy'
let g:header_field_timestamp_format = '%c'

" vim-tagbar
nmap <silent><leader>T :TagbarToggle<CR>

" Color scheme
colorscheme gruvbox

" Emmet-vim
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = ','
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'jsx',
\  },
\}
autocmd FileType html,css,javascript,jsx,typescriptreact EmmetInstall

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

" Rename for current word project wide
nnoremap <leader>pr :CocSearch <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Language Specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Rust
let g:rustfmt_autosave = 1

