#!/bin/bash
# run this script after cloning repo

mkdir -p bundle
git clone https://github.com/gmarik/vundle.git bundle/vundle

mkdir -p undofiles

while true
do
read -p "do you want to link vimrc to ~/.vimrc (Y/N)" yn
case $yn in
	[Yy]*) ln -s ~/.vim/vimrc ~/.vimrc; break;;
	[Nn]*) break;;
	*) echo "please answer yes or no";;
esac
done

while true
do
read -p "do you want to link jshintrc to ~/.jshintrc (Y/N)" yn
case $yn in
	[Yy]*) ln -s ~/.vim/jshintrc ~/.jshintrc; break;;
	[Nn]*) break;;
	*) echo "please answer yes or no";;
esac
done

while true
do
read -p "do you want to install packages? (Y/N)" yn
case $yn in
	[Yy]*) sudo apt-get install vim-nox python-simplejson exuberant-ctags curl ack-grep rhino npm python-pip;
		sudo pip install flake8 -u
		sudo npm install jshint -g
		break;;
	[Nn]*) break;;
	*) echo "please answer yes or no";;
esac
done

vim -u vundle-list.vim +:BundleInstall +q

pushd ~/.vim/bundle/jslint.vim/
rake install
popd

