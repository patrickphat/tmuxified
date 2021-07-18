mkdir -p  backup_dotfiles
myarray=(~/.bashrc ~/.tmux.conf ~/.vimrc ~/.zshrc)

for i in "${myarray[@]}"; do
	cp "$i" "backup_dotfiles/"	
done
