# collection of configurations

- functions
- aliases
- ps_config

# exported binaries

`sourceShellScripts` ....  used to read functions from functions folder

## Usage
source `.__rc/.bashrc` inside of your `.bash_profile` or `.bashrc`

```bash
#!/bin/bash
# file: ~/.bash_profile/

# In this example we chose to call bashrc from the bash profile

[[ -f ~/.bashrc ]] && . ~/.bashrc
```

```bash
#!/bin/bash
# file: ~/.bashrc/

# We source the __rc file
[[ -f ~/.__rc/.bashrc ]] && source ~/.__rc/.bashrc
```
