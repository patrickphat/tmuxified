mkdir -p  backup_dotfiles
myarray=(~/.bashrc ~/.profile  ~/.vimrc ~/.zshrc)

for i in "${myarray[@]}"; do
	cp "$i" "backup_dotfiles/"	
done
