#!/bin/bash


VIMRC_DEFAULT="
set nocompatible

\" Syntax highlighting
syntax enable
let python_highlight_all=1

\" Line numbering
set nu

\" spaces are better than tabs because PEP-8
set ts=4
set autoindent
set expandtab
set shiftwidth=4

\" Shows a line under the cursor
set cursorline

\" highlight matching parens
set showmatch

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'Valloric/YouCompleteMe', {'do':'./install.py'}

Plug 'scrooloose/syntastic'

Plug 'nvie/vim-flake8'

call plug#end()
" 

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


if [ ! -f ~/.vim/vimrc ]; then
	echo "$VIMRC_DEFAULT" > ~/.vim/vimrc
else
	echo -n '~/.vim/vimrc already exists. Overwrite (Y/N)? '
	read inp
	until [ "$inp" = 'Y' -o "$inp" = 'N' ]; do
		echo -n '~/.vim/vimrc already exists. Overwrite (Y/N)? '
		read inp
	done
	if [ "$inp" = 'Y' ]; then
		echo "$VIMRC_DEFAULT" > ~/.vim/vimrc
	fi
fi
