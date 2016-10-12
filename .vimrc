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
"syntax on

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
nnoremap <F6> :setlocal spell!<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


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

" rename .vim/plugins/linuxsty.bim into .linuxsty.vim for highlighting
" violations of Linux Kernel coding style


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TagList - Source Insignt
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The switch of the Tag List
nmap <F10> :TlistToggle<CR>
"nmap <F10> :TlistOpen<CR>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 70


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SrcExpl - Source Insignt
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The switch of the Source Explorer
"nmap <F9> :SrcExplToggle<CR>
nmap <F9> :SrcExpl<CR>

" Set the height of Source Explorer window
let g:SrcExpl_winHeight = 10

" Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100

" Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"

" Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"


" In order to avoid conflicts, the Source Explorer should know what plugins
" except itself are using buffers. And you need add their buffer names into
" below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [
         \ "__Tag_List__",
         \ "_NERD_tree_"
     \ ]

" Enable/Disable the local definition searching, and note that this is not
" guaranteed to work, the Source Explorer doesn't check the syntax for now.
" It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" Do not let the Source Explorer update the tags file when opening
" let g:SrcExpl_isUpdateTags = 0
"
" Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" create/update a tags file
" let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" Set "<F12>" key for updating the tags file artificially
"cet g:SrcExpl_updateTagsKey = "<F12>"

" Set "<F3>" key for displaying the previous definition in the jump list
let g:SrcExpl_prevDefKey = "<F3>"

" Set "<F4>" key for displaying the next definition in the jump list
let g:SrcExpl_nextDefKey = "<F4>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <F8> :NERDTreeToggle<CR>
let NERDTreeWinPos = "left"



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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting hidden symbols
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" For temporary highlighting whitespaces use
":set syntax=whitespace
":set list
":set listchars=eol:¶,tab:>·,trail:~,extends:>,precedes:<
"":set listchars=eol:¶,tab:>·,trail:~,extends:>,precedes:<,space:-
nnoremap <F2> :ShowWhiteToggle<CR>

"colorscheme monochrome

"set t_Co=256
"set background=dark
"colorscheme primary

" Doxygen highlights
let g:load_doxygen_syntax=1


