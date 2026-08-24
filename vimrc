runtime! debian.vim
:set nocompatible
:set noshowcmd
:set t_Co=16
:colorscheme default
:syntax on
:set tabstop=4
:set softtabstop=2
:set shiftwidth=2
:set expandtab
:set autoindent
:set smartindent
:set list listchars=tab:»\ 
:set backspace=2
autocmd BufReadPost *
  \ if search("^\t", "nw") | setlocal softtabstop=4 shiftwidth=4 noexpandtab | endif
:set ruler
:set formatoptions+=m
:set ttimeoutlen=10
if !isdirectory('/tmp/vim/swap')
  call mkdir('/tmp/vim/swap', 'p')
endif
:set directory^=/tmp/vim/swap//
:set viminfo=""
