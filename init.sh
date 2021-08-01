#!/bin/sh

printf "\n===== Copying config files.. ====="
cp -a backup_dotfiles/.  ~/ 

printf "\n===== Install Vim Vundle ====="
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

printf "\n===== Install Vim Plugin ====="
vim +PluginInstall +qall

printf "\n==== Install coc.nvim plugins ===="
vim -c ":CocInstall coc-pyright coc-tabnine coc-html" -c "q"

printf "\n===== Install fzf.. ====="
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
bash ~/.fzf/install --all

printf "\n==== DONE ===="
