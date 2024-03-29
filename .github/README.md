# DOTFILES


[Replaces Old DotFiles Repository](https://github.com/christophermca/dotfiles_old/)


## Requirements
1. Create an alias and place in `$HOME/.bashrc` or `$HOME/.bash_profile`


```sh
# <alias-name>=<path/to/git> --git-dir=<path/to/save-gitfiles/> --work-tree=<path>

alias dfi='/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
```

## Docs

**Note**
Both branches`master` and `arch` should point to the same SHA.
The `arch-i3` branch is specific to using the I3WM
