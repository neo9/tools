call plug#begin('~/.vim/plugged')
Plug 'pearofducks/ansible-vim'
Plug 'crusoexia/vim-monokai'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'trevordmiller/nova-vim'
Plug 'joshdick/onedark.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'tpope/vim-fugitive'
Plug 'posva/vim-vue'
Plug 'ronichoudhury/pep8.vim' " pip install pep8
Plug 'davidhalter/jedi-vim' " pip install jedi
Plug 'vim-scripts/bash-support.vim'
Plug 'chr4/nginx.vim'
Plug 'hashivim/vim-terraform'
call plug#end()

"-- MISC --"
""""""""""""

" Mac OS specific delete keyboard issue
set backspace=indent,eol,start

" Bottom bar
set laststatus=2

" Better be safe than sorry
set nocompatible

"-- EDITOR --"
""""""""""""""

" Indentation settings
set tabstop=2
set autoindent
set shiftwidth=2

" space instead of tabs
set expandtab

" Matching braces
set showmatch

" Line numbers
set number

" Smart numbers
set relativenumber

" Load shell aliases and settings
set shell=zsh
" set shellcmdflag=-ic

"-- VISUAL --"
""""""""""""""

syntax enable

" Enable 256 colors. Terminal vim
set t_Co=256

" Theme
silent! colorscheme onedark

" Highlight trailing white space end of line
:highlight ExtraWhiteSpace ctermbg=red guibg=red
call matchadd('ExtraWhiteSpace', '\s\+$')

"-- SEARCH --"
""""""""""""""

" Highlight search. See mappings to disable highlighting when search is done
set hlsearch

" Search parameters
set ignorecase
set smartcase
set incsearch

" Shell search to ignore case sensitivty
set wildignorecase


"-- REMAPPING --"
"""""""""""""""""

" Replace default hjkl with jkl; for better finger position
noremap ; l
noremap l k
noremap k j
noremap j h

"-- MAPPINGS --"
""""""""""""""""

" Override default Leader with the ',' key
let mapleader = ','

" Make it easy to edit Vimrc
nmap <Leader>ev :tabedit $MYVIMRC<cr>
" Make it easy to edit Vimrc
nmap <Leader>ez :tabedit ~/.zshrc<cr>

" Remove search higlight
nmap <Leader><space> :nohlsearch<cr>

" Remove quickfix
nmap <Leader>q :ccl<cr>

" Toggle left tree
nmap <Leader>/ :NERDTreeToggle<cr>

" Search all tags in files
nmap <Leader>t :CtrlPBufTag<cr>

" Show recent files
nmap <Leader>r :CtrlPMRUFiles<cr>

"Close vinegar
nmap <Leader>k :bd<cr>

" Quickly execute shell command
nmap <Leader>s :! 

" Create pdf Markdown
nmap <Leader>m :!pandoc %:p -o /tmp/document.pdf -s -N && zathura /tmp/document.pdf  > /dev/null 2>&1 &<cr>

" Open TODO.md
nmap <Leader>et :tabe ~/TODO.md<cr>

" Save & quit actions
nmap <Leader>w :w<cr>
nmap <Leader>x :x<cr>
noremap <Leader>c :q<cr>
nmap <Leader>fc :q!<cr>

" VimGrep
nmap [q :cprev<cr>
nmap ]q :cnext<cr>
nmap [Q :cfirst<cr>
nmap ]Q :clast<cr>


"-- AUTO COMMANDS --"
"""""""""""""""""""""

" Disable expandtab for Makefile files
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" Automatically source the Vimrc file on save
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

"-- SPLIT MANAGMENT --"
"""""""""""""""""""""""

" Default split position
set splitbelow
set splitright

" Split management with jkl;
nnoremap aj <C-W><C-H>
nnoremap ak <C-W><C-J>
nnoremap al <C-W><C-K>
nnoremap a; <C-W><C-L>

" Rotate / Inverse two window
nnoremap ar <C-W>r
nnoremap aR <C-W>R
" Switch the window into a new tab
nnoremap aT <C-W>T
" Switch the window into a new tab
nnoremap a<Enter> <C-W><Enter>
" Close all but this One
nnoremap ao <C-W>o
" Take all the height
nnoremap a_ <C-W>_
" Take all the width
nnoremap a\| <C-W>\|
" Equal width/height
nnoremap a= <C-W>=

" Switch tabs

nmap <tab> gt
nmap <s-tab> gT

"-- PLUGINS --"
"""""""""""""""

"/
"/ CtrlP
"/

let g:ctrlp_custom_ignore = 'node_modules/DS_Store\|git\|vendor'

let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_working_path_mode = 0
" Prevent file from being opened in nerd tree
let g:ctrlp_cmd = ':NERDTreeClose\|CtrlP'

"/
"/ NerdTree
"/

" Prevent NerdTree from overriding - vinegar shortcut
let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.swp$', '\~$', '.git$[[dir]]']

"/
"/ Vinegar
"/
"
" Hide hidden files by default
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_banner       = 0
let g:netrw_liststyle    = 3
let g:netrw_sort_options = 'i'

"/
"/ Bash
"/

" Configure bash comments
let g:BASH_AuthorName   = 'VICTOR BOISSIERE'
let g:BASH_Email        = 'victor.boissiere@gmail.com'
let g:BASH_Company      = 'GitCommit'

"/
"/ Terraform
"/
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1


"/
"/ Custom filetype
"/

augroup vagrant
	au!
	au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

au BufRead,BufNewFile */etc/nginx/sites-availables/* set ft=nginx
au BufRead,BufNewFile */etc/nginx/conf.d/* set ft=nginx

