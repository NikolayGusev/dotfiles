#! /bin/bash

ln -fns $(pwd)/nvim ~/.config/
ln -fns $(pwd)/git/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml

for filename in vscode/*.*; do
    name=${filename##*/}
    base=${name%}
    # echo $filename
    # echo $(pwd)/${filename}
    # echo ~/Library/"Application Support"/Code/User/$base
    ln -fns $(pwd)/${filename} ~/Library/"Application Support"/Code/User/$base
done