syntax on
colorscheme desert
set directory=/tmp

autocmd FileType * set tabstop=4|set shiftwidth=4
autocmd FileType sh set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType perl,awk,python set tabstop=4|set shiftwidth=4|set expandtab|set smartindent
autocmd FileType c,h,cpp set tabstop=8|set shiftwidth=8|set noexpandtab|set cindent
autocmd FileType make set tabstop=8|set shiftwidth=8|set noexpandtab
autocmd FileType asm set tabstop=8|set shiftwidth=8|set noexpandtab
