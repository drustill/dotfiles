filetype plugin on
filetype indent on

" automatically reload files when changed outside of vim
au FocusGained,BufEnter * silent! checktime

" no bells
set novisualbell
set belloff=all
set noerrorbells
set splitbelow
set splitright
set autowrite
set hidden
set relativenumber
set number
set nowrap
set showcmd
set title
set shell=sh
set autoread
set nojoinspaces
set guicursor=
set display+=lastline
set background=dark
set history=500
set wildmenu
set completeopt=menuone,popup
set scrolloff=18
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set hlsearch
set incsearch
set showmatch
set mat=300
set mouse=a
set foldmethod=expr
set foldlevel=999
set noswapfile
set termguicolors
set laststatus=2
set cmdheight=2
set formatoptions=croqnjpt

let mapleader = ","

" Ignore compiled files in command mode
set wildmode=list:full
set wildignorecase
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set regexpengine=0
set clipboard^=unnamed,unnamedplus
set path=.,*
set wildcharm=<Tab>
set wildmode=longest:full,full

syntax on
nmap j gj
nmap k gk

nnoremap <leader>w :w!<cr>
nnoremap <leader><leader> :ls t<CR>:b<Space>
nnoremap <leader>n :bnext<cr>
nnoremap <leader>d :bdelete<cr>
nnoremap <leader>b :bprevious<cr>

nnoremap <leader>v :vsp<cr>
nnoremap <leader>s <C-W>s
nnoremap <leader>c <C-W>c

nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tv :tabnew $HOME/.vimrc<cr>

nnoremap + :resize +2<CR>
nnoremap = :vertical resize +2<CR>
nnoremap - :vertical resize -2<CR>
nnoremap _ :resize -2<CR>
nnoremap 0 ^

nnoremap <space> /
nnoremap <leader><space> ?
nnoremap <leader><cr> :nohlsearch<CR>

nnoremap <leader>qq :q<CR>
nnoremap <leader>qw :wq<CR>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? copilot#Accept() ? "\<Tab>" :
      \ coc#refresh() : "<Tab>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <Tab> coc#pum#visible() ? "\<C-n>" : "\<Tab>"

nnoremap <C-y> 5<C-y>
nnoremap <C-e> 5<C-e>

" trigger completion if popup menu is visible
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Text indent without leaving visual mode
xmap > >gv
xmap < <gv

" Search for selected text with '*' in visual mode
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
" Replace selected text with 'c' in visual mode
vnoremap <silent> ^ :<C-u>call VisualSelection('replace', '')<CR>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

highlight PreviewWindow guibg=#282c34 ctermbg=235

" Delete trailing white space on save, useful for some filetypes
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*ts,*tsx,*.js,*.go,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


call plug#begin()
if executable('node')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
Plug 'junegunn/vim-peekaboo'
Plug 'tmux-plugins/vim-tmux'
Plug 'justinmk/vim-sneak'
Plug 'preservim/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ ]

let g:sneak#label = 1
nnoremap s <Plug>Sneak_s
nnoremap S <Plug>Sneak_S

let g:go_highlight_types = 1
let g:go_highlight_fields = 1

if isdirectory('./node_modules') && isdirectory('./node_modules/stylelint')
  let g:coc_global_extensions += ['coc-stylelintplus']
endif

function! s:check_eslint()
  if !isdirectory('./node_modules') || !isdirectory('./node_modules/eslint')
    call coc#config('eslint', {
    \ 'enable': v:false,
    \ })
  endif
endfunction

set runtimepath^=~/.config

nnoremap gh :call CocAction('doHover')<CR>

" Highlighting for JavaScript const and let and class etc
autocmd FileType javascript highlight jsStorageClass cterm=bold ctermfg=161 gui=bold guifg=#F92672

" List all symbols in the current buffer
let g:coc_enable_locationlist = 1
let g:coc_enable_diagnostic_sign = 1
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
let g:coc_disable_transparent_cursor=1
let g:coc_disable_startup_warning = 1

" Something for coc commands
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd BufEnter *.{js,jsx,ts,tsx} :call <SID>check_eslint()
autocmd BufWritePre * %s/\s\+$//e

let g:tmux_navigator_save_on_switch = 2
let g:yaml_limit_spell = 1
let g:javascript_plugin_jsdoc = 1

" Set cursor shape in insert mode and normal mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Reset the cursor shape on Vim start (for older versions of Vim)
augroup myCmds
  au!
  autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

set statusline=%F\ %m\ (buf\ %n)\ (%l,%c\ of\ %L\ lines)

" colorscheme dracula
try
  colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry

highlight Normal guibg=#191A21


" " In the preview window, use 'o' or 'l' to jump to the selected location
" autocmd! FileType coc-explorer nmap <buffer> o <CR>
" autocmd! FileType coc-explorer nmap <buffer> l <CR>
"
" backup to ~/.tmp
" set backup
" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set backupskip=/tmp/*,/private/tmp/*
" set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set writebackup

