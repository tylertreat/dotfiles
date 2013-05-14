filetype off
call pathogen#infect()
call pathogen#helptags()

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

let g:pymode_folding=0
let g:pymode_lint_ignore = "W391"
let g:pymode_lint = 0
let g:pymode_lint_cwindow = 0
let g:pymode_run = 0

" Task lists
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>

" Syntax highlighting and validatin
syntax on                    " syntax highlighing
filetype on                  " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

" PEP8
let g:pep8_map='<leader>8'

" Tab completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" NERD Tree
map <leader>n :NERDTreeToggle<CR>

" Refactoring and go to definition
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Searching
nmap <leader>a <Esc>:Ack!

" Setup some color stuff.
set background=dark
set t_Co=256
colorscheme desert256

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


