# The __rc project
simplify using your rcfiles across devices.

## Exports
**collections**
- functions
- aliases
- ps_config

 **Binaries**
- `sourceShellScripts` ....  used to read functions from functions folder

## Usage
source `.__rc/.bashrc` inside of your `.bash_profile` or `.bashrc`

### Example
- `bash_profile` will source `.bashrc`
- `bashrc`, acting as a wrapper, will source `.__rc/bashrc`

```bash
#!/bin/bash
# file: ~/.bash_profile/

# This source `.bashrc` from `.bash_profile`

[[ -f ~/.bashrc ]] && . ~/.bashrc
```

```bash
#!/bin/bash
# file: ~/.bashrc/

# We source the __rc file
[[ -f ~/.__rc/.bashrc ]] && source ~/.__rc/.bashrc
```
