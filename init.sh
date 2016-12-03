#!/bin/bash
# run this script after cloning repo

mkdir -p bundle
git clone https://github.com/gmarik/vundle.git bundle/vundle

mkdir -p undofiles

while true
do
read -p "do you want to link ctags.cfg ~/.ctags (Y/N)" yn
case $yn in
	[Yy]*) ln -s ~/.vim/ctags.cfg ~/.ctags; break;;
	[Nn]*) break;;
	*) echo "please answer yes or no";;
esac
done

while true
do
read -p "do you want to install packages? (Y/N)" yn
case $yn in
	[Yy]*) sudo apt-get install -y vim-nox python-simplejson exuberant-ctags curl ack-grep
		sudo pip install --upgrade flake8
		sudo pip install vim_bridge
		break;;
	[Nn]*) break;;
	*) echo "please answer yes or no";;
esac
done

while true
do
read -p "do you want to set vim as default editor (Y/N)" yn
case $yn in
	[Yy]*) sudo sudo update-alternatives --set editor /usr/bin/vim.nox
		break;;
	[Nn]*) break;;
	*) echo "please answer yes or no";;
esac
done

vim -u vundle-list.vim +:BundleInstall +q
cd bundle/vimproc.vim/
make
cd -
