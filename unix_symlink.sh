#! /bin/bash

chmod u+x $(pwd)/terminal/scripts/chtsh.sh

mkdir -p ~/.config/nvim
ln -fns $(pwd)/nvim/init.lua ~/.config/nvim/init.lua
ln -fns $(pwd)/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json

ln -fns $(pwd)/git/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml

mkdir -p ~/.config/alacritty
ln -fns $(pwd)/terminal/alacritty.yml ~/.config/alacritty/alacritty.yml

mkdir -p ~/.config/fish/functions
ln -fns $(pwd)/terminal/lfcd.fish ~/.config/fish/functions

mkdir -p ~/.config/tmux
ln -fns $(pwd)/terminal/tmux.conf ~/.config/tmux/tmux.conf

mkdir -p ~/.config/lf
ln -fns $(pwd)/terminal/lfrc ~/.config/lf/lfrc

ln -fns $(pwd)/idea/.ideavimrc ~/.ideavimrc

ln -fns $(pwd)/mac/.amethyst.yml ~/.amethyst.yml

for filename in vscode/*.*; do
    name=${filename##*/}
    base=${name%}
    # echo $filename
    # echo $(pwd)/${filename}
    # echo ~/Library/"Application Support"/Code/User/$base
    ln -fns $(pwd)/${filename} ~/Library/"Application Support"/Code/User/$base
done
