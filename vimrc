"   VIM, not Vi
set nocompatible
"   PATHOGEN is a plugin manager, clone a plugins git repo to .vim/bundles
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
"   GENERAL 

""  Toggle current fold with space bar
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
""  Use a , for the leader
let mapleader = ","

""  Copy/Paste

""" When something is yanked in vim, it goes to my OS X clipboard
set clipboard=unnamed

""  Buffers

""" Allow switching buffers without writing changes first
set hidden

""" Buffer maps
noremap <C-k> :bprev<CR>
noremap <C-j> :bnext<CR>

""  Design/Colorscheme

""" Show line numbers
set number

""" Toggle crosshairs
nnoremap <Leader>cr :set cursorline! cursorcolumn!<CR>

""" Enable syntaxntax highlighting
syntax on

""" Highlight as you type your search.
set incsearch

""" Make sure iTerm is using solarized colors also
colorscheme solarized "color schemes are located in .vim/colors
set background=dark
call togglebg#map("<F5>")

""" Status bar
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

""" Set working directory to the current file
set autochdir

""  Use mouse to scroll and select in all modes
if has('mouse')
  set mouse=a
endif

""  Don't use a swapfile
set noswapfile

""  If you're bothered by the extra spaces after sentences (lines ending in !, ?, or .), turn off joinspaces
set nojoinspaces

""  Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

""  Open vimrc in new tab with ,v
nmap <leader>v :tabedit $MYVIMRC<CR>

""  Make searches case-insensitive.
set ignorecase

""  Filetype

""  Load filetype plugins
filetype plugin on

autocmd Filetype vim setlocal foldcolumn=3
autocmd Filetype vim setlocal foldexpr=VimrcFolds()
autocmd Filetype vim setlocal foldlevel=2

""" Enable filetype detection
filetype on

""" Enable filetype-specific indenting
filetype indent on

""  Use blowfish encryption
set cm=blowfish

""  Omnicomplete settings
set ofu=syntaxcomplete#Complete

"" Have context to cursor position
set scrolloff=5

""  Makes pasting into vim better
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

""  Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

""  Set region to American English
set spelllang=en_us

""  Map <Esc> key to 'j' key presses twice quickly
imap jj <Esc>

""  Map vim cheatsheet
map <silent> <leader>x :!qlmanage -p ~/dotfiles/vim_cheat.gif<CR>

"   PLUGIN STUFF

""  Gist settings
let g:gist_show_privates = 1
let g:gist_clip_command = 'pbcopy'

""  Pass code from tmux pane into another running pry
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": ".2"}

""  Ultisnips list default, I think supertab was using it
let g:UltiSnipsListSnippets = "<leader><tab>"

""  Show Buftabs in status
let g:buftabs_in_statusline=1

""  Gundo toggle
nnoremap <F4> :GundoToggle<CR>

""  Simplenote plugin credentials
if filereadable("~/.simplenote_vim")
  source ~/.simplenote_vim
endif

""  Toggle NerdTree file browser with <,> + T
nmap <leader>t :NERDTreeToggle<RETURN>

"   RUBY

""  Set tab prefrences for ruby files
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2
autocmd FileType ruby,eruby let g:rubycomplete_rails=1
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
compiler ruby         " Enablenable compiler support for ruby
