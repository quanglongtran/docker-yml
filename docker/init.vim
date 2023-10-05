call plug#begin(stdpath('data') . '/plugged')

Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'

call plug#end()

set number
syntax enable
colorscheme dracula
hi! Normal ctermbg=NONE guibg=NONE
hi! NoneText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
nnoremap <silent><F2> :NERDTreeFind<CR>
nnoremap <silent><F3> :NERDTreeToggle<CR>
