#!/bin/bash

# General bashrc I applied to my mac environments

# Generic

export EDITOR=vim

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"



# AWS completion
complete -C '/usr/local/bin/aws_completer' aws

# kops completion
source <(kops completion bash)

# kubectl completion
source $(brew --prefix)/etc/bash_completion
source <(kubectl completion bash)

# local setup
source ~/.aws/awsfunctions
