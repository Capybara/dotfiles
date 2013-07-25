set nocompatible      " We're running Vim, not Vi!
set autochdir         " Set working directory to the current file
" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
"pathogen is a plugin manager, clone a plugins git repo to .vim/bundles

filetype plugin on

" pass code from tmux pane into another running pry
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

" Make sure iTerm is using solarized colors also
colorscheme solarized "color schemes are located in .vim/colors
set background=dark
call togglebg#map("<F5>")

set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
syntax on       	  " Enable syntaxntax highlighting
filetype on               " Enable filetype detection
filetype indent on        " Enable filetype-specific indenting

" Gundo toggle
 nnoremap <F4> :GundoToggle<CR>

" use blowfish encryption
set cm=blowfish

" Omnicomplete settings
set ofu=syntaxcomplete#Complete

" Makes pasting into vim better
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>
 
" Set region to American English
set spelllang=en_us

" Map <Esc> key to 'j' key presses twice quickly
imap jj <Esc> 

" map vim cheatsheet
map <silent> <leader>x :!qlmanage -p ~/dotfiles/vim_cheat.gif<CR>

" Simplenote plugin credentials
if filereadable("~/.simplenote_vim")
  source ~/.simplenote_vim
endif
" when something is yanked in vim, it goes to my OS X clipboard
"set clipboard=unnamed

"allow switching buffers without writing changes first
set hidden


"====================Ruby related stuff=================================================
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1 
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
