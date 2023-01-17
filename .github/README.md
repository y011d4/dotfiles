# dotfiles

```bash
git clone --bare https://github.com/y011d4/dotfiles.git $HOME/.dotfiles.git
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
dotfiles config status.showuntrackedfiles no
dotfiles checkout
```
