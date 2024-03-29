# collection of configurations

functions
aliases

# sourceShellScripts
used to read functions from functions folder

## Usage
source `.__rc/.bashrc` inside of your `.bash_profile` or `.bashrc`

```bash
# ~/.bash_profile/

[[ -f ~/.bashrc ]] && . ~/.bashrc
```

```bash
# ~/.bashrc/
[[ -f ~/.__rc/.bashrc ]] && source ~/.__rc/.bashrc
```
