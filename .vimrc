" Basic config
syntax on
set hidden
filetype plugin indent on
set autochdir                           " always switch to the current file directory 
set backspace=indent,eol,start          " make backspace a more flexible
set noerrorbells                        " don't make noise
set linebreak
set nobackup
set nowritebackup
set autoread
set ttyfast
set nu
set cindent
set is hls ic scs magic
set nocompatible
set undolevels=1000
set whichwrap=<,>,h,l,[,]
map <C-Tab> :bn!<CR>
let mapleader = ","
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>
let macvim_hig_shift_movement = 1

" Fuf config
nmap <silent> <leader>f :FufFile<CR>
nmap <silent> <leader>d :FufBuffer<CR>
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|swp)$|(^|[/\\])\.(hg|git|bzr|DS_Store)($|[/\\])'
let g:fuf_previewHeight = 0

" Popupmenu hacks
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <Tab>      pumvisible() ? "\<C-n>" : "\<Tab>" 
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

set wildmenu                            " turn on command line completion wild style
set wildmode=list:longest               " turn on wild mode huge list
" ignore these list file extensions
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png

" Theme Options
set background=dark
set guifont=Monaco:h12
set guioptions-=T
set guioptions-=r
set guioptions-=L
set fuopt+=maxhorz
" colorscheme wombat
colorscheme molokai

" User Interface
set mousemodel=extend                   " Enable mouse support
set selectmode=mouse
set mouse=a
" set mousefocus

set cursorline                          " highlight current line
set incsearch                           " BUT do highlight as you type you search phrase
set laststatus=2                        " always show the status line
set lazyredraw                          " do not redraw while running macros
set linespace=0                         " don't insert any extra pixel lines betweens rows
set showmatch                           " show matching brackets
set matchtime=5                         " how many tenths of a second to blink matching brackets for
set columns=100                         " window width
set lines=35                            " window height
set ruler
set showcmd
set scrolloff=3                         " how many visible lines before scroll?
set novisualbell
set number                              " turn on line numbers
set numberwidth=5                       " we are good up to 99999 lines
set statusline=%F\ %m%r%h%w%=[%{&ff}]\ %y\ [%04l,%04L]

" Text formatting
set expandtab                           " no real tabs please
set ignorecase                          " case insensitive by default
set infercase                           " case inferred by default
set nowrap                              " do not wrap line
set smartcase                           " if there are caps, go case-sensitive
set shiftwidth=4                        " auto-indent amount when using cindent, >>, << and stuff like that
set softtabstop=4                       " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set tabstop=4                           " real tabs should be 8, and they will show with
set bs=2
set fdm=marker

" Emulate TextMate indent/unindent behavior
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Common mispells
ia teh      the
ia htis     this
ia tihs     this
ia funciton function
ia fucntion function
ia funtion  function
ia retunr   return
ia reutrn   return
ia sefl     self
ia eslf     self

" SnipMate config
" autocmd FileType python set ft=python.django " For SnipMate
" autocmd FileType html set ft=htmldjango.html " For SnipMate

" Ominicomplete config
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 

nmap <silent> <C-F> :BufExplorerHorizontalSplit<cr>

" Nerdtree config
nmap <silent> <C-D> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Supertab config
let g:SuperTabDefaultCompletionType = "context"
set completeopt=longest,menuone,menu

" Supertab and neocomplcache fix
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_manual_completion_start_length = 2
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_auto_select = 1

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

imap <silent> <expr> <TAB> neocomplcache#plugin#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<C-e>" : "\<TAB>")
smap <TAB> <RIGHT> <Plug> (neocomplcache_snippets_jump)
inoremap <expr> <C-e> neocomplcache#complete_common_string() 

" Markdown config
augroup mkd
    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END
