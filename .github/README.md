# dotfiles

## Prerequisites

TODO

## Install

I adopt a technique [here](https://www.atlassian.com/git/tutorials/dotfiles).
Execute the following bash script.

```bash
git clone --bare https://github.com/y011d4/dotfiles.git $HOME/.dotfiles.git
alias dotfiles="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
dotfiles config status.showuntrackedfiles no
dotfiles checkout
# if some files are conflicted, make backup and then checkout
if [ $? -ne 0 ]; then
  for i in $(dotfiles checkout 2>&1 | head -n -2 | awk 'NR>1{print $1}'); do
    mv $i $i.bk
  done
  dotfiles checkout
fi
```

## Enabling tig

```bash
dotfiles config alias.tig "!tig"
dotfiles tig
```
