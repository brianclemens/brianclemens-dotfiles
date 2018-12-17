" {{{ Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'airblade/vim-gitgutter'               " show git diffs
    Plug 'majutsushi/tagbar'                    " code browser
    Plug 'junegunn/fzf'                         " search
    Plug 'morhetz/gruvbox'                      " theme
    Plug 'vim-airline/vim-airline'              " status line
    Plug 'w0rp/ale'                             " linting
    Plug 'Yggdroot/indentLine'                  " indentation guides
    Plug 'tomtom/tcomment_vim'                  " comments

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }
"     Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
     Plug 'lervag/vimtex', { 'for': ['latex', 'tex'] }
call plug#end()
" }}}

" {{{ Plugin settings
"   {{{ Airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=0
let g:airline_section_z='%3p%% %3l:%-2v'
let g:airline_focuslost_inactive=1


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

"   {{{ Deoplete and LanguageClient
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

call g:deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)

"" EchoDoc
let g:echodoc#enable_at_startup=1

"" LanguageClient
let g:LanguageClient_serverCommands = {
            \ 'c': ['clangd'],
            \ 'cpp': ['clangd'],
            \ 'css': ['css-languageserver'],
            \ 'html': ['html-languageserver'],
            \ 'go': ['go-langserver'],
            \ 'java': ['jdtls'],
            \ 'lua': ['lua-lsp'],
            \ 'python': ['pyls'],
            \ 'rust': ['rls'],
            \ }

" Automatically start language servers
let g:LanguageClient_autoStart=1

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

nnoremap <silent> <F12> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_rename()<CR>
"   }}}

"   {{{ FZF
" Default key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" Default fzf layout
let g:fzf_layout = { 'down': '~30%' }

" Customize the options used by 'git log'
let g:fzf_commits_log_options='--graph --color=always --format="%c(auto)%h%d %s %c(black)%c(bold)%cr"'

" Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
"imap <leader><tab> <plug>(fzf-maps-i)

"" FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>w :Windows<CR>
nnoremap <leader>t :Tags<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
"   }}}

"   {{{ Gitgutter
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'
"   }}}

"   {{{ Gruvbox
let g:gruvbox_contrast_dark = "hard"    " darker background
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1
"   }}}

"   {{{ Indentline
let g:indentLine_setColors = 0
let g:indentLine_char = '▏'
nnoremap <Leader>i  :IndentLinesToggle<CR>
"   }}}

"   {{{ Jedi
autocmd FileType python setlocal completeopt-=preview
let g:jedi#use_splits_not_buffers = "left"
"   }}}

"   {{{ Tagbar
nmap <silent><Leader>t :TagbarToggle<CR>

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
    \ }
"   }}}

"   {{{ Vimtex
let g:vimtex_view_method='zathura'
"   }}}
" }}}

" {{{ Keybinds

"" Leader key
nnoremap <Space> <Nop>
nnoremap <CR> <Nop>
let mapleader=' '

"" Split navigation
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

"" Split resize
nnoremap <silent> <C-w>h 5<C-w><
nnoremap <silent> <C-w>j 5<C-w>-
nnoremap <silent> <C-w>k 5<C-w>+
nnoremap <silent> <C-w>l 5<C-w>>

"" New tab
nnoremap <silent> <C-w>t :tabedit<CR>

" space clears search highlights and any message displayed
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" move lines up and down with alt + [j,k]
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

" indenting
nnoremap <Tab> >>_          " increase indent with >>
nnoremap <S-Tab> <<_        " decrease indent with <<
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv          " tab to increase indent
vnoremap <S-Tab> <gv        " shift tab to decrease indent

" Copy to system clipboard
nnoremap gy "+y
nnoremap gY "+Y
nnoremap gp "+p
nnoremap gP "+P
xnoremap gy "+y
xnoremap gY "+Y
xnoremap gp "+p
xnoremap gP "+P

" Keep selection after indenting
xnoremap < <gv
xnoremap > >gv

" Swap lines
xnoremap <leader>j :m '>+1<CR>gv=gv
xnoremap <leader>k :m '<-2<CR>gv=gv
nnoremap <leader>j :m .+1<CR>
nnoremap <leader>k :m .-2<CR>

