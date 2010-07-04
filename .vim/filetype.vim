if exists("did\_load\_filetypes")
 finish
endif

" markdown filetype file

augroup markdown
 au! BufRead,BufNewFile *.mkd   setfiletype mkd
augroup END
