# Add pyenv shims
export PYENV_ROOT="$HOME/.pyenv"

# Set up editor
export EDITOR="vim"

# Set pv-back in debug mode
export PVBACK_DEBUG=1

# PATH config
PATH="$PATH:$PYENV_ROOT/bin"
PATH="$PATH:/usr/sbin"
PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/mongodb-4.0/bin"
PATH=~/.npm-global/bin:$PATH  # So globally installed packages do not need root permissions
export PATH

# prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Start a ssh-agent
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval `ssh-agent -s`
fi

# Init pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# opam configuration
test -r /home/amoreau/.opam/opam-init/init.sh && . /home/amoreau/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi
