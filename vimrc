set nocompatible      " We're running Vim, not Vi!
set autochdir
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
"pathogen is a plugin manager, clone a plugins git repo to .vim/bundles
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
colorscheme solarized "color schemes are located in .vim/colors
set background=dark
call togglebg#map("<F5>")
" set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
" Gundo toggle
 nnoremap <F4> :GundoToggle<CR>
" use blowfish encryption
set cm=blowfish

" Conque stuff
nmap ,T :<C-u>ConqueTerm zsh<CR>
nmap ,t :<C-u>ConqueTermSplit zsh<CR>
"nmap ,p :<C-u>ConqueTermSplit bash <CR>source $HOME/.bash_profile<CR>PS1="\W \u\$ "<CR>clear<CR>pry<CR>
"nmap ,s :<C-u>split scratch \| set nonumber foldcolumn=0 winfixheight<CR>
""let g:ConqueTerm_PromptRegex = '^\[\w\+@[0-9A-Za-z_.-]\+:[0-9A-Za-z_./\~,:-]\+\]\$'
""let g:Conque_TERM = 'vt100'
""let g:Conque_Tab_Timeout = 10
""let g:ConqueTerm_ReadUnfocused = 0



"Omnicomplete settings
filetype plugin on
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set ofu=syntaxcomplete#Complete


" Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>
 
" Set region to American English
set spelllang=en_us

"Bash shell script plugin settings
let g:BASH_AuthorName = 'My Name'

"Map <Esc> key to 'j' key presses twice quickly
imap jj <Esc> 
""short cut to os x service "search google
"map ?g "zyiw
" \ !open http://www.google.com/search?q=";'.@z.'"'<CR>


"Simplenote plugin credentials
source ~/.simplenote_vim
"if filereadable($HOME."/.simplenote_vim")
 "   source $HOME/.simplenote_vim
"endif

"when something is yanked in vim, it goes to my OS X clipboard
set clipboard=unnamed

"allow switching buffers without writing changes first
set hidden


"====================Ruby related stuff=================================================
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1 
syntax on             " Enable syntaxntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
compiler ruby         " Enablenable compiler support for ruby
"Set tab prefrences for ruby files
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab "sts=2 
"set list "show tabs
"toggle NerdTree file browser with <Esc> + T
function OpenNERDTree()
    execute ":NERDTree"
endfunction
command -nargs=0 OpenNERDTree :call OpenNERDTree()
nmap <ESC>t :NERDTreeToggle<RETURN>

"Show line numbers
set number 
hi CursorLine   cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235
"toggle crosshairs
nnoremap <Leader>cr :set cursorline! cursorcolumn!<CR>
