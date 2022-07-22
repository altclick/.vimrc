" Install vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Enable colors and highlighting
syntax enable
colo desert

" Set tabs to be 3 spaces
set tabstop=3
set shiftwidth=3
set expandtab

" Fix backspace on some systems
set backspace=indent,start

" Line numbers for files
set number
"setlocal foldmethod=manual

"Compatibility layer with vim vs vi
set nocompatible

" Turn of filetype for vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Rainbow Brackets
Plugin 'kien/rainbow_parentheses.vim'

" The ALE linting engine
Plugin 'w0rp/ale'

"Ctrl P search
Plugin 'kien/ctrlp.vim'

" Nerd tree plugin for file navigation
Plugin 'scrooloose/nerdtree'

" Syntax highlighting for kotlin
Plugin 'udalov/kotlin-vim'

call vundle#end()
filetype plugin indent on

" Macros for NERDTree
map <C-s> :NERDTreeClose<CR>
map <C-n> :NERDTreeFocus<CR>
map <C-h> :w<CR>

" Uncomment to test rainbow
"(((((((((((((())))))))))))))
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkgreen',    'SeaGreen3'],
    \ ['darkcyan',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['cyan',       'firebrick3'],
    \ ['red',        'RoyalBlue3'],
    \ ['blue',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['black',       'firebrick3'],
    \ ['grey',        'DarkOrchid3'],
    \ ]

" Max number of bracket nesting
let g:rbpt_max = 32

" Automatically load Rainbow brackets
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"au Syntax * RainbowParenthesesLoadChevrons

" TODO what does this do?
let g:used_javascript_libs = 'jquery,underscore,backbone,react'

"let g:syntastic_enable_perl_checkers = 1

" Options for perl execution
let g:ale_perl_perl_options = '-c -Mwarnings -Ilib -It/lib'

" Pick the linting engines to use with ALE
let g:ale_linters = {
         \ 'python' :['flake8', 'pylint'],
         \ 'perl' :['perl', 'perlcritic'],
         \ 'javascript' :['eslint'],
         \ 'xml' :['android'],
         \ 'groovy' :['android'],
         \ 'java' :['android', 'checkstyle', 'javalsp'],
         \ 'kotlin' :['android', 'ktlint', 'languageserver'],
			\}

" Maps perl critic violations to be errors
" Error Statment : Warning Statment ...
let g:ale_type_map = {
			\ 'perl' : {'ES':'WS'},
			\ 'perlcritic' : {'ES': 'WS', 'E':'W'},
			\}

"Code folding for vim
augroup AutoSaveFolds
   autocmd!
   autocmd BufWinLeave * mkview
   autocmd BufWinEnter * silent! loadview
augroup END


map <C-h> :w<CR>
map <C-a> :q!<CR>
