" Must be set prior to initializing Vundle
set nocompatible	" be iMproved, required
filetype off		" required

" Vundle
" -------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'
" https://github.com/digitaltoad/vim-pug
"Plugin 'digitaltoad/vim-pug'
" https://github.com/wavded/vim-stylus
"Plugin 'wavded/vim-stylus'
" https://github.com/kchmck/vim-coffee-script
"Plugin 'kchmck/vim-coffee-script'
" https://github.com/Yggdroot/indentLine
Plugin 'Yggdroot/indentLine'
" https://github.com/nathanaelkane/vim-indent-guides
"Plugin 'nathanaelkane/vim-indent-guides'
" https://github.com/jeffkreeftmeijer/vim-numbertoggle
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
" https://github.com/kshenoy/vim-signature
Plugin 'kshenoy/vim-signature'
" https://github.com/jaxbot/semantic-highlight.vim
Plugin 'jaxbot/semantic-highlight.vim'
" https://github.com/vim-scripts/highlight.vim
Plugin 'vim-scripts/highlight.vim'
" https://github.com/Raimondi/delimitMate
Plugin 'Raimondi/delimitMate'
" https://github.com/terryma/vim-expand-region
Plugin 'terryma/vim-expand-region'
" https://github.com/tpope/vim-surround
Plugin 'tpope/vim-surround'
" https://github.com/wikitopian/hardmode
Plugin 'wikitopian/hardmode'
" https://github.com/vim-syntastic/syntastic
Plugin 'vim-syntastic/syntastic'
" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'
" https://github.com/vim-scripts/YankRing.vim
Plugin 'vim-scripts/YankRing.vim'
" https://github.com/justinmk/vim-sneak
Plugin 'justinmk/vim-sneak'
" https://github.com/sheerun/vim-polyglot
Plugin 'sheerun/vim-polyglot'
" https://github.com/scrooloose/nerdcommenter
Plugin 'scrooloose/nerdcommenter'
" https://github.com/christoomey/vim-tmux-navigator
Plugin 'christoomey/vim-tmux-navigator'
" https://github.com/tpope/vim-abolish
Plugin 'tpope/vim-abolish'
" https://github.com/ntpeters/vim-better-whitespace
Plugin 'ntpeters/vim-better-whitespace'
" https://github.com/tyru/open-browser.vim
Plugin 'tyru/open-browser.vim'
" https://github.com/lilydjwg/colorizer
Plugin 'lilydjwg/colorizer'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" http://vimdoc.sourceforge.net/htmldoc/filetype.html
" Sets detection, plugin and indent on?
filetype plugin indent on    " required

" Automatically install bundles on first run
" https://github.com/alexmingoia/dotfiles/blob/master/.vimrc
if !isdirectory(expand("~/.vim/bundle/syntastic"))
	execute "silent PluginInstall"
	execute "silent q"
endif

" This clear the screen completely after vim exits
" https://ubuntuforums.org/showthread.php?t=1684567
set t_te= t_ti=
au VimLeave * :!clear

" Settings
" --------

" delimitMate
" -----------
" delimitMate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last
let delimitMate_expand_cr = 1

" delimitMate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of { x}
let delimitMate_expand_space = 1

" vim-indent-guides
" -----------------
" Set indent guides plugin to start on vim open
let g:indent_guides_enable_on_vim_startup = 1

" http://vimdoc.sourceforge.net/htmldoc/syntax.html
" Syntax highlighting.
syntax on

" Always use unicode
set encoding=utf-8	

" Share the clipboard.
set clipboard=unnamed

" Expand tabs into spaces.
set expandtab

" Set tab to equal 2 spaces.
set tabstop=2

" Set soft tabs equal to 2 spaces.
set softtabstop=2

" Set auto indent spacing.
set shiftwidth=2

" Wrap text.
set wrap

" Show the current mode.
set showmode

" Show matching parenthesis.
set showmatch

" Highlight search patterns.
set hlsearch

" Show line numbers (set nonumber to turn off line numbers)
set number

" Show relative line numbers
set relativenumber

" Need for indent guides
colorscheme default

" https://tlattimore.com/blog/highlight-the-current-line-in-vim/
" Highlight the current line
set cursorline
" Set cursorline colors
highlight CursorLine ctermbg=234
" Set color of number column on cursorline
highlight CursorLineNR ctermbg=234 ctermfg=white

" Show the cursor position.
set ruler

" Fix backspace.
set backspace=indent,eol,start

" Size of command history. 
set history=1000 

" Number of under levels
set undolevels=1000 

" Allow undoing a reload from disk.
set undoreload=1000 

" Change the terminal's title
set title 

" Show visual cue on error messages
set visualbell 

" Don't ring on error messages
set noerrorbells 

" Turn off the arrow keys in vim.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

function! TmuxMove(direction)
        let wnr = winnr()
        silent! execute 'wincmd ' . a:direction
        " If the winnr is still the same after we moved, it is the last pane
        if wnr == winnr()
                call system('tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR'))
        end
endfunction

nnoremap <silent> <c-h> :call TmuxMove('h')<cr>
nnoremap <silent> <c-j> :call TmuxMove('j')<cr>
nnoremap <silent> <c-k> :call TmuxMove('k')<cr>
nnoremap <silent> <c-l> :call TmuxMove('l')<cr>

" Set ;; to go to command mode from insert mode
inoremap ;; <Esc>

" If you type w!! in command mode, it will give sudo powers
cmap w!! w !sudo tee % >/dev/null

" Set the leader key to space
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" Toggle paste.
nnoremap <Leader>t :set invpaste paste?<CR>
set pastetoggle=<Leader>t

" Leader+h toggles search highlighting.
nnoremap <Leader>h :set hlsearch!<CR>

" Leader+s toggles semantic highlighting
nnoremap <Leader>s :SemanticHighlightToggle<cr>

" Surround word with single or double quotes with leader key and ' or "
map <Leader>' ysiw'
vmap <leader>' c'<C-R>"'<ESC>
map <Leader>" ysiw"
vmap <leader>" c"<C-R>""<ESC>

" Add semicolon to end of line with leader+; 
map <Leader>; g_a;<Esc>

" Set leader+o in command mode to open a new file
nnoremap <Leader>o :CtrlP<CR>

" Set leader+w in command mode to save file
nnoremap <Leader>w :w<CR>

set clipboard=unnamed
" Set leader+y and leader+p for copy and pasting to/from clipboard
nmap <Leader>y "+yy
nmap <Leader>d "+dd
vmap <Leader>y "+yy
vmap <Leader>d "+dd
nmap <Leader>p "+pp
nmap <Leader>P "+PP
vmap <Leader>p "+pp
vmap <Leader>P "+PP

" Expand region settings maybe?
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Toggle NERDtree browser with leader+b
nmap <Leader>b :NERDTreeToggle<CR>

" GundoToggle set to F5
nnoremap <F5> :GundoToggle<CR>

" Set leader+v to enter visual mode
nmap <Leader>v v
" Set leader+l to enter visual line mode
nmap <Leader>l V

" Powerline 
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
let g:Powerline_symbols = 'fancy'

" Always show status line
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colors)
set t_Co=256
