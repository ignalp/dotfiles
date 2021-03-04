"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " VI compatible mode is disabled so that VIm things work

" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:molokai_original = 1
colorscheme molokai " Monokai-like colorscheme
" colorscheme badwolf         " awesome colorscheme
let g:rehash256 = 1
syntax enable           " enable syntax processing

"set showmode "Show current mode in status line"
set noshowmode "Baecause linghline 

" UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu "Show line numbers"
set rnu "Show relative line numbers"
set showmatch "Show matching brackets"
set autoindent "Set Autoindentation in scripts"
set noerrorbells visualbell t_vb=    "Disable annoying error noises

"Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch           " search as characters are entered
set hls "hihglight search"

" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable          " enable folding
"set foldlevelstart=10   " open most folds by default
"set foldnestmax=10      " 10 nested fold max
" space open/closes folds
" nnoremap <space> za
set foldmethod=indent   " fold based on indent level
" This is especially useful for me since I spend my days in Python.
" Other acceptable values are marker, manual, expr, syntax, diff.
" Run :help foldmethod to find out what each of those do.

" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=3       " number of visual spaces per TAB
set softtabstop=3   " number of spaces in tab when editing
set expandtab       " tabs are spaces, mainly because of python

" open new split panes to right and bottom, which feels more natural
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow
set splitright


" quicker window movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
set laststatus=2        " Show the status line at the bottom

" quicker window movement in terminal			      
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
tnoremap <C-w>h <C-\><C-n><C-w>j
tnoremap <C-w>j <C-\><C-n><C-w>k
tnoremap <C-w>k <C-\><C-n><C-w>h
tnoremap <C-w>l <C-\><C-n><C-w>l

" Custom Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

function! SwitchNumber()
    if(&relativenumber == 1 || &number== 1)
        set norelativenumber
        set nonumber
    else
        set number
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction



" Leader Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "       " leader is space
nnoremap <leader>t :call ToggleNumber()<CR>
nnoremap <leader>T :call SwitchNumber()<CR>
nnoremap <leader>s :call <SID>StripTrailingWhitespaces()<CR>



" lightline configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \ },
      \ }

"      \   'charvaluehex': '0x%B'

" Commentary 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype apache setlocal commentstring=#\ %s
autocmd Filetype python setlocal commentstring=#\ %s
autocmd Filetype sh setlocal commentstring=#\ %s


" Gundo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>u :GundoToggle<CR>
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

" ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ; :CtrlPBuffer<CR>
let g:ctrlp_switch_buffer = 0



" syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': []
\}
nnoremap <Leader>y :SyntasticCheck<CR>
nnoremap <Leader>r :SyntasticReset<CR>
nnoremap <Leader>i :SyntasticInfo<CR>
nnoremap <Leader>m :SyntasticToggleMode<CR> let g:ctrlp_show_hidden = 1

" Split with leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>\| :vsp<CR>

