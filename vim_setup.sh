#!/usr/bin/env bash

mkdir ~/.vim ~/.vim/autoload ~/.vim/bundle ~/.vim/colors ~/.vim/ftplugin

curl -so ~/.vimrc https://raw.githubusercontent.com/postsneakernet/dotfiles/master/vimrc

curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

wget -qO ~/.vim/colors/wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
wget -qO ~/.vim/colors/Tomorrow.vim https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow.vim
wget -qO ~/.vim/colors/Tomorrow-Night.vim https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night.vim
wget -qO ~/.vim/colors/Tomorrow-Night-Bright.vim https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night-Bright.vim
wget -qO ~/.vim/colors/Tomorrow-Night-Eighties.vim https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night-Eighties.vim

wget -qO ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492

cd ~/.vim/bundle
git clone -q https://github.com/derekwyatt/vim-scala.git
git clone -q https://github.com/vim-airline/vim-airline.git
git clone -q https://github.com/vim-airline/vim-airline-themes.git
git clone -q https://github.com/ctrlpvim/ctrlp.vim.git
git clone -q https://github.com/nvie/vim-flake8.git
git clone -q --recursive https://github.com/davidhalter/jedi-vim.git
