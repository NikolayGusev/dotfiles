#! /bin/bash

ln -fns $(pwd)/nvim/init.vim ~/.config/nvim/init.vim
ln -fns $(pwd)/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json
ln -fns $(pwd)/git/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml
ln -fns $(pwd)/terminal/alacritty.yml ~/.config/alacritty/alacritty.yml

for filename in vscode/*.*; do
    name=${filename##*/}
    base=${name%}
    # echo $filename
    # echo $(pwd)/${filename}
    # echo ~/Library/"Application Support"/Code/User/$base
    ln -fns $(pwd)/${filename} ~/Library/"Application Support"/Code/User/$base
done