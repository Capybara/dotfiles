set nocompatible      " We're running Vim, not Vi!
colorscheme Zenburn "color schemes are located in .vim/colors
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect() "pathogen is a plugin manager, clone a plugins git repo to .vim/bundles
" set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
"Omnicomplete settings
filetype plugin on
set ofu=syntaxcomplete#Complete

"Bash shell script plugin settings
let g:BASH_AuthorName = 'My Name'

"Map <Esc> key to 'j' key presses twice quickly
imap jj <Esc> 
"short cut to os x service "search google
map ?g "zyiw
 \ !open http://www.google.com/search?q=";'.@z.'"'<CR>


"Simplenote plugin credentials
source ~/.simplenote_vim

"when something is yanked in vim, it goes to my OS X clipboard
set clipboard=unnamed

"allow switching buffers without writing changes first
set hidden

"I think this for bash plugin

"====================Ruby related stuff=================================================
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1 
syntax on             " Enable syntaxntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
compiler ruby         " Enablenable compiler support for ruby
"Set tab prefrences for ruby files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

"toggle NerdTree file browser with <Esc> + T
function OpenNERDTree()
    execute ":NERDTree"
endfunction
command -nargs=0 OpenNERDTree :call OpenNERDTree()
nmap <ESC>t :NERDTreeToggle<RETURN>

"Show line numbers
set number 
