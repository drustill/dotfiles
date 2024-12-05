filetype plugin on
filetype indent on
au FocusGained,BufEnter * silent! checktime

"                                         ╭───────────────────────────────────────────────────────────╮
set encoding=utf8
set novisualbell                        " │                                                           │
set belloff=all
set splitbelow                            " │ Horizontal split goes to bottom                           │
set splitright                          " │ Vertical split goes to the right                          │
set autowrite                          " │                                                           │
set hidden
set shell=sh
set noerrorbells                        " │ DOORBELL                                                  │
set autoread                            " │ Autoread the file if changed in diff editor               │
set relativenumber                      " │                                                           │
set nowrap                              " │                                                           │
set ruler                               " │                                                           │
set previewheight=25
set guicursor=                          " │                                                           │
set nojoinspaces
set display+=lastline                   " │                                                           │
set title
set signcolumn=yes                      " │                                                           │
set scrolloff=18                        " │                                                           │
set number                              " │                                                           │
set history=500                         " │                                                           │
set wildmenu                            " │                                                           │
set ruler                               " │                                                           │
set showcmd                             " │                                                           │
set cmdheight=1                         " │                                                           │
set tabstop=2                           " │                                                           │
set softtabstop=2                       " │                                                           │
set comments=
set shiftwidth=2                        " │                                                           │
set autoindent                          " │                                                           │
set smartindent
set hlsearch                            " │                                                           │
set incsearch
set showmatch                           " │                                                           │
set mat=300                             " │                                                           │
set mouse=a                             " │                                                           │
set background=dark
set rtp+=/opt/homebrew/opt/fzf
set foldenable
set foldmethod=expr
set foldlevel=999
set noswapfile
set completeopt=menuone,popup
set cmdheight=2
set formatexpr=CocActionAsync('formatSelected')
set tagfunc=CocTagFunc
set formatoptions=croqnjpt
" set list listchars=tab:\›\ ,trail:·,eol:¬,leadmultispace:---+,nbsp:⍽,extends:>,precedes:<

let mapleader = ","

" Ignore compiled files
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
nnoremap <leader>W :w !sudo tee % > /dev/null<cr>
nnoremap <leader>rb <C-^>
nnoremap <leader><leader> :ls t<CR>:b<Space>
nnoremap <leader>n :bnext<cr>
nnoremap <leader>d :bdelete<cr>
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>aa :badd %:h<tab>
nnoremap <silent> <leader>ba :copen<CR>:execute "badd " . expand('%')<CR>
nnoremap <leader>bc :balt %<tab>
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

nnoremap <leader>qa :wqa<CR>
nnoremap <leader>qq :q<CR>
nnoremap <leader>qo :q<CR>
nnoremap <leader>qw :wq<CR>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? copilot#Accept() ? "\<Tab>" :
      \ coc#refresh() : "<Tab>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <Tab> coc#pum#visible() ? "\<C-n>" : "\<Tab>"

" Restart Coc & reload buffers
nnoremap <leader>re :RestartCoc<cr>
nnoremap <leader>rv :bufdo e<cr>
nnoremap <leader>ff za
nnoremap <leader>fa :execute "badd " . expand("<cfile>")<CR>
nnoremap <leader>fv :execute "vsp " . expand("<cfile>")<CR>
nnoremap <leader>fs :execute "split " . expand("<cfile>")<CR>:wincmd J<CR>
nnoremap <leader>ft :execute "tab sb " . expand("<cfile>")<CR>
nnoremap <leader>fc :ccl<CR>
nnoremap <leader>fo :copen<CR>

nnoremap <leader>lf :Files<CR>
nnoremap <leader>lg :GFiles<CR>
nnoremap <leader>lr :Rg<CR>
nnoremap <leader>lh :Helptags<CR>
nnoremap <leader>lo :History<CR>
nnoremap <leader>lb :Buffers<CR>
nnoremap <silent> <leader>la :CocList<CR>
nnoremap <silent> <leader>lo :CocList outline<CR>
nnoremap <silent> <leader>lf :CocList functions<CR>

nnoremap <C-y> 5<C-y>
nnoremap <C-e> 5<C-e>

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Text indent without leaving visual mode
xmap > >gv
xmap < <gv

" Search for selected text with '*' in visual mode
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
" Replace selected text with 'c' in visual mode
vnoremap <silent> ^ :<C-u>call VisualSelection('replace', '')<CR>

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

