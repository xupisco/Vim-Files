" Basic configuration
syntax on
set nocompatible                            " Não preciso de nada do VI
set nobackup                                " Não fica gerando backup
set nowritebackup                           " Não fica salvando backup
set noswapfile                              " Não salva arquivo de swap
set undolevels=1000                         " Número máximo de undos
set autochdir                               " Muda automaticamente para o diretório do arquivo aberto
set noerrorbells                            " Não fica fazendo barulho
set visualbell                              " Pisca a tela nos erros
set autoread                                " Atualiza arquivo automaticamente caso alterado por fora
set hidden                                  " Permite alterar o buffer sem salvar o antigo
set wildmode=full                           " Método de auto-complete para comandos
set wildmenu                                " Ativa auto-complete para comandos
let mapleader=","                           " Muda tecla padrão para ,
":au BufAdd,BufNewFile * tab sball           " Always open buffers in new tabs

" Editing
set autoindent                              " Identação automática
set expandtab 								" Sem TABs
set smartindent                             " Tenta ser inteligente na identação
set tabstop=4                               " Utiliza 4 espaços no TAB, e não 8
set softtabstop=4                           " Volta um TAB no backspace
set shiftwidth=4                            " Força uso de espaços no TAB
set incsearch                               " Efetua a busca conforme vai digitando
set ic                                      " Ignore case while searching
set nowrap                                  " Quebrar linhas é para os fracos
set selection=exclusive                     " Não pega o char embaixo do cursor

" Omni-complete configuration
" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>" " Faz o ESC fechar o popup sem sair do insert
filetype plugin indent on                   " Habilita omni-complete
set ofu=syntaxcomplete#Complete             " Define modo do omni-complete
set completeopt=menu,preview,longest        " Tenta fazer o pop-up do omni parecer de um IDE
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.json set ft=javascript

" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" Theming
colorscheme hybrid                          " Também gosto do vilight, molokai e ir_black
highlight LineNr ctermfg=black

if has("gui_running")
    set guifont=Monaco:h12                  " Fonte padrão (Mac)
    set columns=100                         " Largura padrão
    set lines=40                            " Altura padrão
    set guioptions-=T                       " Remove toolbar
    set guioptions-=b                       " Remove barra de status
    set guioptions-=r
    set guioptions-=L                       " Sem scroll do lado esquerdo
    set fuopt+=maxhorz                      " Suporte para fullscreen: Shift + Cmd + F
endif

" set cursorline                            " Mostra linha atual
set showmatch                               " Mostra caracter correspondente (), [], {}, etc...
set ruler                                   " Mostra barra de status com posição do cursor
set nohls                                   " Não seleciona resultados da busca. set hls para exibir
set number                                  " Mostra os números das linhas
set numberwidth=5                           " Largura da barra com número das linhas
set scrolloff=5                             " Número de linhas visíveis durante o scrolls
set laststatus=2                            " Número de linhas para a barra de status
set statusline=%<%f\ %h%w%m%r%y%=L:%l/%L\ (%p%%)\ C:%c%V\ B:%o\ F:%{foldlevel('.')}
let macvim_hig_shift_movement=1

" Mappings
" Simula esquema de identação do Textmate
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
nnoremap <leader>l :TagbarToggle<CR>

" Supertab config (plugin)
" let g:SuperTabDefaultCompletionTypeDiscovery = "&omnifunc:<c-x><c-u>"
" let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:acp_behaviorKeywordLength = 4

" Nerdtree config (plugin)
nmap <silent> <C-D> :NERDTreeToggle<CR>
nmap <silent> <leader>d :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
let NERDTreeQuitOnOpen = 1

" Tabbar config (plugin)
let g:Tb_UseSingleClick = 1
let g:Tb_MoreThanOne = 0
let g:Tb_ModSelTarget = 1
let g:Tb_ForceDisplay = 1

" Command-T config
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

" Custom functions
cnoreabbrev _w bdelete

" Mapa para alternar tabs:tabnew
map <D-M-Right> :tabn<CR>   " Cmd + Alt + Direita
map <D-M-Left> :tabp<CR>    " Cmd + Alt + Esquerta
map <C-Tab> :tabn<CR>       " Control + Tab
map <S-C-Tab> :tabp<CR>     " Shift + Control + Tab
for i in range(1, 9) 
    exec "nnoremap <D-".i."> ".i."gt" 
endfor
