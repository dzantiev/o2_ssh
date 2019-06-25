#!/bin/bash
_o2_ssh_new()
{
	if _o2_ssh_ask "Do you want to use file?"; then
		echo "Where is the file: "

		sftpFilePath=`pwd`
		pathExist=false
		while [ $pathExist = false ]; do
			vared -c sftpFilePath

			sftpFilePath=${sftpFilePath/\~/$HOME}

			if [ -z "$sftpFilePath" ]; then
				sftpFilePath=`pwd`;
			fi

			if [ ! -d "$sftpFilePath" ]; then
				echo "'$sftpFilePath' folder not found"
				continue
			fi

			if [ ! -f "$sftpFilePath/sftp-config.json" ]; then
				echo "There is no sftp-config.json file in the '$sftpFilePath' folder"
				continue
			fi

			sftpFilePath="$sftpFilePath/sftp-config.json"
			pathExist=true
	    done

	    _o2_ssh_new_create_conf 'file' $sftpFilePath
		_o2_ssh_connectFile $sftpFilePath
		return 0;
	else
		echo -n "Set username: "
		read userName </dev/tty
		echo -n "Set host: "
		read host </dev/tty
		echo -n "Set password: "
		read password </dev/tty
		echo -n "Set port: "
		read port </dev/tty
		echo -n "Set path: "
		read remoutePath </dev/tty

		_o2_ssh_new_create_conf 'settings' "$password" "$host" "$userName" "$remoutePath" "$port"
	    $_o2_ssh_dir/_o2_ssh_connect.bash "$password" "$host" "$userName" "$remoutePath" "$port";

	    return 0;
	fi
}

_o2_ssh_new_create_conf()
{
	if _o2_ssh_ask "Do you want to save?"; then
    	echo -n "Set name (a-zA-Z0-9_): "
    	validName=false
    	while [ $validName = false ]; do
	    	read configName </dev/tty

	    	if [ -f "$_o2_ssh_dir/connects/$configName.conf" ]; then
				echo -n "This name is already taken: "
				continue
			fi

			validName=true
		done

		touch $_o2_ssh_dir/connects/$configName.conf
		if [ $1 = "file" ]; then
			echo $2 > $_o2_ssh_dir/connects/$configName.conf
		else
			echo "$2" >> $_o2_ssh_dir/connects/$configName.conf
    		echo "$3" >> $_o2_ssh_dir/connects/$configName.conf
    		echo "$4" >> $_o2_ssh_dir/connects/$configName.conf
    		echo "$5" >> $_o2_ssh_dir/connects/$configName.conf
    		echo "$6" >> $_o2_ssh_dir/connects/$configName.conf
		fi
    fi

    return 0;
}