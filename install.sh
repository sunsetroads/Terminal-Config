#!/bin/sh

## 拷贝iTerm.app到/Applications目录下

if [ -d /Applications/iTerm.app ];then
    echo "[Info]: iTerm.app already exists!"
else
    cp -r tools/iTerm.app /Applications/
fi

## 链接家目录下的各项配置文件
if [ -d ~/dotfiles ];then
    echo "[Info]: Old dotfiles already exists, rename it to dotfiles.bak"
    mv ~/dotfiles ~/dotfiles.bak
fi
    
cp -r dotfiles ~/
cd $HOME
ln -sf dotfiles/.screenrc .
ln -sf dotfiles/.bash_profile .
ln -sf dotfiles/.bashrc_custom .
ln -sf dotfiles/.vimrc .
ln -sf dotfiles/.gitconfig .
ln -shF dotfiles/.emacs.d ./emacs.d

## 切换终端为zsh
chsh -s /bin/zsh

## 配置zsh
ln -shF dotfiles/.oh-my-zsh .oh-my-zsh
ln -sf dotfiles/.zshrc .
echo "[Info]: Success!"
