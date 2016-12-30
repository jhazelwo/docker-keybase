#
# /home/human/.profile
#

umask 0077

HISTCONTROL=ignoreboth
export HISTCONTROL

HISTSIZE=8192
export HISTSIZE

PAGER=more
export PAGER

EDITOR=/usr/bin/vi
export EDITOR

# pulled from keybase help and sorted 2016.12.30
complete -o "nospace" -W "cert ctl currency decrypt deprovision device dump-keyfamily encrypt follow track help id list-followers list-following log login logout paperkey passphrase pgp ping prove rekey search sign signup sigs status unfollow untrack update verify version base62" keybase