" Use CTRL-S for saving, also in Insert mode
nnoremap <silent> <C-s> :write<CR>
xnoremap <silent> <C-s> <Esc>:write<CR>
inoremap <silent> <C-s> <C-o>:write<CR><Esc>

" Move cursor by display lines when wrapping
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
xnoremap <expr> j v:count ? 'j' : 'gj'
xnoremap <expr> k v:count ? 'k' : 'gk'

" Go to tab
nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-7> 7gt
nnoremap <M-8> 8gt
nnoremap <M-9> :tablast<CR>

" Remove trailing whitespaces
nnoremap <silent> <F3> mz:keepp %s/\\\@1<!\s\+$//e<CR>`z

" Write as sudo
command! W execute 'silent! w !sudo /usr/bin/tee % >/dev/null' <bar> edit!
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
set synmaxcol=800
set showmatch               " highlight matching brackets
set title                   " set window title
set scrolljump=10           " scroll jump lines
set pumheight=20            " popup menu height
set diffopt+=context:3
set nostartofline           " sticky columns when moving cursor


" line numbers
set number                  " show line numbers
set numberwidth=3           " pad number column

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

" colors
" set t_Co=256                " enable 256 colour themes
set termguicolors           " enable 256 colour themes
colorscheme gruvbox         " gruvbox colourscheme
set background=dark         " use dark background
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set cursorline              " highlight current line
set ttyfast                 " improves redrawing for newer computers

augroup LighterCursorLine
    autocmd!
    "autocmd ColorScheme * highlight clear CursorLine
    "autocmd ColorScheme * highlight CursorLine guibg=#32302f
    autocmd ColorScheme * if &background == "dark" | highlight CursorLine guibg=#32302f | else | highlight CursorLine guibg=#f2e5bc | endif
augroup END

augroup BoldCursorLineNr
    autocmd!
    "autocmd ColorScheme * highlight CursorLineNR cterm=bold guibg=#282828
    autocmd ColorScheme * if &background == "dark" | highlight CursorLineNR cterm=bold guibg=#32302f | else | highlight CursorLineNR cterm=bold guibg=#f2e5bc | endif
augroup END

augroup LighterQuickFixLine
    autocmd!
    "autocmd ColorScheme * highlight QuickFixLine ctermbg=Yellow guibg=#504945
    "autocmd ColorScheme * highlight qfFileName guifg=#fe8019
    autocmd ColorScheme * if &background == "dark" | highlight QuickFixLine ctermbg=Yellow guibg=#504945 | else | highlight QuickFixLine ctermbg=Yellow guibg=#d5c4a1 | endif
    autocmd ColorScheme * if &background == "dark" | highlight qfFileName guifg=#fe8019 | else | highlight qfFileName guifg=#af3a03 | endif
augroup END

augroup SearchHighlightColor
    autocmd!
    "autocmd ColorScheme * highlight Search guibg=#282828 guifg=#fe8019
    autocmd ColorScheme * if &background == "dark" | highlight Search guibg=#282828 guifg=#fe8019 | else | highlight Search guibg=#fbf1c7 guifg=#af3a03 | endif
augroup END

augroup RefreshAirline
    autocmd!
    autocmd ColorScheme * if exists(':AirlineRefresh') | :AirlineRefresh | endif
augroup END

augroup SpellBadUnderline
    autocmd!
    autocmd BufEnter,WinEnter * highlight SpellBad gui=underline term=underline cterm=underline
augroup END

if &term !=? 'linux' || has('gui_running')
    set listchars=tab:›\ ,extends:>,precedes:<,nbsp:˷,eol:⤶,trail:~
    set fillchars=vert:│,fold:─,diff:-
    augroup TrailingSpaces
        autocmd!
        autocmd InsertEnter * set listchars-=eol:⤶,trail:~
        autocmd InsertLeave * set listchars+=eol:⤶,trail:~
    augroup END
else
    set listchars=tab:>\ ,extends:>,precedes:<,nbsp:+,eol:$,trail:~
    set fillchars=vert:\|,fold:-,diff:-
    augroup TrailingSpaces
        autocmd!
        autocmd InsertEnter * set listchars-=eol:$,trail:~
        autocmd InsertLeave * set listchars+=eol:$,trail:~
    augroup END
endif
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
