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

" Editing
set autoindent                              " Identação automática
set expandtab 								" Sem TABs
set smartindent                             " Tenta ser inteligente na identação
set tabstop=4                               " Utiliza 4 espaços no TAB, e não 8
set shiftwidth=4                            " Força uso de espaços no TAB
set incsearch                               " Efetua a busca conforme vai digitando
set nowrap                                  " Quebrar linhas é para os fracos

" Omni-complete configuration
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>" " Faz o ESC fechar o popup sem sair do insert
filetype plugin indent on                   " Habilita omni-complete
set ofu=syntaxcomplete#Complete             " Define modo do omni-complete
set completeopt=menu,preview,longest        " Tenta fazer o pop-up do omni parecer de um IDE
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Theming
colorscheme wombat                          " Também gosto do vilight, molokai e ir_black
set columns=100                             " Largura padrão
set lines=40                                " Altura padrão
set guifont=Monaco:h12                      " Fonte padrão (Mac)
set guioptions-=T                           " Remove toolbar
set guioptions-=b                           " Remove barra de status
set guioptions-=L                           " Sem scroll do lado esquerdo
set fuopt+=maxhorz                          " Suporte para fullscreen: Shift + Cmd + F
set cursorline                              " Mostra linha atual
set showmatch                               " Mostra caracter correspondente (), [], {}, etc...
set ruler                                   " Mostra barra de status com posição do cursor
set nohls                                   " Não seleciona resultados da busca. set hls para exibir
set number                                  " Mostra os números das linhas
set numberwidth=5                           " Largura da barra com número das linhas
set scrolloff=3                             " Número de linhas visíveis durante o scrolls
set laststatus=2                            " Número de linhas para a barra de status
set statusline=%<%f\ %h%w%m%r%y%=L:%l/%L\ (%p%%)\ C:%c%V\ B:%o\ F:%{foldlevel('.')}
let macvim_hig_shift_movement=1

" Mappings
" Simula esquema de identação do Textmate
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" TagList 
nmap <Leader>t :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_Inc_Winwidth = 1
let Tlist_Show_One_File = 1
let Tlist_Auto_Update = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Sort_Type = "name"

" Supertab config (plugin)
" let g:SuperTabDefaultCompletionTypeDiscovery = "&omnifunc:<c-x><c-u>"
" let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:acp_behaviorKeywordLength = 1

" Nerdtree config (plugin)
nmap <silent> <C-D> :NERDTreeTogg`le<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


" Custom functions

" Mapa para alternar tabs:tabnew
"
map <D-M-Right> :tabn<CR>   " Cmd + Alt + Direita
map <D-M-Left> :tabp<CR>    " Cmd + Alt + Esquerta
map <C-Tab> :tabn<CR>       " Control + Tab
map <S-C-Tab> :tabp<CR>     " Shift + Control + Tab
for i in range(1, 9) 
    exec "nnoremap <D-".i."> ".i."gt" 
endfor
