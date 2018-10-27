# Appended from https://raw.githubusercontent.com/postsneakernet/dotfiles/master/bash_profile
# append to .profile for login shells (Ubuntu server, ssh usage)
# append to .bashrc for desktop Linux
# append to .bash_profile for macOS (may need to adjust paths)


# git settings
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export TERM="xterm-color"
export PS1="\[\e[0;36m\]\h:\W \u\\[\e[0m\]\$(parse_git_branch)\[\033[00m\] $ "


# cd settings
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
