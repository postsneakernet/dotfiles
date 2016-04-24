# Appended from https://raw.githubusercontent.com/postsneakernet/dotfiles/master/bash_profile
# append to .profile for login shells (Ubuntu server, ssh usage)
# append to .bashrc for desktop Linux
# append to .bash_profile for OS X (may need to adjust paths)


# virtualenvwrapper settings
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='-p /usr/bin/python3'
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/python
source /usr/local/bin/virtualenvwrapper_lazy.sh


# django settings
# curl -so ~/.django_bash_completion https://raw.githubusercontent.com/django/django/master/extras/django_bash_completion
. ~/.django_bash_completion


# cd settings
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
