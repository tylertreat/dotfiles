set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'robertkluin/vim-handy-highlights.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/powerline'
Plugin 'ervandew/supertab'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'majutsushi/tagbar'
Plugin 'davidhalter/jedi-vim'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Add some stuff to the statusline
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set statusline+=%{fugitive#statusline()}

let g:airline_powerline_fonts = 1

" Code folding
set foldmethod=indent
set foldlevel=99

" Window splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Hitting esc sucks
imap jj <Esc>

" Enable paste toggling
set pastetoggle=<F10>

" Remap leader from \
let mapleader = ","

" Do not search pyc files.
set wildignore+=*.pyc

set history=1000

set mouse=a

" Backup files
set backup
set backupdir=~/tmp/vim/backup//

" Put undo files in a special safe place.
set undofile
set undodir=~/tmp/vim/undo//

" Put swap files in a special place.
set directory=~/tmp/vim/swap//

" Yank to the clipboard
map <C-c> "*y

set ruler
set showcmd

set laststatus=2

set hidden

set backspace=2

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

set number

let g:pymode_options = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_trim_whitespace = 1
let g:pymode_rope = 1
let g:pymode_folding=0
let g:pymode_lint_ignore = "W391"
let g:pymode_lint = 1
let g:pymode_lint_cwindow = 0
let g:pymode_run = 0
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1

" Tell Vim where to find ctags
set tags=./tags,./TAGS,tags;~,TAGS;~

" Jedi vim
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0

" Ctrlp extensions
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :CtrlPFunky<Cr>
" Narrow the list down with word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Syntax highlighting and validation
syntax on                    " syntax highlighing
filetype plugin indent on    " enable loading indent file for filetype
let g:pyflakes_use_quickfix = 0

" Add some nifty name use highlighting
"autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
set hlsearch
noremap ; :set hlsearch! hlsearch?<CR>

" PEP8
let g:pep8_map='<leader>8'

" Tab completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Close tip window when a selection is made
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" NERD Tree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeWinSize = 22
let NERDTreeMinimalUI = 1

" Tagbar
nmap <leader>t :TagbarToggle<CR>

" Flake8 setup and shortcut
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=W391'
nnoremap <leader>s :SyntasticCheck<CR>
nnoremap zj :lnext<CR>zz
nnoremap zk :lprev<CR>zz

" Refactoring and go to definition
let g:pymode_rope_goto_definition_bind = '<leader>j'
let g:pymode_rope_rename_bind = '<leader>r'

" Searching
nmap <leader>a <Esc>:Ack!

" Setup some color stuff
set background=dark
set t_Co=256
colorscheme desert256

highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

set cursorline
set colorcolumn=80

hi Normal guibg=#cccccc ctermbg=234
hi NonText guibg=#cccccc ctermbg=234

" highlight groups
hi CursorLine  cterm=NONE ctermbg=236
hi CursorColumn  cterm=NONE ctermbg=236
hi ColorColumn  cterm=NONE ctermbg=232

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

