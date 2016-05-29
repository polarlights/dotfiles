" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --tern-completer
  endif
endfunction


"Setup Plugin Support{
call plug#begin('~/.vim/plugged')
"}

" ================================= Plugins ==================================
"Color
Plug 'altercation/vim-colors-solarized'

"Lang
Plug 'tpope/vim-rails', { 'for': ['ruby', 'haml'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'scss', 'sass', 'eruby'] }
Plug 'ap/vim-css-color'
Plug 'vim-scripts/jsbeautify', { 'for': ['javascript', 'coffee'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'coffee'] }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Lokaltog/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'tpope/vim-endwise'
Plug 'tmhedberg/matchit'

Plug 'eparreno/vim-l9'
Plug 'othree/vim-autocomplpop'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim'

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle'] }
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'benekastah/neomake', { 'on': ['Neomake'] }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
"}

"Vim powerline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Add plugins to &runtimepath
call plug#end()

" ================================= Vim Functions ==================================

" ================================= Vim Configration ==================================
"set dictionary+=/usr/local/share/dict/words
set backspace=indent,eol,start  " backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                          " Line numbers on
set showmatch                   " show matching brackets/parenthesis
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set winminheight=0              " windows can be 0 line high
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
"folding settings
set foldmethod=indent
set foldenable
set foldlevel=1
set foldlevelstart=99
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠
set nobackup                    "don't create backup file
set noswapfile                  "set no swap file
set fileformat=unix             "set file format
set shortmess=atI               "set don't show the hint at startup
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
set visualbell                   "no sounds
set autoread                     "reload files changed outside
set showmode                     "display the current mode
set cursorline                   "highlight current line
set hidden                       "buffers can exist in the background
set nowrap                      " do not wrap long lines
set linebreak                   "wrap lines at convenient points
set autoindent                  " indent at the same level of the previous line
set smartindent
set shiftwidth=2                " use indents of 2 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=2                   " an indentation every four columns
set softtabstop=2               " let backspace delete indent
set smarttab                    "insert tabs on the start of a line according to shiftwidth, not tabstop"
set wildignore+=*/tmp/*,*.so*,*.swp,*.zip,._*,*DS_Store*,log/**,*.png,*.jpg,*.gif "MacOSX or Linux
syntax on                       "syntax highlighting
"set matchpairs+=<:>                " match, to be used with %

filetype plugin indent on       "Automatically detect file types
set mouse=a                     "enable mouse usage
scriptencoding utf-8
set shortmess+=filmnrxoOtT      "abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=onemore         "allow for cursor beyond last character
if has('gui_running')
 set guioptions-=T             " remove the toolbar
 set lines=40                  " 40 lines of text instead of 24,
 set guifont=Monoca\ for\ Powerline:h19
 if has('gui_macvim')
   set transparency=5          " Make the window slightly transparent
 endif
endif

set tags+=tags             "set tags
set tags+=~/.rvm/gems/tags

" ================================= Vim Theme ==================================
syntax enable                   "syntax highlighting
set background=dark             "Color theme
colorscheme solarized           "railscasts solarized

" ================================= Status Line ==================================
"let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

if has('cmdline_info')
  set ruler                   " show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
  set showcmd                 " show partial commands in status line and
endif

" if has('statusline')
"   set laststatus=2

"   " Broken down into easily includeable segments
"   set statusline=%<%f\    " Filename
"   set statusline+=%w%h%m%r " Options
"   set statusline+=%{fugitive#statusline()} "  Git Hotness
"   set statusline+=\ [%{&ff}/%Y]            " filetype
"   set statusline+=\ [%{getcwd()}]          " current dir
"   set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
" endif

set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
" }

" ================================= Key Mappings ==================================
"The default leader is '\', but many people prefer ',' as it's in a standard location
let mapleader = ','
" ctrl + a
noremap <C-A> ggVG
inoremap <C-A> <C-O>ggVG
" ctrl + s
imap <C-s> <esc>:w<CR>:echo expand("%f") . " saved."<CR>
vmap <C-s> <esc>:w<CR>:echo expand("%f") . " saved."<CR>
nmap <C-s> :w<CR>:echo expand("%f") . " saved."<CR>
" Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :
set clipboard=unnamed
" Easier moving in tabs and windows
if has('nvim')
  nmap <BS> <C-W>h
endif
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

map <Leader>rt :!ctags --extra=+f  --exclude=.git --exclude=log -R * `pwd`/*<CR><CR>
imap jj <Esc>           "set ESC map

autocmd FileType html,css,eruby EmmetInstall
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd BufNewFile,BufRead *.scss set ft=css
autocmd BufNewFile,BufRead *.rabl set ft=ruby
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" 使用方向键切换buffer
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" y$ -> Y Make Y behave like other capitals
map Y y$

" tab切换
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Quickly save the current file
nnoremap <leader>w :w<CR>

" When jump to next match also center screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Start substitute on current word under the cursor
nnoremap ,s :%s///gc<Left><Left><Left>

" Start search on current word under the cursor
nnoremap ,/ /<CR>

" Start reverse search on current word under the cursor
nnoremap ,? ?<CR>

" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

" ================================= Plugs Configration ==================================
" ********************************* Ctrlp ********************************
" let g:ctrlp_map = '<C-p>'
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_root_markers = ['.git','Gemfile','.vimrc','.bashrc', '.zshrc']
" let g:ctrlp_custom_ignore = {
      " \'dir':  '\v[\/](\.(git|hg|svn)|node_modules|bower_components)$',
      " \'file': '\v\.(exe|so|dll)$'
      " \ }


" ********************************* Fugitive ********************************
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>


" ********************************* Nerd Commenter ********************************
let NERDSpaceDelims = 1

" ********************************* Emmet ********************************
let g:user_emmet_expandabbr_key = '<leader>e'
let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0


" ********************************* NerdTree ********************************
nnoremap <leader>t :NERDTreeToggle<cr>
autocmd VimEnter * NERDTree | wincmd p
"autocmd vimenter * if !argc() | NERDTree | endif "Open nerdtree when no files specific"
let NERDTreeChDirMode = 2
let NERDTreeIgnore=['\.vim$', '\~$', '\.git', '.jpg', '.png', '.gif', 'node_modules$', 'bower_components$']
let g:nerdtree_tabs_open_on_gui_startup = 0
let NERDTreeWinSize = 30
let NERDTreeQuitOnOpen = 1

"snipMat
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby, rails'

" *********************************** EasyMotion *******************************
let g:EasyMotion_use_upper = 1 " Use uppercase target labels and type as a lower case
let g:EasyMotion_smartcase = 1 " type `l` and match `l`&`L`
let g:EasyMotion_use_smartsign_us = 1 " Smartsign (type `3` and match `3`&`#`)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" *********************************** Syntastic *******************************
" *********************************** NeoMake *******************************
autocmd! BufWritePost * Neomake
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']


" *********************************** Ultisnips *******************************
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" *********************************** Javascript-vim *******************************
let g:javascript_enable_domhtmlcss = 1

" *********************************** AutoComplPop *******************************
let g:acp_enableAtStartup = 1
let g:acp_mappingDriven = 0

" *********************************** Vim Instant Markdown *******************************
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
map <Leader>m :InstantMarkdownPreview<CR>
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" *********************************** Vim Ag *******************************
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>


" *********************************** Vim Easy Align *******************************
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimeters')
  let g:easy_align_delimeters = {}
endif
let g:easy_align_delimeters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }


" *********************************** Unite.Vim *******************************
" Unite
let g:unite_source_history_yank_enable = 1

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
" Like ctrlp.vim settings.
call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'winheight': 10,
\   'direction': 'botright',
\   'ignore_case': 1,
\ })

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" Using ag as recursive command.
let g:unite_source_rec_async_command =
      \ ['ag', '--follow', '--nocolor', '--nogroup',
      \  '--hidden', '-g', '']

" Use ag in unite grep source.
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
      \ '-i --vimgrep --hidden --ignore --nocolor --nogroup
      \ ''bower_components'' --ignore ''.svn'' --ignore ''.git'' --ignore ''node_modules'''
let g:unite_source_grep_recursive_opt = ''

nnoremap <C-p> :<C-u>UniteWithProjectDir -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer -quick-match buffer<cr>
nnoremap <silent> <leader>g :<C-u>UniteWithProjectDir grep:.<CR>
nnoremap <silent> <Leader>o :<C-u>UniteWithProjectDir file<CR>

let g:deoplete#omni#input_patterns = {}
		let g:deoplete#omni#input_patterns.ruby =
		\ ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']


" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
