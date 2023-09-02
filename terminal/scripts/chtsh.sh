#!/usr/bin/env bash

# original - https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-cht.sh
languages=`echo "typescript javascript golang lua java kotlin nix rust css html bash python zsh fish nodejs" | tr ' ' '\n'`
commands=`echo "rg fzf find man tldr sed awk tr cp ls grep xargs rg ps mv kill lsof less head tail tar cp rm rename jq cat ssh cargo git git-worktree git-status git-commit git-rebase docker docker-compose stow chmod chown make 
" | tr ' ' '\n'`
selected=`printf "$languages\n$commands"| fzf`
if [[ -z $selected ]]; then
    exit 0
fi

    read -p "Enter Query: " query
if printf "$languages" | grep -qs "$selected"; then
    query=`echo $query | tr ' ' '+'`
    tmux neww -n "❔" fish -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query | bat --paging=always"
else
    tmux neww -n "❔" fish -c "curl -s cht.sh/$selected~$query | bat --paging=always"
fi
