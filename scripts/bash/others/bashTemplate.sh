#!/usr/bin/env bash
#Title           : templ.sh
#Description     : This script will make a header for a bash script.
#Author	 	 : Mr. Nix
#Date            : 31-12-2018
#Version         : 0.1
#Usage		 : . ./templ.sh
#Notes           : Install Vim and Emacs to use this script.
#Bash_version    : 4.1.5(1)-release
#==============================================================================

today=`date '+%Y-%m-%d %H:%M:%S'`
div=======================================

/usr/bin/clear

_select_title(){

    # Get the user input.
    printf "Enter a title: " ; read -r title

    # Check to see if script name exists already and, if so, ask user for another name.
    if [ -e $title ] ; then
        while [ -e $title ]
            do
                printf "\n%s\n\n" "A script with that name already exists. Try again: "
                read title
                test -e $title
            done
    fi

    # Remove the spaces from the title if necessary.
    title=${title// /_}

    # Convert uppercase to lowercase.
    title=${title,,}

    # Add .sh to the end of the title if it is not there already.
    [ "${title: -3}" != '.sh' ] && title=${title}.sh

    # Check to see if script name exists already and, if so, ask user for another name.
    if [ -e $title ] ; then
        while [ -e $title ]
            do
                printf "\n%s\n\n" "A script with that name already exists. Try again: "
	        _select_title
	   done
    fi
}

_select_title

printf "Enter a description: " ; read -r dscrpt
printf "Enter your name: " ; read -r name
printf "Enter the version number: " ; read -r vnum
printf "Enter a note about this script: " ; read -r nt

# Format the output and write it to a file.
printf "%-16s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%s\n\n\n" '#!/usr/bin/env bash' '#Title' ": $title" '#Description' \
": ${dscrpt}" '#Author' ": $name" '#Date' ": $today" '#Version' \
": $vnum" '#Usage' ": . ./$title" '#Notes' ": $nt" '#Bash_version' \
": ${BASH_VERSION}" \#$div${div} > $title

# Make the file executable.
chmod +x $title

#/usr/bin/clear

_select_editor(){

    # Select between Vim, Emacs, or Nano.
    printf "%s\n%s\n%s\n%s\n%s\n\n" "Select an editor." "1 for Vi." "2 for nVim." "3 for Nano." "4 for Emacs."
    read -r editor

    # Open the file with the cursor on the twelth line.
    case $editor in
        1) vi +12 $title
            ;;
        2) vim +12 $title
            ;;
        3) nvim +12 $title
            ;;
        4) nano +12 $title
            ;;
        5) emacs +12 $title
            ;;
        *) /usr/bin/clear
            ;;
    esac
}

_select_editor
