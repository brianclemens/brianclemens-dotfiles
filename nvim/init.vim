" {{{ Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'airblade/vim-gitgutter'               " show git diffs
"   Plug 'fatih/vim-go'                         " golang plugin
"   Plug 'majutsushi/tagbar'                    " code browser
    Plug '/usr/bin/fzf'                         " file search
    Plug 'morhetz/gruvbox'                      " theme
"   Plug 'scrooloose/nerdtree'                  " file browser
    Plug 'vim-airline/vim-airline'              " status line
    Plug 'w0rp/ale'                             " linting
    Plug 'Yggdroot/indentLine'                  " indentation guides

    " completion plugins
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"   Plug 'zchee/deoplete-go', { 'do': 'make' }      " golang
"   Plug 'zchee/deoplete-jedi'                      " python
    Plug 'zchee/deoplete-zsh'                       " zsh
call plug#end()
" }}}

" {{{ Plugin Settings
"   {{{ Airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=0
let g:airline_section_z='%3p%% %3l:%-2v'

" Symbols table
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

" Unicode symbols
let g:airline_left_alt_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_alt_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" Powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

""" Extensions
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = ''
let g:airline#extensions#ale#warning_symbol = ''
let g:airline#extensions#ale#show_line_numbers = 0

let g:airline#extensions#hunks#enabled = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnamemod = ':~:.'
let g:airline#extensions#tabline#buffers_label = 'buffers'
let g:airline#extensions#tabline#tabs_label = 'tabs'
let g:airline#extensions#tabline#overflow_marker = '…'

let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#whitespace#mixed_indent_algo=1
"   }}}

"   {{{ Ale
let g:ale_set_loclist=1
let g:ale_sign_error=' ●'
let g:ale_sign_warning=' ●'
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=1
let g:ale_lint_on_save=1
let g:ale_lint_on_filetype_changed=1
let g:ale_set_highlights=1
let g:ale_set_signs=1

nmap [w <plug>(ale_previous_wrap)
nmap ]w <plug>(ale_next_wrap)
nnoremap <leader>a :ALEEnable<CR>

augroup Ale
    autocmd!
    autocmd VimEnter * ALEDisable
augroup END
"   }}}

"   {{{ Gruvbox
let g:gruvbox_contrast_dark = "hard"    " darker background
let g:gruvbox_italic = 1                " italic have to be manually enabled
"   }}}

"   {{{ Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
"   }}}

"   {{{ GitGutter
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'
"   }}}

"   {{{ IndentLine
let g:indentLine_setColors = 0
let g:indentLine_char = '▏'
"   }}}

"   {{{ Jedi
autocmd FileType python setlocal completeopt-=preview
let g:jedi#use_splits_not_buffers = "left"
"   }}}

"   {{{ NERDTree
nmap <silent><Leader>t :NERDTreeToggle<CR> " open NERDTree with \t
"   }}}
" }}}

" {{{ Behavior
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,latin1
set nocompatible    " avoid legacy compatibility nonsense
set path=$PWD/**    " use path vim is opened in as base directory

" menu completion options
set wildmenu        " enhanced command line completion
set wildignorecase  " ignore case on ex-mode completion
set wildmode=list:longest,full " complete longest match, list others
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.jpeg,*.png,*.xpm,*.gif

" search options
set hlsearch        " highlight search
set incsearch       " highlight search results as the search is typed
set magic           " set magic on, for regular expressions
set ignorecase      " searches are not case-sensitive
set smartcase       " case sensitive search if search contains capitals

nnoremap <silent> n n:call BlinkNextMatch()<CR>
nnoremap <silent> N N:call BlinkNextMatch()<CR>

function! BlinkNextMatch() abort
  highlight JustMatched ctermfg=white ctermbg=magenta cterm=bold

  let pat = '\c\%#' . @/
  let id = matchadd('JustMatched', pat)
  redraw

  exec 'sleep 150m'
  call matchdelete(id)
  redraw
endfunction

set autoread        " automatically refresh pane when file is changed externally
set backspace=indent,eol,start " allow backspacing over auto indent and SoI
set display+=lastline   " always display the last line of the screen
set whichwrap+=<,>,h,l  " allow cursor to wrap lines
set wrap            " soft wrap all files
set confirm         " ask to confirm instead of failing
set linebreak       " keep words whole when wrapping
set scrolloff=2     " start scrolling a few lines from the border
set visualbell      " use colour blink instead of sound
set encoding=utf8   " use utf8 as internal encoding
set hidden          " allow opening new buffers without saving changes
set mouse=a         " allow mouse control in all modes
set lazyredraw      " don't redraw the screen while executing macros

" undo and backup
set noswapfile      " plenty of RAM, do not need swap
set nobackup        " remembering to save often
set nowritebackup   " is the best kind of backup
set undolevels=1000 " undo history to keep

" panes
set splitbelow      " open new panes on the bottom
set splitright      " open new panes on the right
" }}}

" {{{ Interface
syntax on                   " enable syntax highlighting
set showmatch               " highlight matching brackets
set title                   " set window title
set scrolljump=10           " scroll jump lines
set pumheight=20            " popup menu height
set diffopt+=context:3
set nostartofline           " sticky columns when moving cursor


" line numbers
set number                  " show line numbers
set numberwidth=3           " pad number column
" set colorcolumn=81          " highlight 81st column
" uncomment to highlight all columns beyond the 80th
" execute "set colorcolumn=" . join(range(81,335), ',')

" status line
set showcmd                 " show command in statusline
set ruler                   " show line and cursor position
" set laststatus=2            " wider status line for airline
set noshowmode              " hide the default mode text
set nomodeline              " hide the default mode line
set shortmess=atToOI        " avoid prompts caused by the file messages
set updatetime=1500         " status line refresh time

" whitespace
set listchars=tab:>-,trail:·        " show tabs and trailing space
set list                            " enable the above settings
autocmd BufWritePre * :%s/\s\+$//e  " auto remove trailing whitespace

" colours
" set t_Co=256                " enable 256 colour themes
set termguicolors           " enable 256 colour themes
colorscheme gruvbox         " gruvbox colourscheme
set background=dark         " use dark background
" hi Normal ctermbg=none    " transparent background

set cursorline              " highlight current line
set ttyfast                 " improves redrawing for newer computers
" }}}

" {{{ Formatting
set tabstop=4               " width of tab character
set softtabstop=4           " how many columns the tab key inserts
set shiftwidth=4            " width of indentation levels
set expandtab               " expand tabs into spaces
set smartindent             " smart autoindenting
filetype plugin indent on   " determine indentation rules by filetype

" folding
set foldenable
set foldmethod=marker
set foldlevel=0
set foldcolumn=0
" }}}
