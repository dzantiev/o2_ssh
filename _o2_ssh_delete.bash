#!/bin/bash

_o2_ssh_delete()
{
	if [ -z "$1" ]; then
		echo "o2_ssh -d [connection name]"
		return 0
	fi

	fileName="$_o2_ssh_dir/connects/$1.conf"

	if [ ! -f $fileName ]; then
		echo "Missing configuration file for '$1'"
		return 1
	fi

	if _o2_ssh_ask "You are sure?"; then
		rm $fileName
	fi

	return 0
}