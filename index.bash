#!/bin/bash

_o2_ssh_dir="$(dirname $0)"
source $_o2_ssh_dir/_o2_ssh_ask.bash
source $_o2_ssh_dir/_o2_ssh_new.bash
source $_o2_ssh_dir/_o2_ssh_delete.bash
source $_o2_ssh_dir/_o2_ssh_connectFile.bash

o2_ssh()
{
	if [ -z "$1" ]; then
		_o2_ssh_new
		return $?
	fi

	if [ "$1" = "-d" ]; then
		_o2_ssh_delete $2
		return $?
	fi

	fileName="$_o2_ssh_dir/connects/$1.conf"

	if [ ! -f $fileName ]; then
		echo "Missing configuration file for '$1'"
		return 1
	fi

	config=()

	while read line; do config+=("$line"); done < $fileName

	if [ ${#config[@]} -eq 1 ]; then
		_o2_ssh_connectFile $config
		return $?
	else
		$_o2_ssh_dir/_o2_ssh_connect.bash "$config[1]" "$config[2]" "$config[3]" "$config[4]" "$config[5]";
		return $?
	fi
}

source $_o2_ssh_dir/_o2_ssh_complete.bash