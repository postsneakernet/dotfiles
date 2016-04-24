#!/usr/bin/env bash

curl -so ~/.django_bash_completion https://raw.githubusercontent.com/django/django/master/extras/django_bash_completion
curl -s https://raw.githubusercontent.com/postsneakernet/dotfiles/master/bash_profile >> .bashrc
