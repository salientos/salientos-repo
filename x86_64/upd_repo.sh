#!/usr/bin/env bash

##############################################################################
#
#  Program :	Upd_Repo v1
#  Arch    :	x86_64 
#  Author  : 	Silent Robot
#  Website : 	https://sourceforge.net/projects/salient-os/
#
##############################################################################

_msg() {
    printf "\n"
    term_cols=$(tput cols)
    str="$1"
    tput setaf 5; printf '%*s\n' "${term_cols}" '' | tr ' ' - ; tput sgr0
    tput setaf 4; printf "%*s\n" $(((${#str}+$term_cols)/2)) "$str"; tput sgr0
    tput setaf 5; printf '%*s\n' "${term_cols}" '' | tr ' ' - ; tput sgr0
}

repoargs=("-n -R salient-os.db.tar.gz *.pkg.tar.zst")

_msg "Deleting Existing Database..."
rm -f salient-os.*
sleep 1

_msg "Updating Repo Database..."
repo-add $repoargs
sleep 1

_msg "Repo Database is Updated!"
exit