highlight PreviewWindow guibg=#282c34 ctermbg=235

"------------------------
function! GitStatus()
				  let [a,m,r] = GitGutterGetHunkSummary()
					  return printf('+%d ~%d -%d', a, m, r)
endfunction


" Delete trailing white space on save, useful for some filetypes ;)
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


function! StatusDiagnostic() abort
	let info = get(b:, 'coc_diagnostic_info', {})
if empty(info) | return '' | endif
	let msgs = []
	if get(info, 'error', 0)
		call add(msgs, 'E' . info['error'])
	endif
	if get(info, 'warning', 0)
		call add(msgs, 'W' . info['warning'])
	endif
	return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
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


" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"---------------------------
" Plug 'preservim/nerdtree'
" Plug 'pangloss/vim-javascript'
" Plug 'junegunn/vim-easy-align'
" Plug 'godlygeek/tabular'
" Plug 'ryanoasis/vim-devicons'
" Plug 'itchyny/lightline.vim'
" Plug 'EdenEast/nightfox.nvim'
"
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-surround'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'justinmk/vim-sneak'
Plug 'preservim/vim-markdown'
Plug 'fatih/molokai'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

"
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-tsserver',
	\ 'coc-marketplace',
  \ 'coc-elixir',
  \ 'coc-html',
  \ 'coc-yaml',
  \ 'coc-vimlsp',
  \ 'coc-svg',
  \ 'coc-lists',
  \ 'coc-yank',
  \ 'coc-highlight',
	\ 'coc-prettier',
	\ 'coc-eslint',
  \ ]


let g:sneak#label = 1
nnoremap s <Plug>Sneak_s
nnoremap S <Plug>Sneak_S

let g:go_highlight_types = 1
let g:go_highlight_fields = 1

nnoremap <leader>py <Plug>(Prettier)

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


xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>R	<Plug>(coc-rename)
nmap <leader>F  <Plug>(coc-format-selected)

nmap <silent> gD :call <SID>go_to_definition()<CR>
nmap <silent> gf <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-functions)

nmap <silent> gd <Plug>(coc-references)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [d <Plug>(coc-definition)
nmap <silent> ge <Plug>(coc-diagnostic-next)
nmap <silent> [g <Plug>(coc-diagnostic-prev)

" diagnostic hovering with coc only in a vim environment
" vscode/cursor keep default
if exists(':CocActionAsync')
  nnoremap gh :call CocActionAsync('doHover')<CR>
endif

" nnoremap <silent><nowait> <space>f  :<C-u>CocList files<CR>
" nnoremap <silent><nowait> <space>o  :<C-u>CocList -A outline -kind<CR>
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<CR>
" nnoremap <silent><nowait> <space>l  :<C-u>CocList lines<CR>
" nnoremap <silent><nowait> <space>q  :<C-u>CocList quickfix<CR>
" nnoremap <silent><nowait> <space>w  :<C-u>CocList -I -N symbols<CR>
" nnoremap <silent><nowait> <space>y  :<C-u>CocList -A --normal yank<CR>
" nnoremap <silent><nowait> <space>b  :<C-u>CocList -A -N --normal buffers<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! s:go_to_definition()
  if CocActionAsync('jumpDefinition', v:false)
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

" In the preview window, use 'o' or 'l' to jump to the selected location
autocmd! FileType coc-explorer nmap <buffer> o <CR>
autocmd! FileType coc-explorer nmap <buffer> l <CR>


" List all symbols in the current buffer
let g:coc_enable_locationlist = 1
let g:coc_enable_diagnostic_sign = 1
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

" Something for coc commands
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd BufEnter *.{js,jsx,ts,tsx} :call <SID>check_eslint()
autocmd BufWritePre * %s/\s\+$//e

function! s:RestartCoc() abort
  silent! CocRestart
  echohl String | echom 'Restarting COC...' | echohl None
endfunction

command! RestartCoc call s:RestartCoc()

command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:tmux_navigator_save_on_switch = 2

let g:yaml_limit_spell = 1
let g:javascript_plugin_jsdoc = 1

let g:fzf_layout = { 'down': '40%' }

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

""
" => Theme & transparent bg
"---------------------------
" backup to ~/.tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
set termguicolors
set background=dark
set laststatus=2

set statusline+=%F\ %m%m%m\ (buf\ %n)\ (%l\ of\ %L\ lines)

let g:coc_disable_transparent_cursor=1

colorscheme molokai

