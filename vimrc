" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and CLICK
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" bind Ctrl+<movement> keys to move in windows, instead of Ctrl+w+<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" Easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" Map sort function to a key
vnoremap <Leader>s :sort<CR>


" Easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation


" Show whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
set t_Co=256
color wombat256mod


" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" Easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700
set spell
hi clear SpellBad
hi SpellBad cterm=underline


" Use spaces, not tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Set C and C++ filetypes
au BufRead,BufNewFile *.tpp set filetype=cpp
au BufRead,BufNewFile *.h set filetype=c


" Setup Pathogen to manage your plugins
call pathogen#infect()


" ================
" Python IDE setup
" ================


" Settings for creating new .py files
if has("autocmd")
augroup content
autocmd BufNewFile *.py
   \ 0put = '#!/usr/bin/env python'        |
   \ 1put = '# ' . expand('<afile>')       |
   \ 2put = ''                             |
   \ 3put = 'def main():'	      	   |
   \ 4put = ''			           |
   \ 5put = 'if __name__ == \"__main__\":' |
   \ 6put = '    main()'                   |
   \ normal 4G
augroup END
endif


" Settings for mapping keys to run file with Python
map <F3> :w\|!python %
map <F4> :w\|!python -i %


" Settings for vim-powerline
set laststatus=2


" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for jedi-vim
let g:jedi#usages_command ="<leader>z" 
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


" Better navigating through omnicomplete option list
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction


inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
set nofoldenable
