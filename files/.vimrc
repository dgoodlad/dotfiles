let mapleader=','

"call pathogen#infect()
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'sjbach/lusty'
Bundle 'mileszs/ack.vim'
Bundle 'goldfeld/vim-seek'
Bundle 'tpope/vim-surround'
Bundle 'kchmck/vim-coffee-script'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'mikewest/vimroom'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'jgdavey/vim-turbux'
Bundle 'jpalardy/vim-slime'
Bundle 'peterhoeg/vim-tmux'
Bundle 'kikijump/tslime.vim'
Bundle 'rodjek/vim-puppet'

" When started as "evim", evim will already have done these settings
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Remember more commands and search history
set history=1000

" Show a menu when matching files etc
set wildmenu

" Use emacs-style tab completion when selecting files, etc.
set wildmode=longest,list

" Ignore SCM files
set wildignore+=*/.git/*

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" Keep 3 lines of context when scrolling
set scrolloff=3

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backup

set backspace=indent,eol,start

" Show cursor position all the time
set ruler

" Display incomplete commands as I type them
set showcmd

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set guifont=Meslo\ LG\ S\ DZ\ 8
  set guioptions=

  let g:solarized_termtrans=0
  let g:solarized_visibility='low'
  set background=light
  colorscheme solarized
endif

if has("autocmd")
  " Enable file-type detection
  " Use the default filetype settings, so mail gets 'tw' set to 72,
  " 'cindent' is used in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
  augroup END
else
  " Always enable autoindent if vim doesn't support autocommands
  set autoindent
endif

" Default editing configuration for most files
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2  " Always display the status line
set showmatch     " Briefly highlight matching brackets etc

" Use the 'global' flag by default in search/replace
set gdefault
" TODO look into the `i` flag of the "highlight" option
set incsearch     
" Highlight all search matches
set hlsearch
" Automatically enable 'normal' regex mode when starting to search
nnoremap / /\v
vnoremap / /\v
" Turn off search highlights when I'm done with them
map <C-n> :silent nohl<CR>

" Setup automatic text formatting/wrapping:
set formatoptions=
set formatoptions-=t " Don't autowrap text
set formatoptions+=c " Do autowrap comments
set formatoptions+=r " Automatically continue comments
"set formatoptions+=o " Automatically continue comments when hitting 'o' or 'O'
set formatoptions+=q " Allow formatting of comments with 'gq'
set formatoptions+=n " Recognize numbered lists
set formatoptions+=l " Don't break long lines that were already there

"set textwidth=78     " From settings above, this is only for comments
set colorcolumn=+3   " Highlight column 81
set cursorline       " Highlight the line that the cursor is on

set winwidth=80      " Focused window should be at least this wide
set winheight=5      " Non-focused windows should have a small height, while
set winminheight=5   " the focused window should be as big as possible
set winheight=999

" Make window splitting behave
set splitbelow

" Show line numbers
set number

"set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

" Disable annoying beeps
set noerrorbells

" Yes, we have a fast terminal
set ttyfast

" Store registers, marks, etc when we quit
set viminfo='1000,\"50,f1,<500

" Show characters for expanded TABs, etc
set list
set listchars=tab:>-,trail:.,extends:>
set listchars=tab:»· 
set listchars+=trail:·

" Enable the mouse for those rare times - clickity clickity
set mouse=a

" Disable the fscking F1 key, make it esc instead
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Ctrl-Enter opens a line above in insert-mode (works like O in normal mode)
imap <C-Return> <ESC>O

" Ctrl-L inserts a hashrocket
imap <C-l> <Space>=><Space>

augroup c
  autocmd BufReadPre,FileReadPre *.c set tabstop=2
  autocmd BufReadPre,FileReadPre *.c set shiftwidth=2
  autocmd BufReadPre,FileReadPre *.c set expandtab
augroup END

au BufRead /tmp/mutt-* set tw=72

augroup mkd
  autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

augroup myfiletypes
  autocmd!
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber,coffee set ai sw=2 sts=2 et
  "autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
augroup END

" Map ,e and ,v to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

function! ExtractVariable()
    let name = input("Variable name: ")
    if name == ''
        return
    endif
    " Enter visual mode (not sure why this is needed since we're already in
    " visual mode anyway)
    normal! gv

    " Replace selected text with the variable name
    exec "normal c" . name
    " Define the variable on the line above
    exec "normal! O" . name . " = "
    " Paste the original selected text to be the variable value
    normal! $p
endfunction

function! InlineVariable()
    " Copy the variable under the cursor into the 'a' register
    " XXX: How do I copy into a variable so I don't pollute the registers?
    :normal "ayiw
    " It takes 4 diws to get the variable, equal sign, and surrounding
    " whitespace. I'm not sure why. diw is different from dw in this respect.
    :normal 4diw
    " Delete the expression into the 'b' register
    :normal "bd$
    " Delete the remnants of the line
    :normal dd
    " Go to the end of the previous line so we can start our search for the
    " usage of the variable to replace. Doing '0' instead of 'k$' doesn't
    " work; I'm not sure why.
    normal k$
    " Find the next occurence of the variable
    exec '/\<' . @a . '\>'
    " Replace that occurence with the text we yanked
    exec ':.s/\<' . @a . '\>/' . @b
endfunction

vnoremap <leader>rv :call ExtractVariable()<cr>
nnoremap <leader>ri :call InlineVariable()<cr>

" Make <leader>' switch between ' and "
nnoremap <leader>' ""yls<c-r>={'"': "'", "'": '"'}[@"]<cr><esc>

map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

" Map leader-leader to switch between the two most recent buffers
nnoremap <leader><leader> <c-^>

" Use git ls-files for ControlP, it's way faster
" This will fall back to globpath if there's no .git
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

" Setup vimroom
let g:vimroom_scrolloff=5
let g:vimroom_sidebar_height=3
let g:vimroom_width=80

