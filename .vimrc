execute pathogen#infect()
syntax on
filetype plugin indent on

set exrc
set secure

set nocompatible


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     RECOMMENDED SETTINGS
"     from http://vim.wikia.com/wiki/Example_vimrc "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

set cindent " c indentation

set hidden
set confirm
set wildmenu
set showcmd
set ruler
set laststatus=2
set confirm
"set visualbell
set number

set hlsearch      " Get borred of all yellow, use :nohlsearch to turn it off for a moment

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"colorscheme desert
"set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
   exe "normal mz"
     %s/\s\+$//ge
       exe "normal `z"
       endfunc
       autocmd BufWrite *.cpp :call DeleteTrailingWS()
       autocmd BufWrite *.h :call DeleteTrailingWS()
       autocmd BufWrite *.* :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
nnoremap <F6> :setlocal spell!<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting hidden symbols
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" For temporary highlighting whitespaces use
":set syntax=whitespace
":set list
":set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Setting VIM as C/C++ IDE
" http://www.alexeyshmalko.com/2014/using-vim-as-c-cpp-ide/ "
" set security options, so local .vimrc can not do all what main .vimrc can
set exrc
set secure

" Display line numbers on the left
set number
"
"----------------------------------------------------
"
" Settings for local .vimrc, which is in the root of the project

" highlight fields for code
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab

"augroup project
"	autocmd!
"	autocmd BufRead,BufNewFile .h,.cpp,*.c set filetype=c.doxygen
"augroup END

" Set the Search in Files path
"let &path.="src/include,/usr/include/AL,"
"
"set includeexpr=substitute(v:fname,'\\.','/','g')
"

" Building settings
"set makeprg=make\ -C\ ../build\ -j9
" use :make to build the project

" Mapping hot key for start build
"nnoremap <F4> :make!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"nmap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <F8> :NERDTreeToggle<CR>
let NERDTreeWinPos = "left"
