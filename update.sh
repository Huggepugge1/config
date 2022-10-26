#!/bin/bash

Help () {
    # Display help

    echo "Syntax: update.sh [options] [opargs]"
    echo ""
    echo "Options:"
    echo "  -v:          verbose"
    echo "  -a: [file]   add file"
    echo "  -u:          update and add files to repo"
    echo "  -s:          setup computer"
}

Update_files () {
    readarray -d "," -t files <<< $1
    for file in "${files[@]}"; do
        file=$(echo $file | tr -d " ")
        file_path=$(echo "/home/$USER/$file")
        cp $file_path "./files/$file";
    done
}

Bash_setup () {
    chmod +x ./bashsetup.sh
    source ./bashsetup.sh
}

Vim_setup () {
    chmod +x ./vimsetup.sh
    source ./vimsetup.sh
}

Setup () {
    readarray -d "," -t setup <<< $1
    for item in "${setup[@]}"; do
        item=$(echo $item | tr -d " ")
        if [[ "bash" == "$item" ]]
	    then
	        Bash_setup
	    elif [[ "vim" == "$item" ]]
	    then
	        Vim_setup
	    else
	        echo "invalid argument: $item"; 
    	fi
    done
}

while getopts "hu:s:" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      u) # Add files to repo
         Update_files "$OPTARG";;
      s) #Setup new account
         Setup "$OPTARG";;
     \?) # Invalid option
         echo "Error: Invalid option $option"
         exit;;
   esac
done

