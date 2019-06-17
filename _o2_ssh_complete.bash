function _o2_ssh_complete {
    local line

    declare -a files

    for file in $_o2_ssh_dir/connects/*.conf
	do
		filename=$(basename -- "$file")
		filename="${filename%.*}"
	    files=("${files[@]}" "$filename")
	done

    _arguments -C \
        "-d[Delete connect]" \
        "1: :(${files[*]})" \
        "*::arg:->args"

    case $line[1] in
        -d)
            _arguments \
	        "1: :(${files[*]})"
        ;;
    esac
}

compdef _o2_ssh_complete o2_ssh