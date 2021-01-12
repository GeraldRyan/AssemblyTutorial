#!/bin/bash
current_branch=$((git symbolic-ref HEAD 2>/dev/null || echo "(unnamed branch)")|cut -d/ -f3-)
echo the current branch is $current_branch
source="origin"
while getopts ":m:s:b:dh" opt; do
case ${opt} in 
    h )
      echo "Usage:"
echo "    This script commit all tracked files and pushes to github as specified."      
echo "    commitpush -h  Display this help message"
echo "    commitpush -m 'message' Specifies a commit message at the command line. Will be prompted for one if not provided here"
echo "    commitpush -b 'branch' specifies branch to push to, otherwise it will prompt user for input if '-d' not used"
echo "    commitpush -d to push to current checked out (default) branch "	
echo "    commitpush -s 'source' to specify the source, otherwise default origin" 
exit 0
;;
m ) 
message=$OPTARG
;;
b ) 
branch=$OPTARG
;;
d ) 
branch=$current_branch
;;
s ) 
source=$OPTARG


esac 
done


if [[ "$message" = "" ]]
then
read -r -p 'Commit message: ' message
fi

if [[ "$branch" = "" ]]
then
read -r -p 'Branch: ' branch
fi

echo $message
git add .
git commit -m "$message"
git push $source "$branch"


