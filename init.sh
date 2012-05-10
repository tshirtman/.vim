#!/bin/bash
# run this script after cloning repo

git submodule init
git submodule update

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
read -p "do you want to install packages? (Y/N)" yn
case $yn in
	[Yy]*) sudo apt-get install vim-nox python-simplejson exuberant-ctags libxslt1-dev libxml2-dev ruby-bundler rubygems rake; break;;
	[Nn]*) break;;
	*) echo "please answer yes or no";;
esac
done

# build command-t
pushd bundle/command_t/ruby/command-t/
bundle install
rake make
popd

