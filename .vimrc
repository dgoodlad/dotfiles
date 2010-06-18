" This isn't 1980, we don't need to act like plain 'vi'
set nocompatible

" Use zsh instead of sh
set shell=/bin/zsh

syntax on
filetype on
filetype indent on
filetype plugin on

"compiler ruby
"let g:rubycomplete_rails = 1

" Use git for Ctrl-D diff highlighting
let g:SCMDiffCommand = 'git'

" Automatic indentation
set autoindent
set smartindent

" Setup automatic text formatting/wrapping:
set formatoptions=
set formatoptions-=t " Don't autowrap text
set formatoptions+=c " Do autowrap comments
set formatoptions+=r " Automatically continue comments
set formatoptions+=o " Automatically continue comments when hitting 'o' or 'O'
set formatoptions+=q " Allow formatting of comments with 'gq'
set formatoptions+=n " Recognize numbered lists
set formatoptions+=l " Don't break long lines that were already there

set textwidth=78  " From settings above, this is only for comments

" Don't artificially wrap long lines on the screen
set nowrap

" Show line numbers
set nu

set background=dark

" Show the ruler and 1 line of status all the time
set ruler
set cmdheight=1
set laststatus=2
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

" Record the last 30 : commands
set history=30

" Allow backspacing through newlines
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Set 2-space tabs as the default
set tabstop=2
set shiftwidth=2
set expandtab

" Quickly highlight matching braces/parentheses/brackets
set showmatch

" Disable annoying beeps
set noerrorbells

" Incrementally display search results, highlighted
set hlsearch
set incsearch

set showcmd

" Keep 3 lines of context when scrolling
set scrolloff=3

" Enable vim modelines
set modeline

" Use the 'global' flag by default in search/replace
set gdefault

" Yes, we have a fast terminal
set ttyfast

" Store registers, marks, etc when we quit
set viminfo='1000,\"50,f1,<500

" Show characters for expanded TABs, etc
set list 
set listchars=tab:»· 
set listchars+=trail:·

map <F2> :NERDTreeToggle<CR>

" Turn off search highlights
map <C-n> :silent nohl<CR>

" Make window splitting behave
set noequalalways
set splitbelow

" Don't make backup files (filename.c~)
set nobackup

" Enable the mouse - clickity clickity
set mouse=a

" Correct typos.
iab beacuse    because
iab becuase    because
iab acn        can
iab cna        can
iab centre     center
iab chnage     change
iab chnages    changes
iab chnaged    changed
iab chnagelog  changelog
iab Chnage     Change
iab Chnages    Changes
iab ChnageLog  ChangeLog
iab debain     debian
iab Debain     Debian
iab defualt    default
iab Defualt    Default
iab differnt   different
iab diffrent   different
iab emial      email
iab Emial      Email
iab figth      fight
iab figther    fighter
iab fro        for
iab fucntion   function
iab ahve       have
iab homepgae   homepage
iab logifle    logfile
iab lokk       look
iab lokking    looking
iab mial       mail
iab Mial       Mail
iab miantainer maintainer
iab amke       make
iab mroe       more
iab nwe        new
iab recieve    receive
iab recieved   received
iab erturn     return
iab retrun     return
iab retunr     return
iab seperate   separate
iab shoudl     should
iab soem       some
iab taht       that
iab thta       that
iab teh        the
iab tehy       they
iab truely     truly
iab waht       what
iab wiht       with
iab whic       which
iab whihc      which
iab yuo        you
iab databse    database
iab versnio    version
iab obnsolete  obsolete
iab flase      false
iab recrusive  recursive
iab Recrusive  Recursive

" Make sure ruby files always get expanded 2-space tabs
augroup ruby
  autocmd BufReadPre,FileReadPre *.rb set tabstop=2
  autocmd BufReadPre,FileReadPre *.rb set shiftwidth=2
  autocmd BufReadPre,FileReadPre *.rb set expandtab
augroup END

augroup c
  autocmd BufReadPre,FileReadPre *.c set tabstop=2
  autocmd BufReadPre,FileReadPre *.c set shiftwidth=2
  autocmd BufReadPre,FileReadPre *.c set expandtab
augroup END

au BufRead /tmp/mutt-* set tw=72

if !has("gui_running")
  "au VimEnter *
  "  \ if &term == 'xterm' |
  "    \ set t_Co=256 |
  "  \ endif

  let xterm16_colormap   = 'soft'
  let xterm16_brightness = 'high'

  colorscheme xterm16

  if &t_Co == 256 || (&term == 'xterm-256color' || &term == 'rxvt-256color' || &term == 'screen-256color')
    colorscheme xoria256
  endif
endif
