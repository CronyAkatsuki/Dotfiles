" Plug settings
call plug#begin()
Plug 'junegunn/vim-plug' " I made it so that it updates it self with PlugUpdate command
Plug 'kaicataldo/material.vim' " material color scheme
Plug 'mhinz/vim-startify' " nice startup screen
Plug 'haya14busa/incsearch.vim' " inc search on steroids
Plug 'scrooloose/nerdcommenter' " easy comment big chunks of code
Plug 'jiangmiao/auto-pairs' " auto pairs
Plug 'luochen1990/rainbow' " the rainbow is my
Plug 'lambdalisue/suda.vim' " Edit and write system files
Plug 'fatih/vim-go' " go support (syntax, compile and diagnostics)
Plug 'sheerun/vim-polyglot' " advances syntax for multiple languanges
Plug 'octol/vim-cpp-enhanced-highlight' " advances c++ syntax
Plug 'skywind3000/asynctasks.vim' " task manager
Plug 'skywind3000/asyncrun.vim' " task runner
Plug 'preservim/nerdtree' " nerd tree
Plug 'ryanoasis/vim-devicons' " icons support
call plug#end()

" Disable PlugUpgrade
delc PlugUpgrade

" Center when entering instert mode
autocmd InsertEnter * norm zz

" Turn off auto commenting
autocmd FileType * setlocal formatoptions-=cro

" Open file at the place where you left
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Plugin settings
filetype on

" Encoding settings
scriptencoding utf-8
set encoding=utf-8

" statusline format
set statusline=
set statusline+=\ \                                                     " space
set statusline+=%#StatusLine#                                           " coloring
set statusline+=\ %f\                                                   " file name
set statusline+=[%n/                                                    " buffer number
set statusline+=%{len(filter(range(1,bufnr('$')),'buflisted(v:val)'))}] " Opened buffer count
set statusline+=%m\                                                     " does something
set statusline+=%=                                                      " moves the rest to the right side
set statusline+=%#CursorColumn#                                         " colorings
set statusline+=\ %y                                                    " filetype
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}              " encoding
set statusline+=\[%{&fileformat}\]                                      " fileformat
set statusline+=\ %l/%L                                                 " line / all lines
set statusline+=\ %c                                                    " column
set statusline+=\                                                       " space

" set python directories
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3'

set hlsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map *  <Plug>(incsearch-nohl-*)
let g:incsearch#auto_nohlsearch = 1

" misc
set nostartofline
set number
set showcmd
set nocompatible
set modelines=0
set novisualbell
set noerrorbells
set scrolloff=3
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set whichwrap+=<,>,h,l
set smartcase
set mouse=a
set updatetime=300
set shortmess+=c
set signcolumn=yes

" No tmp or swp files
set nobackup
set nowritebackup
set noswapfile

" System clipboard
set clipboard+=unnamedplus

" allow unsaved buffers to be hidden
set hidden

" some mappings
map <silent> <C-down> <C-W>j
map <silent> <C-up> <C-W>k
map <silent> <C-left> <C-W>h
map <silent> <C-right> <C-W>l
map <silent> <S-left> :bp<CR>
map <silent> <S-right> :bn<CR>

" Sensible window sizes
set winheight=10
set winwidth=80
set winminheight=1
set winminwidth=5

" Some settings
set lazyredraw    " reduced screen flicker
set ttyfast
set backspace=indent,eol,start
set matchpairs+=<:>
set re=1

" tab settings
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab

" leader maping
let g:mapleader = ","
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

au FocusGained,BufEnter * checktime

" Windows settings
set splitbelow

" color scheme
syntax on

set background=dark
set termguicolors
let g:material_terminal_italics = 1
let g:material_theme_style = 'default'
colorscheme material

" nerdcommenter settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCompactSexyComs = 1
let g:NERDToggleCheckAllLines = 1

" rainbow settings
let g:rainbow_active = 1

" enable opening and saving sudo files with suda
let g:suda_smart_edit = 1
let g:suda#prefix = ['suda://', 'sudo://', '_://']
let g:suda#prompt = 'Pass: '

" go settings
au FileType go nmap <leader>i <Plug>(go-install)
au FileType go nmap <leader>h <Plug>(go-doc-browser)

let g:go_code_completion_enabled = 0 " disable vim-go completion, coc.nvim does better job
let g:go_updatetime = 400
let g:go_fold_enable = []
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

" cpp syntax settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" async run and task settings
let g:asyncrun_open = 6                                                     " enable quickfix windows
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']     " set root marks
let g:asynctasks_term_pos = 'tab'
let g:asynctasks_term_reuse = 1
let g:asynctasks_system = 'linux'
map <leader>b :AsyncTask file-build<CR>
map <leader>r :AsyncTask file-run<CR>

" map
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeQuitOnOpen=1

" devicons settigs
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_startify = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

