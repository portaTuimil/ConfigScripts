#!/bin/bash 
#-----Installations-----: 
sudo apt update 
sudo apt install tmux -y 
sudo apt-get install build-essential

#-----Commands-----: 
sudo echo "set bell-style none" >> "/etc/inputrc" 
remove bell sound (wsl)
git config --global user.name <nombre de usuario
git config --global user.email <example@mail.com>

#-----Neovim-----: 
wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz 
mv nvim-linux64 /usr/bin #tar xzvf /usr/bin/nvim-linux64.tar.gz 
git clone https://github.com/NvChad/starter ~/.config/nvim 
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 #NvChad 
rm /usr/bin/nvim-linux64

#----Oh my posh-----:
curl -s https://ohmyposh.dev/install.sh | bash -s
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/kushal.omp.json
mv kushal.omp.json ~/.cache/oh-my-posh
include PROMPT_COMMAND="export PROMPT_COMMAND=echo" in bashrc
include eval "$(oh-my-posh init bash --config '~/.cache/oh-my-posh/kushal.omp.json')" in bashrc

#-----NVM and Node-----:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install --lts

#-----SSH-----:
ssh-keygen -t ed25519 -C "example@mail.com"
eval "$(ssh-agent -s)"
