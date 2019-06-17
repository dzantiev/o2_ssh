_o2_ssh_connectFile()
{
	if [ ! -f $1 ]; then
		echo "Отсутсвует файл '$1'"
		return 1
	fi

	user=`awk '/^[ ]+\"user/{print $0}' $1 | egrep -o '([^"]+)",'`;
	user=${user%\"*};

	host=`awk '/^[ ]+\"host/{print $0}' $1 | egrep -o '([^"]+)",'`;
	host=${host%\"*};

	password=`awk '/^[ ]+\"password/{print $0}' $1 | egrep -o '([^"]+)",'`;
	password=${password%\"*};

	remote_path=`awk '/^[ ]+\"remote_path/{print $0}' $1 | egrep -o '([^"]+)",'`;
	remote_path=${remote_path%\"*};

	port=`awk '/^[ ]+\"port/{print $0}' $1 | egrep -o '([^"]+)",'`;
	port=${port%\"*};

	$_o2_ssh_dir/_o2_ssh_connect.bash "$password" "$host" "$user" "$remote_path" "$port";
}