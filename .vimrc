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

Plugin 'jlanzarotta/bufexplorer'

Plugin 'amix/open_file_under_cursor.vim'

Plugin 'rudrab/vimf90'

Plugin 'python-mode/python-mode'

Plugin 'preservim/nerdcommentor'

Plugin 'preservim/nerdtree'

Plugin 'valloric/youcompleteme'

Plugin 'JuliaEditorSupport/julia-vim'

Plugin 'Rigellute/rigel'

Plugin 'vim-airline/vim-airline'

Plugin 'dense-analysis/ale'

call vundle#end()            " required
filetype plugin indent on    " require



set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on
syntax on


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

 let g:pymode_warnings = 1
 let g:pymode_options_colorcolumn = 0
  let g:pymode_quickfix_maxheight = 0

" ALE

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0

map <leader>af :ALEFix<cr>
map <leader>al :ALELint<cr>
map <leader>ag :ALEGoToDefinition<cr>

highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ale_linters = {
\   'python' : ['pylint'],
\}

let g:ale_fixers = {
\       '*': ['remove_trailing_lines'],
\       'python': [
\       'yapf',
\       'add_blank_lines_for_python_control_statements',
\   ],
\}

let g:airline#extensions#ale#enabled = 1

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

" airline

let g:rigel_airline = 1
let g:airline_theme = 'rigel'

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif



