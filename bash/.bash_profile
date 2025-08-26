# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

# Load pyenv automatically by appending
# the following to 
# ~/.bash_profile if it exists, otherwise ~/.profile (for login shells)
# and ~/.bashrc (for interactive shells) :

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"


# Added by Toolbox App
export PATH="$PATH:/home/nyaa/.local/share/JetBrains/Toolbox/scripts"


export PATH=$PATH:/home/nyaa/.spicetify
export PATH=$PATH:/home/nyaa/go/bin

# Created by `pipx` on 2024-12-29 12:39:33
export PATH="$PATH:/home/nyaa/.local/bin"
. "$HOME/.cargo/env"
export PATH="~/development/flutter/bin:$PATH"
