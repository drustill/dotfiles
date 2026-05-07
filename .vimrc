set belloff=all
set splitbelow splitright
set relativenumber number
set showcmd
set completeopt=menuone,popup
set expandtab tabstop=2 softtabstop=2 shiftwidth=2 smartindent
set showmatch mat=300
set mouse=a
set noswapfile
set termguicolors
set wildignorecase wildmode=longest:full,full
set clipboard^=unnamed,unnamedplus

packadd comment

let mapleader = ","
nmap j gj
nmap k gk
xmap > >gv
xmap < <gv
nnoremap <leader>e :e<space>
nnoremap <leader>w :w!<cr>
nnoremap <leader><leader> :ls t<CR>:b<Space>
nnoremap <leader>n :bn<cr>
nnoremap <leader>d :bd<cr>
nnoremap <leader>b :bp<cr>
nnoremap <leader>v :vsp<cr>
nnoremap <leader>s <C-W>s
nnoremap 0 ^
nnoremap <leader><cr> :nohlsearch<CR>
nnoremap <leader>qq :q<CR>
nnoremap <leader>qw :wq<CR>
nnoremap <C-y> 5<C-y>
nnoremap <C-e> 5<C-e>

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre * call CleanExtraSpaces()
endif

colorscheme habamax
