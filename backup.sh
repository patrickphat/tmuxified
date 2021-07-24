mkdir -p  backup_dotfiles
myarray=(~/.tmux.conf ~/.vimrc)

for i in "${myarray[@]}"; do
	cp "$i" "backup_dotfiles/"	
done
