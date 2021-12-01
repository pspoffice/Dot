" Display Line Numbers
"-------------------------------------------------------------------------------
set number
set relativenumber

" Indenting Source Code
"-------------------------------------------------------------------------------
set autoindent
set expandtab
set shiftwidth=2
set smarttab
set softtabstop=2
set tabstop=2

" Search
"-------------------------------------------------------------------------------
set ignorecase
set incsearch
set nohlsearch
set smartcase

" Accessing The System Clipboard
"-------------------------------------------------------------------------------
set clipboard=unnamedplus

" Miscellaneous
"-------------------------------------------------------------------------------
set autoread
set hidden
set linebreak
set showmatch
set wrap

" Cursor
"-------------------------------------------------------------------------------
set guicursor=n-v-c:block-Cursor

" Spell
"-------------------------------------------------------------------------------
" setlocal spell spelllang=en_us

" Enable Syntax Processing
"-------------------------------------------------------------------------------
syntax enable

" Color
"-------------------------------------------------------------------------------

" Python Formatting
"-------------------------------------------------------------------------------
let g:pymode_indent = v:false
let g:python_recommended_style = 0

" Formatting Text
"-------------------------------------------------------------------------------
autocmd FileType c,cpp map <buffer> <Leader><leader> :!clang-format -i -style=Google %:p <CR>
autocmd FileType python map <buffer> <Leader><Leader> :!yapf --in-place --parallel --style='{based_on_style: google, indent_width: 2}' %:p <CR>

" C-C++
"-------------------------------------------------------------------------------
" echo expand('%') - Full Path
" echo expand('%:r') - File Name

autocmd FileType c map <buffer> <Leader>/ :!gcc -fno-omit-frame-pointer -fsanitize=address -fsanitize=undefined -g3 -O0 -pedantic -std=gnu17 -Wall -Wconversion -Wextra -Wno-unused-parameter -Wshadow % -o %:r.out <CR>

autocmd FileType cpp map <buffer> <Leader>/ :!g++ -fno-omit-frame-pointer -fsanitize=address -fsanitize=undefined -g3 -O0 -pedantic -std=gnu++17 -Wall -Wconversion -Wextra -Wno-unused-parameter -Wshadow % -o %:r.out <CR>

" It’s convenient to have clang-check integrated.
"-------------------------------------------------------------------------------
function! ClangCheckImpl(cmd)
  if &autowrite | wall | endif
  echo "Running " . a:cmd . " ..."
  let l:output = system(a:cmd)
  cexpr l:output
  cwindow
  let w:quickfix_title = a:cmd
  if v:shell_error != 0
    cc
  endif
  let g:clang_check_last_cmd = a:cmd
endfunction

function! ClangCheck()
  let l:filename = expand('%')
  if l:filename =~ '\.\(cpp\|cxx\|cc\|c\)$'
    call ClangCheckImpl("clang-check " . l:filename)
  elseif exists("g:clang_check_last_cmd")
    call ClangCheckImpl(g:clang_check_last_cmd)
  else
    echo "Can't detect file's compilation arguments and no previous clang-check invocation!"
  endif
endfunction

nmap <silent> <F5> :call ClangCheck()<CR><CR>

