#!/bin/bash

#Help Message
show_help() {
    echo "File Permission Manager"
    echo "Usage: $0 [-o user:group] [-p permissions] file_or_directory"
    echo "Options:"
    echo "  -o   Change ownership of file or directory (e.g., user:group)"
    echo "  -p   Change permissions of file or directory (e.g., 755)"
    echo "  -h   Show this help message"
}

#Check arguments provided
if [ $# -eq 0 ]; then
    echo "Error: No options provided. Use -h for help."
    exit 1
fi

#Initialize variables
owner=""
perm=""
file=""

#Parse options
while getopts "o:p:h" opt; do
    case $opt in
        o) owner="$OPTARG" ;;
        p) perm="$OPTARG" ;;
        h) show_help; exit 0 ;;
        *) echo "Invalid option. Use -h for help."; exit 1 ;;
    esac
done

#Get specified file or directory
shift $((OPTIND - 1))
file=$1

#Check file or directory provided
if [ -z "$file" ]; then
    echo "Error: No file or directory provided."
    exit 1
fi

#Check if inputted file/directory exists
if [ ! -e "$file" ]; then
    echo "Error: '$file' not found."
    exit 1
fi

#Display current permissions
current_permissions=$(ls -ld "$file" | awk '{print $1}')
echo "Current permissions for '$file': $current_permissions"

#Change ownership if -o is used
if [ -n "$owner" ]; then
    sudo chown "$owner" "$file"
    echo "Ownership changed to $owner for $file"
    current_permissions=$(ls -ld "$file" | awk '{print $1}')
    echo "Updated permissions for '$file': $current_permissions"
fi

#Change permissions if -p is provided
if [ -n "$perm" ]; then
    chmod "$perm" "$file"
    echo "Permissions changed to $perm for $file"
    current_permissions=$(ls -ld "$file" | awk '{print $1}')
    echo "Updated permissions for '$file': $current_permissions"
fi
