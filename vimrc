"   VIM, not Vi
set nocompatible
"   GENERAL 
""  Toggle current fold with space bar
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
""  Use a , for the leader
let mapleader = ","

""  Copy/Paste
"   Vundle "" let Vundle manage Vundle

filetype off                  " required! for Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"" Plugins
Bundle 'gmarik/vundle'
""" original repos on GitHub
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'ervandew/supertab.git'
Bundle 'godlygeek/tabular.git'
Bundle 'itchyny/lightline.vim'
Bundle 'jisaacks/GitGutter.git'
Bundle 'jpalardy/vim-slime.git'
Bundle 'mattn/gist-vim.git'
Bundle 'mattn/webapi-vim.git'
Bundle 'othree/eregex.vim.git'
Bundle 'plasticboy/vim-markdown.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'sjl/gundo.vim.git'
Bundle 'tpope/vim-abolish.git'
Bundle 'tpope/vim-bundler.git'
Bundle 'tpope/vim-dispatch.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'vim-scripts/ScrollColors.git'
Bundle 'vim-scripts/buftabs.git'

filetype plugin indent on     " required! for Vundle

""" Brief help
""" :BundleList          - list configured bundles
""" :BundleInstall(!)    - install (update) bundles
""" :BundleSearch(!) foo - search (or refresh cache first) for foo
""" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"""
""" see :h vundle for more details or wiki for FAQ

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
  set mouse=n
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
filetype plugin indent on

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

""  Gist settings
let g:gist_show_privates = 1
let g:gist_clip_command = 'pbcopy'

""  Pass code from tmux pane into another running pry
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": ".2"}

""  Ultisnips list default, I think supertab was using it
let g:UltiSnipsListSnippets = "<leader><tab>"

""  CtrlP settings
set runtimepath^=~/.vim/bundle/ctrlp.vim

""  Show Buftabs in status
let g:buftabs_in_statusline=1

""  Gundo toggle
nnoremap <F4> :GundoToggle<CR>

""  Simplenote plugin credentials
if filereadable("~/.simplenote_vim")
  source ~/.simplenote_vim
endif

""  Toggle NerdTree file browser with <,> + T
nmap <leader>n :NERDTreeToggle<RETURN>

"   RUBY

""  Set tab prefrences for ruby files

autocmd Filetype ruby set ts=2 sw=2 expandtab
autocmd FileType ruby,eruby let g:rubycomplete_rails=1
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
compiler ruby         " Enablenable compiler support for ruby

""" NOTE: comments after Bundle commands are not allowed.

"" Pry stuff
" Add the pry debug line with \bp (or <Space>bp, if you did: map <Space> <Leader> )
map <Leader>bp orequire'pry';binding.pry<esc>:w<cr>
" Alias for one-handed operation:
map <Leader><Leader>p <Leader>bp
" …also, Insert Mode as bpry<space>
iabbr bpry require'pry';binding.pry

" Keep pry from annoyingly hanging around when using, e.g. pry-rescue/minitest
map <f3> :wa<cr>:call system('kill-pry-rescue')<cr>

" Nab lines from ~/.pry_history (respects "count")
nmap <Leader>pry :<c-u>let pc = (v:count1 ? v:count1 : 1)<cr>:read !tail -<c-r>=pc<cr> ~/.pry_history<cr>:.-<c-r>=pc-1<cr>:norm <c-r>=pc<cr>==<cr>
nmap <Leader>ph <Leader>pry
" ↑ thanks to Houl, ZyX-i, and paradigm of #vim for all dogpiling on this one.

nmap <Leader>rib of = File.open ENV['HOME']+'/ribson', 'w'; set_trace_func -> *args { f.puts [args, args[4].send(:local_variables) ].inspect }<esc>:w<cr>
