execute pathogen#infect()

syntax enable
set nocompatible
syntax on
filetype on
filetype plugin on
filetype indent on

set number
set history=1000
set showmatch
set matchtime=0
set shortmess=atI
set ruler
set showcmd

set sidescroll=1
set sidescrolloff=3

" Set xterm title
set title

" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase

set visualbell
set noerrorbells
set printoptions=paper:letter

" Keep more lines of context
set scrolloff=3

" Make backspace delete lots of things
set backspace=indent,eol,start

" Auto-backup files and .swp files don't go to pwd
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Allow switching edited buffers without saving
set hidden

" Look for the file in the current directory, then south until you reach home.
set tags=tags;~/

" Who needs .gvimrc?
if has('gui_running')
  set encoding=utf-8
  "set guifont=Monospace\ Bold\ 9
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
  " Turn off toolbar and menu
  set guioptions-=T
  set guioptions-=m
  colorscheme molokai
else
  colorscheme molokai
end

" Change <Leader>
let mapleader = ","

" Quick timeouts on key combinations.
set timeoutlen=300

" Alternatives to ESC:
"imap jkl <ESC>
"imap jlk <ESC>
"imap kjl <ESC>
"imap klj <ESC>
"imap lkj <ESC>
"imap ljk <ESC>
"imap ;l <ESC>

" "Very magic" regexes in searches
"nnoremap / /\v
"nnoremap ? ?\v

" Vi-style editing in the command-line
"nnoremap : q:a
"nnoremap / q/a
"nnoremap ? q?a

" Lusty
"let g:LustyJugglerShowKeys = 2
"let g:LustyJugglerKeyboardLayout = "dvorak"
"let g:LustyExplorerAlwaysShowDotFiles = 1
let g:LustyExplorerSuppressRubyWarning = 1
nmap <silent> <Leader>f :LustyFilesystemExplorer<CR>
nmap <silent> <Leader>b :LustyBufferExplorer<CR>
nmap <silent> <Leader>r :LustyFilesystemExplorerFromHere<CR>
nmap <silent> <Leader>g :LustyBufferGrep<CR>
nmap <silent> <Leader>j :LustyJuggler<CR>
nmap <silent> <TAB> :LustyJugglePrevious<CR>

"let g:LustyJugglerAltTabMode=1
"noremap <silent> <A-s> :LustyJuggler<CR>

" Window management
"nmap <silent> <Leader>xo :wincmd j<CR>

" Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Fix command typos (stolen from Adam Katz)
nmap ; :

" ` is more useful than ' but less accessible.
nnoremap ' `
nnoremap ` '

" Buffer management
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>
"nmap <TAB> :b#<CR>
"nmap <C-q> :bd<CR>
nmap <C-d> :bw<CR>
vmap <C-d> :bw<CR>

" Toggle highlighting
" nmap <silent> <C-n> :silent :set nohls!<CR>:silent :set nohls?<CR>
nmap <silent> <C-n> :silent :nohlsearch<CR>

" Scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

" % matches on if/else, html tags, etc.
runtime macros/matchit.vim

" Bash-like filename completion
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.fasl

autocmd BufRead letter* set filetype=mail
autocmd Filetype mail set fo -=l autoindent spell

" ITA indenting style
"autocmd Filetype c,cpp,h set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
" JSH indenting style
"autocmd Filetype c,cpp,h set tabstop=8 softtabstop=4 shiftwidth=4 noexpandtab
" Wimba indenting style, sort-of
"autocmd Filetype c,cpp,h set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" Viewglob
"autocmd Filetype c,cpp,h,sh set cindent autoindent

autocmd Filetype sh set ts=4 shiftwidth=2 expandtab
autocmd Filetype lisp,ruby,xml,html set ts=8 shiftwidth=2 expandtab
autocmd Filetype python set ts=2 shiftwidth=2 expandtab
autocmd Filetype xml,xslt,diff,ruby color desert
autocmd Filetype xml,xslt,diff,ruby set expandtab
autocmd FileType javascript,html set ts=2 shiftwidth=2 expandtab
autocmd FileType java set ts=2 shiftwidth=2 expandtab
autocmd BufReadPre viper,.viper set filetype=lisp

" a.vim
nmap <silent> <Leader>h :A<CR>

" Indent XML readably
function! DoPrettyXML()
  1,$!xmllint --format --recover -
  set filetype=xml
endfunction
command! PrettyXML call DoPrettyXML()

" Load local settings
if filereadable($HOME . "/.vimrc-local")
  source ~/.vimrc-local
endif
