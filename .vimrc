" vundle 
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
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-surround'

Plugin 'airblade/vim-gitgutter'

Plugin 'junegunn/fzf.vim'

Plugin 'jlanzarotta/bufexplorer'

Plugin 'amix/open_file_under_cursor.vim'

Plugin 'rudrab/vimf90'

Plugin 'python-mode/python-mode'

Plugin 'preservim/nerdcommenter'

Plugin 'preservim/nerdtree'

Plugin 'preservim/tagbar'

Plugin 'neoclide/coc.nvim'

Plugin 'JuliaEditorSupport/julia-vim'

Plugin 'Rigellute/rigel'

Plugin 'vim-airline/vim-airline'


call vundle#end()            " required
filetype plugin indent on    " require



set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on
syntax on

map <leader>q :q!<cr>

"stuff

set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

set updatetime=300

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set background=dark
"if $COLORTERM == 'gnome-terminal' for peaksea
"#    set t_Co=256
"#endif

set termguicolors


" colors and visuals

set number relativenumber
syntax on


"colorscheme peaksea 
colorscheme rigel


" tabs

set tabstop=4
set expandtab
set smarttab

" commands

let mapleader = ","

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


" save buffer
nmap <leader>w :w!<cr>

" search hacks
map <space> /
map <C-space> ?
map <silent> <leader><cr> :noh<cr>

"Terminal
map <leader>tt :term<cr>

" switch windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" new windows

map <leader>wv :vsplit<cr>
map <leader>wh :hsplit<cr>

" tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 


" buffers
" Close current buffer
map <leader>bd :Bclose<cr>

" Close all buffers
map <leader>ba :1,1000 bd!<cr>


" bufexplorer
map <leader>o :BufExplorer<cr>

let g:rigel_airline = 1
let g:airline_theme = 'rigel'

" nerdtree

autocmd VimEnter * NERDTree | wincmd p

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1

" pymode

" nerdcommentor
"" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" tagbar

nmap <F8> :TagbarToggle<CR>

" airline

let g:rigel_airline = 1
let g:airline_theme = 'rigel'


" enable/disable coc integration >
  let g:airline#extensions#coc#enabled = 1
" change error symbol: >
  let airline#extensions#coc#error_symbol = '!:'
" change warning symbol: >
  let airline#extensions#coc#warning_symbol = '!!:'
" change error format: >
  let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
" change warning format: >
  let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'


" fzf 

source ~/.vim/bundle/lsp-examples/vimrc.generated

map ; :Files<CR>

"coc

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <leader> gd <Plug>(coc-definition)
nmap <leader> [g <Plug>(coc-diagnostic-prev)
nmap <leader> ]g <Plug>(coc-diagnostic-next)
nmap <leader>qf  <Plug>(coc-fix-current)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

autocmd FileType python map <buffer> <F6> :w<CR>:verter python3 "%"<CR>
autocmd FileType python map <buffer> <F5> :w<CR>:ter python3 "%"<CR>
autocmd FileType julia map <buffer> <F6> :w<CR>:verter julia "%"<CR>
autocmd FileType julia map <buffer> <F5> :w<CR>:ter julia "%"<CR>

