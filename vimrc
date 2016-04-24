" babun settings to play nicely with dropbox
" set backupdir=~/.vim/backup//
" set directory=~/.vim/swap//
" set undodir=~/.vim/undo//


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Copy & paste settings
" shift select left-click to copy
" shift right-click to paste
" middle-click to paste
" copy with quote*y and quote+y
" paste with quote*p and quote+p
set pastetoggle=<F2>   " fix indentation
set clipboard=unnamed  " use * register for unnamed clipboard


" Mouse and backspace
set mouse=a  " on OSX press ALT and CLICK
set bs=2     " make backspace behave like normal again


" Search settings
set hlsearch    " highlight results
set incsearch   " incrementally search as entered
set ignorecase  " case-insenstive search
set smartcase   " search case-sensitive if search contains uppercase


" Bind nohl
" Removes highlight of your last search
" ctrl n to remove search highlight
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Window splitting settings
" ctrl w s to split window horizontally
" ctrl w v to split window vertically
" ctrl w n to create new window horizontally
" :vnew to create new window vertically
" bind Ctrl+<movement> keys to move in windows, instead of Ctrl+w+<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" Rebind <Leader> key
" Initiates custom keyboard shortcuts
let mapleader = ","


" Tab settings
" :tabedit {file} to open file in new tab
" :tab split to split file in new tab
" Easier moving between tabs
" use ,j and ,k to switch between tabs
map <Leader>k <esc>:tabprevious<CR>
map <Leader>j <esc>:tabnext<CR>


" Map sort function to a key
" use ,s to sort visual selection
vnoremap <Leader>s :sort<CR>


" Easier moving of code blocks
" use << to indent left and >> to indent right
vnoremap < <gv " better indentation  " indent left
vnoremap > >gv " better indentation  " indent right


" Show trailing whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on


" Color scheme settings
set t_Co=256  " enable 256 color support
color Tomorrow-Night-Eighties


" Line settings
set number                         " show line numbers
set tw=98                          " set text width to automatically wrap at words
set nowrap                         " don't automatically wrap on load
set fo-=t                          " don't automatically wrap text when typing
set colorcolumn=99                 " mark end column
highlight ColorColumn ctermbg=233  " color end column


" Easier formatting of paragraphs
" Raises line(s) up to full width line(s)
vmap Q gq
nmap Q gqap


" History and spelling settings
set history=700              " history of :command-line entries
set undolevels=700           " amount of undo's to allow
set spell                    " enable spell checking
hi clear SpellBad            " clear highlight of misspelled group
hi SpellBad cterm=underline  " underline missspelled group


" Use spaces, not tabs
set tabstop=4      " width of tab
set softtabstop=4  " ensure tabs will be spaces
set shiftwidth=4   " indent width for shifting with << and >>
set shiftround     " use multiple of shiftwidth when shift indenting
set expandtab      " use spaces instead of tabs


" =====================
" Plugins and IDE setup
" =====================


" Setup Pathogen to manage your plugins
" Enable plugin settings below this block
execute pathogen#infect()


" Set spacing for HTML files
au BufRead,BufNewFile *.html,*.jsp set ts=2 sts=2 sw=2


" Set C and C++ filetypes
au BufRead,BufNewFile *.tpp set filetype=cpp
au BufRead,BufNewFile *.h set filetype=c


" Template for new .py files
if has("autocmd")
augroup content
au BufNewFile *.py
   \ 0put = '#!/usr/bin/env python'        |
   \ 1put = '# ' . expand('<afile>')       |
   \ 2put = ''                             |
   \ 3put = ''                             |
   \ 4put = 'def main():'                  |
   \ 5put = '    pass'                     |
   \ 6put = ''                             |
   \ 7put = ''                             |
   \ 8put = 'if __name__ == \"__main__\":' |
   \ 9put = '    main()'                   |
   \ normal 3G
augroup END
endif


" Settings for mapping keys to run file with Python
map <F4> :w\|!python %     " save and run in python
map <F4> :w\|!python -i %  " save and run in python with interactive prompt


" Settings for vim-airline
" Adds status line to bottom of vim
set laststatus=2


" Settings for ctrlp
" Most recently used files menu
" ctrl p to bring up most recently used list
" use ctrl j and ctrl k to naviagate list and enter to switch
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for jedi-vim
" enables autocompletion for python
" ctrl space to bring up suggestions and use ctrl j and ctrl k to navigate list
" use ,g to goto function definition
" use ,d to goto follow identifier as far as possible
" use ,r to rename
" use ,n to show all usages of a name
" use shift k to open docstrings
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c> " use ,b to insert breakpoint


" Better navigating through omnicomplete option list
" use ctrl j and ctrl k to navigate list
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


" maps ctrl j and ctrl k to omnicomplete function
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" Collapses function and class bodies
" use f to toggle fold function/class and shift f toggle all
set nofoldenable


" Settings for Flake8
" Source code checking and linter
" Manually run Flake8 with <F7>
autocmd BufWritePost *.py call Flake8()  " enables call after saving
