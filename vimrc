" Use Vim settings, rather then Vi settings (much better!). 
" This must be first, because it changes other options as a side effect. 
set nocompatible 
set autoread
"set ignorecase
"set smartcase
"set cursorline

call pathogen#infect()

" allow backspacing over everything in insert mode 
set backspace=indent,eol,start 

nnoremap ; :
"nore : ;

let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
map <leader>tn :tabnew 
map <leader>cd :cd %:p:h<cr>
map <silent> ,/ :nohlsearch<CR>

inoremap jj <Esc>

set autoindent " always set autoindenting on 
set nosmartindent
set et 
set sw=4 
set smarttab 

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set scrolloff =5 
set history=500 " keep 50 lines of command line history 
set ruler " show the cursor position all the time 
set showcmd " display incomplete commands 
set incsearch " do incremental searching 

" Don't use Ex mode, use Q for formatting 
map Q gq 
"nmap Q gqap

" This is an alternative that also works in block mode, but the deleted 
" text is lost and it only works for putting the current register. 
"vnoremap p "_dp 

" Switch syntax highlighting on, when the terminal has colors 
" Also switch on highlighting the last used search pattern. 
if &t_Co > 2 || has("gui_running") 
 syntax on 
 set hlsearch 
endif 

" Only do this part when compiled with support for autocommands. 
if has("autocmd") 

" Enable file type detection. 
" Use the default filetype settings, so that mail gets 'tw' set to 72, 
" 'cindent' is on in C files, etc. 
" Also load indent files, to automatically do language-dependent indenting. 
"filetype plugin indent on 

set shellslash

set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'
let g:TeX_ViewRule_pdf='Preview'

" For all text files set 'textwidth' to 78 characters. 
autocmd FileType text setlocal textwidth=78 
autocmd FileType python compiler pylint
let g:pylint_onwrite = 0


endif

set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 

if &t_Co >= 256 || has("gui_running")
    colorscheme gruvbox
    set background=dark
endif

sy on

set gfn=Menlo\ Regular:h12
set fen

set wildignore=*.pyc,*.swp,*.o,*.so
set visualbell
set noerrorbells

set pastetoggle=<F2>

cmap w!! w !sudo tee % >/dev/null

"set relativenumber

nnoremap <tab> %
vnoremap <tab> %

" Syntax checking with syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Ignore some style errors
let g:syntastic_python_flake8_post_args='--ignore=E201,E202,E231,E731,E226,E225,E501,E302,E701,E221,E222,E306,E127'
"set statusline=%{fugitive#statusline()}

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
vnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
