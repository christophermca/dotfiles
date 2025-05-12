# Project __rc
_Simplify maintaining your runtime configurations and setup across devices._

`__rc` uses a modular approach to
maintianing and using your .RC files. When I was a contractor I frequently had
to setup a new computer porting over my helper functions I created.

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
