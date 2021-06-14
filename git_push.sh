#!/bin/bash

##############################################################################
#
#  Program :	Git_Push v1
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

_msg "Checking for newer files online."
git pull
cd x86_64
sh upd_repo.sh

_msg "Backing up everything in project folder."
git add --all

_msg "Enter your commit message (optional)"
read -p "Enter commit message: " input

_msg "Committing to the local repository."
git commit -m "$input"

_msg "Pushing local files to Github."
git push -u origin master

_msg "Git push completed...all done!"