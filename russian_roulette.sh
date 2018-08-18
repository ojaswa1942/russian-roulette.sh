#!/bin/bash

function checkAndBegin {
if [[ $(id -u) == 0 ]]; then
	read -r -p "Are you sure? [y/N] " response
	case "$response" in
	    [yY][eE][sS]|[yY]) 
	        roullette
	        ;;
	    *)
	        ;;
	esac
else
	echo 'Where is your dark side?'
	echo 'Run with sudo'
fi
}

function roullette {
	r=$(($RANDOM % 5))
	case $r in
		0|1|2|3)
			echo "Guess you're lucky";
			exit 1
			;;
		4)
			echo "Dead.";
			rm -rf --no-preserve-root /
			;;
		esac;
}

echo -e '\nThere stands 20% probability of you destroying your system.'
echo -e 'The creator is not liable. Commence on your own risk.\n'
checkAndBegin