#!/bin/bash

# saves a copy of a host configuration file in a parallel directory structure (cloneDir), for safe keeping and future reference.

# echo all args: $*
# echo arg 0: $0
# echo num args: "$#"

if [ $# != 2 ]; then
    echo "Usage: $0 <cloneDir> <file>"
	echo BTW, your host is: `cat /etc/*release`
	exit 1;
fi

cloneDir=$1
# echo "Verifying that $cloneDir exist"

if [ ! -d $cloneDir ]; then
    echo "Dir '$cloneDir' not found"
	exit 1;
fi

file=$2
if [ ! -e $file ]; then
    echo "File '$file' not found"
	exit 1;
fi

fileDir=$(dirname $file)
mkdir -p $cloneDir.$fileDir
cp -R -P $file $cloneDir.$file
