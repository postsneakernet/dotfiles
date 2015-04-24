
# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
export PATH=/usr/local/bin:$PATH

# virtualenvwrapper settings
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='-p /usr/local/bin/python3'
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/web_dev
source /usr/local/bin/virtualenvwrapper_lazy.sh

# django bash completion
. ~/web_dev/django_bash_completion

# change directory shortcuts
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
