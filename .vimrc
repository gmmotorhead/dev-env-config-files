set autoindent      "automatic smart indenting
set smartindent
set tabstop=4       "number of spaces for a tab
set shiftwidth=4    "number of spaces to autoindent
set expandtab       "tabs converted to spaces
set number          "line numbering on
set nobackup        "don't keep a backup file
set ignorecase      "ignore case in searches by default
" filetype plugin on  "syntax highlighting depending on file type
" filetype plugin indent on  "syntax highlighting depending on file type
" set listchars=tab>-,trail:-, "show tabs and trailing whitespace
" set list

" highlight trailing whitespace as an error
match ErrorMsg '\s\+$'

if has("gui_running")
    colorscheme murphy
else
    set t_Co=256
    set background=dark
endif

" Fix leading and trailing white space on write
func! FixWS()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    set fileformat=unix
    retab "need expandtab and tabstop set above for this to do as intended
    call cursor(l, c)
endfunc

autocmd BufWritePre Dockerfile,*.{c,cc,cpp,h,py,xml,java,js,rb,sh,txt,rtf,json,yaml} :call FixWS()
" xmllint formatting options for xml filetypes
autocmd FileType xml exe "let &l:equalprg='xmllint --format -'"
" also need to set XMLLINT_INDENT='    ' in .bashrc for xmllint

