set nocompatible
set ruler
set autochdir

syntax on
colorscheme desert
set directory=/tmp

if has('gui_running')
    set cursorline

    " hide toolbar
    :set guioptions-=T
    map <F11> :set guioptions-=m<CR>
    map <F12> :set guioptions+=m<CR>

    " make ctrl+c and ctrl+v copy and paste
    nmap <C-S-V> "+gP
    imap <C-S-V> <ESC><C-S-V>i
    vmap <C-S-C> "+y
endif

autocmd FileType * set tabstop=4|set shiftwidth=4
autocmd FileType sh set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType perl,awk,python set tabstop=4|set shiftwidth=4|set expandtab|set smartindent
autocmd FileType c,h,cpp set tabstop=8|set shiftwidth=8|set noexpandtab|set cindent
autocmd FileType make set tabstop=8|set shiftwidth=8|set noexpandtab
autocmd FileType asm set tabstop=8|set shiftwidth=8|set noexpandtab