" xmap <leader>F  <Plug>(coc-format-selected)
" nmap <leader>R	<Plug>(coc-rename)
" nmap <leader>F  <Plug>(coc-format-selected)

" nmap <silent> gD :call <SID>go_to_definition()<CR>
" nmap <silent> gf <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-functions)

" nmap <silent> gd <Plug>(coc-references)
" nmap <silent> gr <Plug>(coc-references)
" nmap <silent> [d <Plug>(coc-definition)
" nmap <silent> ge <Plug>(coc-diagnostic-next)
" nmap <silent> [g <Plug>(coc-diagnostic-prev)

" nnoremap <silent><nowait> <space>f  :<C-u>CocList files<CR>
" nnoremap <silent><nowait> <space>o  :<C-u>CocList -A outline -kind<CR>
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<CR>
" nnoremap <silent><nowait> <space>l  :<C-u>CocList lines<CR>
" nnoremap <silent><nowait> <space>q  :<C-u>CocList quickfix<CR>
" nnoremap <silent><nowait> <space>w  :<C-u>CocList -I -N symbols<CR>
" nnoremap <silent><nowait> <space>y  :<C-u>CocList -A --normal yank<CR>
" nnoremap <silent><nowait> <space>b  :<C-u>CocList -A -N --normal buffers<CR>

" function! s:go_to_definition()
"   if CocActionAsync('jumpDefinition', v:false)
"     return v:true
"   endif

"   let ret = execute("silent! normal \<C-]>")
"   if ret =~ "Error" || ret =~ "错误"
"     call searchdecl(expand('<cword>'))
"   endif
" endfunction
"

" function! s:RestartCoc() abort
"   silent! CocRestart
"   echohl String | echom 'Restarting COC...' | echohl None
" endfunction

" command! RestartCoc call s:RestartCoc()

" let g:fzf_layout = { 'down': '40%' }
"

" function! StatusDiagnostic() abort
" 	let info = get(b:, 'coc_diagnostic_info', {})
" if empty(info) | return '' | endif
" 	let msgs = []
" 	if get(info, 'error', 0)
" 		call add(msgs, 'E' . info['error'])
" 	endif
" 	if get(info, 'warning', 0)
" 		call add(msgs, 'W' . info['warning'])
" 	endif
" 	return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
" endfunction

" Plug 'preservim/nerdtree'
" Plug 'pangloss/vim-javascript'
" Plug 'junegunn/vim-easy-align'
" Plug 'godlygeek/tabular'
" Plug 'ryanoasis/vim-devicons'
" Plug 'itchyny/lightline.vim'
" Plug 'EdenEast/nightfox.nvim'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'tpope/vim-surround'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'fatih/molokai'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" let g:coc_global_extensions = [
"   \ 'coc-css',
"   \ 'coc-json',
"   \ 'coc-tsserver',
" 	\ 'coc-marketplace',
"   \ 'coc-elixir',
"   \ 'coc-html',
"   \ 'coc-yaml',
"   \ 'coc-vimlsp',
"   \ 'coc-svg',
"   \ 'coc-lists',
"   \ 'coc-yank',
"   \ 'coc-highlight',
" 	\ 'coc-prettier',
" 	\ 'coc-eslint',
"   \ ]

" function! GitStatus()
" 				  let [a,m,r] = GitGutterGetHunkSummary()
" 					  return printf('+%d ~%d -%d', a, m, r)
" endfunction
"
"
" nnoremap <leader>qa :wqa<CR>
" nnoremap <leader>qo :q<CR>

" Restart Coc & reload buffers
" nnoremap <leader>re :RestartCoc<cr>
" nnoremap <leader>rv :bufdo e<cr>
" nnoremap <leader>ff za
" nnoremap <leader>fa :execute "badd " . expand("<cfile>")<CR>
" nnoremap <leader>fv :execute "vsp " . expand("<cfile>")<CR>
" nnoremap <leader>fs :execute "split " . expand("<cfile>")<CR>:wincmd J<CR>
" nnoremap <leader>ft :execute "tab sb " . expand("<cfile>")<CR>
" nnoremap <leader>fc :ccl<CR>
" nnoremap <leader>fo :copen<CR>

" nnoremap <leader>lf :Files<CR>
" nnoremap <leader>lg :GFiles<CR>
" nnoremap <leader>lr :Rg<CR>
" nnoremap <leader>lh :Helptags<CR>
" nnoremap <leader>lo :History<CR>
" nnoremap <leader>lb :Buffers<CR>
" nnoremap <silent> <leader>la :CocList<CR>
" nnoremap <silent> <leader>lo :CocList outline<CR>
" nnoremap <silent> <leader>lf :CocList functions<CR>
"
"
" set signcolumn=yes
" set comments=
" set rtp+=/opt/homebrew/opt/fzf
" set formatexpr=CocActionAsync('formatSelected')
" set tagfunc=CocTagFunc

