runtime! debian.vim
:set t_Co=16
:colorscheme default
:syntax on
:set tabstop=4
:set softtabstop=2
:set shiftwidth=2
:set expandtab
:set autoindent
:set smartindent
:set ruler
:set list listchars=tab:\ \ 
:set backspace=2
:set formatoptions+=m
:set ttimeoutlen=10
if !isdirectory('/dev/shm/vim/swap')
  call mkdir('/dev/shm/vim/swap', 'p')
endif
:set directory^=/dev/shm/vim/swap//
:set viminfo=""
