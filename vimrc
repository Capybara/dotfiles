set nocompatible      " We're running Vim, not Vi!
set autochdir         " Set working directory to the current file
" Pathogen
" pathogen is a plugin manager, clone a plugins git repo to .vim/bundles
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype plugin on

if has('mouse')
  set mouse=a
endif
set noswapfile
set nojoinspaces

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

" Gist settings
let g:gist_show_privates = 1
let g:gist_clip_command = 'pbcopy'

" pass code from tmux pane into another running pry
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

" changed default, I think supertab was using it
let g:UltiSnipsListSnippets = "<leader><tab>"

" buff tabs
:noremap <C-k> :bprev<CR>
:noremap <C-j> :bnext<CR> 
set laststatus=2
:let g:buftabs_in_statusline=1

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
nmap <silent> <leader>s :set spell!<CR>
 
" Set region to American English
set spelllang=en_us

" Map <Esc> key to 'j' key presses twice quickly
imap jj <Esc> 

" map vim cheatsheet
map <silent> <leader>x :!qlmanage -p ~/dotfiles/vim_cheat.gif<CR>
" Simplenote plugin credentials
source ~/.simplenote_vim

" when something is yanked in vim, it goes to my OS X clipboard
set clipboard=unnamed

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

"toggle NerdTree file browser with <,> + T
nmap <leader>t :NERDTreeToggle<RETURN>

"Show line numbers
set number 
hi CursorLine   cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235

"toggle crosshairs
nnoremap <Leader>cr :set cursorline! cursorcolumn!<CR>
