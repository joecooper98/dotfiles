"vundle 
set nocompatible              " be iMproved, required
filetype off                  " required
set hidden


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

Plugin 'dense-analysis/ALE'

Plugin 'tpope/vim-surround'

Plugin 'airblade/vim-gitgutter'

Plugin 'maxbrunsfeld/vim-yankstack'

Plugin 'jlanzarotta/bufexplorer'

Plugin 'amix/open_file_under_cursor.vim'

Plugin 'preservim/nerdcommenter'

Plugin 'preservim/nerdtree'

Plugin 'preservim/tagbar'

Plugin 'Yggdroot/indentLine'

Plugin 'neoclide/coc.nvim'

Plugin 'JuliaEditorSupport/julia-vim'

Plugin 'arcticicestudio/nord-vim'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'mbbill/undotree'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'lervag/vimtex'

"Plugin 'sirver/ultisnips'
"
"Plugin 'KeitaNakamura/tex-conceal.vim'

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
colorscheme nord


set tabstop=2
set shiftwidth=2
set expandtab
set list
set lcs=tab:>-,space:·

let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" commands

let mapleader = ","

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

set splitright

" save buffer
nmap <leader>w :w!<cr>

" search hacks
map <space> /
map <C-space> ?
map <silent> <leader><cr> :noh<cr>

"Terminal
map <leader>tt :vert term<cr>

" switch windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <M-j> <C-W>j
map <M-k> <C-W>k
map <M-h> <C-W>h
map <M-l> <C-W>l

" new windows

map <leader>wv :vsplit<cr>
map <leader>wh :hsplit<cr>

" tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

map <leader>sw :set wrap!<cr>

" buffers
" Close current buffer
map <leader>bd :Bclose<cr>

" Close all buffers
map <leader>ba :1,1000 bd!<cr>


" bufexplorer
map <leader>o :BufExplorer<cr>

let g:airline_theme='base16_nord'
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

map <leader>c <plug>NERDCommenterInvert

" tagbar

nmap <F8> :TagbarToggle<CR>

" undotree

nnoremap <F7> :UndotreeToggle<CR>

" airline


" enable/disable coc integration >
  let g:airline#extensions#coc#enabled = 1
" change error symbol: >
  let airline#extensions#coc#error_symbol = '!!:'
" change warning symbol: >
  let airline#extensions#coc#warning_symbol = '!:'
" change error format: >
  let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
" change warning format: >
  let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let g:airline#extensions#tabline#enabled = 1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

nmap <silent> <leader>db <Plug>(ale_previous_wrap)
nmap <silent> <leader>df <Plug>(ale_next_wrap)

" ale

let g:ale_disable_lsp = 1

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ale_sign_column_always = 1

let g:ale_fixers = {
                        \ '*' : ['prettier', 'eslint', 'remove_trailing_lines'],
                        \ 'python' : ['yapf', 'isort', 'autopep8']
                        \}

let g:ale_linters = {
                        \ 'python' : ['flake8']
                        \}

let g:ale_set_highlights = 0

map <F9> :ALEFix <CR>
map <leader>f :ALEFix <CR>
map <F10> :ALELint <CR>

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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"



" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')



autocmd BufRead,BufNewFile molcas.input set filetype=molcas
autocmd BufRead,BufNewFile molpro.inp set filetype=molpro
autocmd BufRead,BufNewFile bagel.json set filetype=bagel

autocmd BufRead,BufNewFile *.out,*.log :setlocal nolist sw=2 ts=2 

let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

autocmd FileType molcas map <buffer> <F5> :w<CR>:vert term ++shell nohup pymolcas -f -b 1 "%" & ; tail -F -n1000 %<.log <CR>
autocmd FileType molpro map <buffer> <F5> :w<CR>:vert term ++shell nohup molpro -W `pwd` -I `pwd` -d `pwd`  "%" & ; tail -F -n1000 %<.out <CR>
autocmd FileType bagel map <buffer> <F5> :w<CR>:vert term ++shell nohup bagel "%" > out.out & ; tail -F -n1000 out.out <CR>
autocmd FileType python map <buffer> <F5> :w<CR>:vert term python3 "%"<CR>
autocmd FileType julia map <buffer> <F5> :w<CR>:vert term julia "%"<CR>
autocmd FileType fortran map <buffer> <F5> :w<CR>:vert term ++shell gfortran -O3 -lblas -llapack % -o %<.o && ./%<.o <CR>
autocmd FileType fortran map <buffer> <F6> :w<CR>:vert term ++shell ifort -O3 -qmkl % -o %<.o && ./%<.o <CR>
autocmd FileType shell map <buffer> <F5> :w<CR>:vert term ++shell bash % <CR>
autocmd FileType matlab map <buffer> <F5> :w<CR>:vert term ++shell matlab -batch % <CR>
autocmd FileType latex map <buffer> <F5> :w<CR>:vert term latex "%"<CR>

"Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

"make vim save and load the folding of the document each time it loads"
"also places the cursor in the last place that it was left."
au BufWinLeave * mkview
au BufWinEnter * silent loadview


"latex section
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"
"let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0
"
"set conceallevel=1
"let g:tex_conceal='abdmg'
"hi Conceal ctermbg=none
"
"nnoremap <leader>s :setlocal spell!<CR>
"set spelllang=en_gb
"inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u
"
"autocmd FileType latex :call CocDisable()
"
