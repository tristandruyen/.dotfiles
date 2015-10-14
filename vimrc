""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"General Stuff
"filetype off
set nocompatible
syntax on
filetype plugin indent on
set t_Co=256
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set undofile
"""""""""""""""""""""""""""""""""""""

"Search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

"Pathogen
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""
"Line Display
set modelines=0

"Colorscheme
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized

let mapleader=" "
nnoremap <C-r> gg=G

"easy switching back to normal
inoremap jj <ESC>

"folding
set foldmethod=syntax
set foldlevelstart=20

"invisible chars
set list
"set listchars=tab:▸\ ,eol:¬
set listchars=tab:▸\ ,eol:¬,trail:~,extends:>,precedes:<

"Consistent tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"longlines
set nowrap
set textwidth=79
set formatoptions=cro1
set colorcolumn=80

"Mouse Comp
set mouse=a
set ttymouse=xterm2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"General Key Mappings

nnoremap <tab> %
vnoremap <tab> %

"fixmovement
nnoremap j gj
nnoremap k gk
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"fix f1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"switch splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"PLUGIN SETTINGS AND MAPPINGS

"nerdtree mapping

"Functions"""""""
" Toggle Nerdtree and witch to actibe buffer
function! RcopenTree()
  ":NERDTreeTabsToggle
  :NERDTreeToggle
  wincmd p
endfunction
"""""""""""""""""
nnoremap <C-n> :execute RcopenTree()<CR>
"nnoremap <C-n> :NERDTreeFocusToggle<CR>
"nnoremap <C-b> :NERDTreeTabsClose<CR>
let g:nerdtree_tabs_autofind = 1
"""""""""""""""""""""""""""""""""""""


"EasyMotionn Mapping
let g:EasyMotion_leader_key = '<Leader>'
nmap <leader>w <Plug>(easymotion-bd-w)
nmap <leader>e <Plug>(easymotion-bd-e)
nmap <leader>q <Plug>(easymotion-s)
nmap <leader>s <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1
"""""""""""""""""""""""""""""""""""""


"POWERLINE
let g:airline_powerline_fonts = 1
"""""""""""""""""""""""""""""""""""""

"EasyTags
let g:easytags_opts = ['--fields=+l']
let g:easytags_dynamic_files = 1
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
let g:easytags_include_members = 1
let g:easytags_events = ['BufWritePost']
"""""""""""""""""""""""""""""""""""""

"YCM
set tags=tags;
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_add_preview_to_completeopt = 1
"""""""""""""""""""""""""""""""""""""

"Projectroot
nnoremap <leader>dp :ProjectRootCD<cr>
"""""""""""""""""""""""""""""""""""""

"CtrlP
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0
" Ignore these directories
set wildignore+=*/out/**
set wildignore+=*/vendor/**
set wildignore+=*/tmp/**
"""""""""""""""""""""""""""""""""""""


"Syntactic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Disable CSS/SCSS for now
let g:syntastic_mode_map = { 'passive_filetypes': ['scss']}
"""""""""""""""""""""""""""""""""""""

"Ag
let g:ag_working_path_mode="r"
""""""""""""""""""""""""""""""""""""""

"Rainbow Parantheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"""""""""""""""""""""""""""""""""""""""

"Tagbar
nmap <C-m> :TagbarToggle<CR>
"""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

