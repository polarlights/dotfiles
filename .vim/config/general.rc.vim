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
set noshowmode
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
