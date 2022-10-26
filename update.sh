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
    files=$(echo "$(cat .files.txt | sed "s/USER/$USER/g")")
    files=($files)
    for file in "${files[@]}"; do
        current_file=$(echo "$file" | rev | cut -d "/" -f 1| rev)
        cp $file ./files/${current_file};
    done
}

Add_file () {
    echo "$1" >> .files.txt
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

while getopts "hus:a:" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      u) # Add files to repo
         Update_files;;
      a) # Add file to .file.txt
         Add_file "$OPTARG";;
      s) #Setup new account
         Setup "$OPTARG";;
     \?) # Invalid option
         echo "Error: Invalid option $option"
         exit;;
   esac
done

