# Bash_Project
File Permission Manager

Overview

The file permission manager is a bash script designed to simplify the management of file and directory permissions. This script allows users to easily change the ownership and permissions with a straightforward CLI. 

Features
    -Change file or directory ownership
    -Change access permissions for files or directories
    -Display current permissions before and after changes
    -Help message 

Usage 

The basic syntax is as follows
./file_permission_manager.sh [-o user:group] [-p permissions] file_or_directory

Options
    -o user:group : Change ownership of specified file or directory
    -p permissions : Change permissions of a specified file or directory
    -h : Display help information

Examples

Change ownership
    ./file_permission_manager.sh -o newuser:newgroup testfile.txt
Change Permissions
    ./file_permission_manager.sh -p 644 testfile.txt
Change both
    ./file_permission_manager.sh -o newuser:newgroup -p 755 testfile.txt
Show Help
    ./file_permission_manager.sh -h

Error Handling
    The script checks for the following:
    -No options
    -No file or directory
    -File or directory does not exist
    -Invalid options
