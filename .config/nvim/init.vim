" {{{ Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'junegunn/fzf'

    " Autocompletion
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'paretje/deoplete-notmuch', {'for': 'mail'}
    " Plug 'ncm2/float-preview.nvim'

    " Version control
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    " Interface
    Plug 'morhetz/gruvbox'
    Plug 'Yggdroot/indentLine'
    Plug 'vim-airline/vim-airline', { 'tag': '*' }
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Language comprehension
    Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
    Plug 'majutsushi/tagbar'
    Plug 'w0rp/ale'
    Plug 'tomtom/tcomment_vim'
    Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }
call plug#end()
" }}}

" {{{ Plugin settings
"   {{{ Airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1
let g:airline_focuslost_inactive=1

" Simplify location section
let g:airline_section_z='%3p%% %3l:%-2v'

" Symbols table
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '|'

""" Extensions
let g:airline_extensions = ['ale', 'branch', 'fugitiveline', 'languageclient', 'quickfix', 'tabline', 'tagbar', 'term', 'whitespace', 'wordcount']

let g:airline#extensions#ale#error_symbol = '✘'
let g:airline#extensions#ale#warning_symbol = '✘'
let g:airline#extensions#ale#show_line_numbers = 0

"let g:airline#extensions#tagbar#flags = 's'

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

"   {{{ ALE
" Clean up files on save
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier'],
\   'graphql': ['prettier'],
\   'html': ['prettier'],
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'less': ['prettier'],
\   'markdown': ['prettier'],
\   'python': ['yapf'],
\   'scss': ['prettier'],
\   'typescript': ['prettier'],
\   'view': ['prettier'],
\   'yaml': ['prettier'],
\}

" Lint files on save and newline
let g:ale_lint_on_save=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_filetype_changed=1
let g:ale_lint_on_text_changed='never'

" Only run specified linters
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'asciidoc': ['vale'],
\   'bash': ['shellcheck'],
\   'javascript': ['eslint'],
\   'latex': ['vale'],
\   'mail': ['vale'],
\   'markdown': ['vale'],
\   'python': ['pyls'],
\   'sh': ['shellcheck'],
\   'text': ['vale'],
\   'vim': ['vint'],
\   'yaml': ['yamllint'],
\   'zsh': ['shellcheck'],
\}

" Do not lint or fix minified files.
let g:ale_pattern_options_enabled = 1
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}

" Show linting results
let g:ale_set_signs=1
let g:ale_set_highlights=1
let g:ale_sign_error=' ✘'
let g:ale_sign_warning=' ✘'
" let g:ale_sign_warning=' ⚠'

" Completion is handled by LanguageClient-neovim
let g:ale_completion_enabled = 0

let g:ale_set_loclist=1
nmap [w <plug>(ale_previous_wrap)
nmap ]w <plug>(ale_next_wrap)
nnoremap <leader>a :ALEToggle<CR>
"   }}}

"   {{{ ansible-vim
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1
let g:ansible_unindent_after_newline = 1
"   }}}

"   {{{ Deoplete and LanguageClient
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" let g:deoplete#sources#notmuch#command = ['notmuch', 'address', '--format=sexp', '--output=recipients', '--deduplicate=address', 'tag:sent']

call deoplete#custom#source('emoji', 'filetypes', ['mail', 'markdown', 'rst'])
call deoplete#custom#source('emoji', 'converters', ['converter_emoji'])

call g:deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 1)

" EchoDoc
let g:echodoc#enable_at_startup=1

" LanguageClient
let g:LanguageClient_serverCommands = {
            \ 'bash': ['bash-language-server', 'start'],
            \ 'c': ['clangd'],
            \ 'cpp': ['clangd'],
            \ 'css': ['css-languageserver', '--stdio'],
            \ 'html': ['html-languageserver', '--stdio'],
            \ 'go': ['go-langserver'],
            \ 'java': ['jdtls'],
            \ 'javascript': ['javascript-typescript-stdio'],
            \ 'json': ['json-languageserver', '--stdio'],
            \ 'lua': ['lua-lsp'],
            \ 'python': ['pyls'],
            \ 'rust': ['rls'],
            \ 'sh': ['bash-language-server', 'start'],
            \ 'zsh': ['bash-language-server', 'start'],
            \ }

" Automatically start language servers
let g:LanguageClient_autoStart=1
let g:LanguageClient_useVirtualText=0

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=auto
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

nnoremap <silent> L :call LanguageClient_contextMenu()<CR>
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

"   {{{ Goyo
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nmap <Leader>g :Goyo<CR>
xmap <Leader>g :Goyo<CR>
"   }}}

"   {{{ Gruvbox
" let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1
"   }}}

"   {{{ Indentline
let g:indentLine_enabled = 0
let g:indentLine_setColors = 0
let g:indentLine_char = '┊'
nnoremap <Leader>i  :IndentLinesToggle<CR>
"   }}}

"   {{{ Limelight
let g:limelight_conceal_ctermfg = 243

nmap <Leader>l :Limelight!!<CR>
xmap <Leader>l :Limelight!!<CR>
"   }}}

"   {{{ Neosnippet
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
" " For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif
"   }}}

"   {{{ Tagbar
nmap <silent><Leader>t :TagbarToggle<CR>

let g:tagbar_type_yaml = {
    \ 'ctagstype' : 'AnsiblePlaybook',
    \ 'kinds' : [
        \ 'p:play'
    \ ],
    \ 'sort' : 0
\ }

" For use with gotags https://github.com/jstemmer/gotags
" let g:tagbar_type_go = {
"     \ 'ctagstype' : 'go',
"     \ 'kinds'     : [
"         \ 'p:package',
"         \ 'i:imports:1',
"         \ 'c:constants',
"         \ 'v:variables',
"         \ 't:types',
"         \ 'n:interfaces',
"         \ 'w:fields',
"         \ 'e:embedded',
"         \ 'm:methods',
"         \ 'r:constructor',
"         \ 'f:functions'
"     \ ],
"     \ 'sro' : '.',
"     \ 'kind2scope' : {
"         \ 't' : 'ctype',
"         \ 'n' : 'ntype'
"     \ },
"     \ 'scope2kind' : {
"         \ 'ctype' : 't',
"         \ 'ntype' : 'n'
"     \ },
"     \ 'ctagsbin'  : 'gotags',
"     \ 'ctagsargs' : '-sort -silent'
"     \ }
"   }}}

"   {{{ Ultisnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:UltiSnipsEditSplit='vertical'
let g:snips_author='Brian Clemens'
let g:snips_email='brian@tiuxo.com'
let g:snips_github='brianclemens'
"   }}}

"   {{{ Vimtex
let g:vimtex_view_method='zathura'
"   }}}
" }}}

" {{{ Keybinds

"" Leader key
nnoremap <Space> <Nop>
nnoremap <CR> <Nop>
let g:mapleader=' '

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
set path=$PWD/**    " Use path vim is opened in as base directory

" Menu completion options
set wildmenu        " Enhanced command line completion
set wildignorecase  " Ignore case on ex-mode completion
set wildmode=list:longest,full " Complete longest match, list others
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.jpeg,*.png,*.xpm,*.gif

" Search options
set hlsearch        " Highlight search
set incsearch       " Highlight search results as the search is typed
set magic           " Set magic on, for regular expressions
set ignorecase      " Searches are not case-sensitive
set smartcase       " Case sensitive search if search contains capitals

" Highlight selected search matches for a moment
nnoremap <silent> n n:call BlinkNextMatch()<CR>
nnoremap <silent> N N:call BlinkNextMatch()<CR>

function! BlinkNextMatch() abort
  highlight JustMatched ctermfg=white ctermbg=magenta cterm=bold
  let l:pat = '\c\%#' . @/
  let l:id = matchadd('JustMatched', l:pat)
  redraw
  exec 'sleep 150m'
  call matchdelete(l:id)
  redraw
endfunction

set autoread        " Refresh pane when file is changed externally
set backspace=indent,eol,start " Allow backspacing over auto indent and SoI
set display+=lastline   " Always display the last line of the screen
set whichwrap+=<,>,h,l  " Allow cursor to wrap lines
set wrap            " Soft wrap all files
set confirm         " Ask to confirm instead of failing
set linebreak       " Keep words whole when wrapping
set scrolloff=2     " Start scrolling a few lines from the border
set visualbell      " Use colour blink instead of sound
set encoding=utf8   " Use utf-8 as internal encoding
scriptencoding utf-8
set hidden          " Allow opening new buffers without saving changes
set mouse=a         " Allow mouse control in all modes
set lazyredraw      " Don't redraw the screen while executing macros

" Undo and backup
set noswapfile      " Swap is not necessary
set nobackup        " Don't litter backup files everywhere
set nowritebackup
set undolevels=1000 " Undo history to keep

" Open new panes on the bottom right
set splitbelow
set splitright
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
set laststatus=2            " wider status line for airline
set noshowmode              " hide the default mode text
set shortmess=atToOI        " avoid prompts caused by the file messages
set updatetime=1500         " status line refresh time

" whitespace
set listchars=tab:>-,trail:·        " show tabs and trailing space
set list                            " enable the above settings

" colors
set t_Co=256                " enable 256 colour themes
" set termguicolors           " enable 256 colour themes
colorscheme gruvbox         " gruvbox colourscheme
set background=dark         " use dark background
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
"  set cursorline              " highlight current line
set ttyfast                 " improves redrawing for newer computers

" augroup LighterCursorLine
"     autocmd!
"     "autocmd ColorScheme * highlight clear CursorLine
"     "autocmd ColorScheme * highlight CursorLine guibg=#32302f
"     autocmd ColorScheme * if &background == "dark" | highlight CursorLine guibg=#32302f | else | highlight CursorLine guibg=#f2e5bc | endif
" augroup END

" augroup BoldCursorLineNr
"     autocmd!
"     "autocmd ColorScheme * highlight CursorLineNR cterm=bold guibg=#282828
"     autocmd ColorScheme * if &background == "dark" | highlight CursorLineNR cterm=bold guibg=#32302f | else | highlight CursorLineNR cterm=bold guibg=#f2e5bc | endif
" augroup END

" augroup LighterQuickFixLine
"     autocmd!
"     "autocmd ColorScheme * highlight QuickFixLine ctermbg=Yellow guibg=#504945
"     "autocmd ColorScheme * highlight qfFileName guifg=#fe8019
"     autocmd ColorScheme * if &background == "dark" | highlight QuickFixLine ctermbg=Yellow guibg=#504945 | else | highlight QuickFixLine ctermbg=Yellow guibg=#d5c4a1 | endif
"     autocmd ColorScheme * if &background == "dark" | highlight qfFileName guifg=#fe8019 | else | highlight qfFileName guifg=#af3a03 | endif
" augroup END

" augroup SearchHighlightColor
"     autocmd!
"     "autocmd ColorScheme * highlight Search guibg=#282828 guifg=#fe8019
"     autocmd ColorScheme * if &background == "dark" | highlight Search guibg=#282828 guifg=#fe8019 | else | highlight Search guibg=#fbf1c7 guifg=#af3a03 | endif
" augroup END

augroup RefreshAirline
    autocmd!
    autocmd ColorScheme * if exists(':AirlineRefresh') | :AirlineRefresh | endif
augroup END

augroup SpellBadUnderline
    autocmd!
    autocmd BufEnter,WinEnter * highlight SpellBad gui=underline term=underline cterm=underline ctermfg=red
augroup END

if &term !=? 'linux' || has('gui_running')
    set listchars=tab:›\ ,extends:>,precedes:<,nbsp:˷,eol:$,trail:·
    set fillchars=vert:│,fold:─,diff:-
    augroup TrailingSpaces
        autocmd!
        autocmd InsertEnter * set listchars-=eol:$,trail:·
        autocmd InsertLeave * set listchars+=eol:$,trail:·
    augroup END
else
    set listchars=tab:>\ ,extends:>,precedes:<,nbsp:+,eol:$,trail:·
    set fillchars=vert:\|,fold:-,diff:-
    augroup TrailingSpaces
        autocmd!
        autocmd InsertEnter * set listchars-=eol:$,trail:·
        autocmd InsertLeave * set listchars+=eol:$,trail:·
    augroup END
endif
" }}}

" {{{ Formatting
set modeline                " respect file modelines
set tabstop=4               " width of tab character
set softtabstop=4           " how many columns the tab key inserts
set shiftwidth=4            " width of indentation levels
set expandtab               " expand tabs into spaces
set smartindent             " smart autoindenting
filetype plugin indent on   " determine indentation rules by filetype
" }}}

" {{{ Folding
    " Enable folding
    set foldenable

    " Fold on special marker
    set foldmethod=marker

    " No automatic unfolding
    set foldlevel=0

    " No fold indicator in status columns
    set foldcolumn=0
" }}}
