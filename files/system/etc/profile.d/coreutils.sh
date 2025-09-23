# Core Utils QoL Improvements
function exec_fallback {
	local default="$2"

	if command -v $1 &>/dev/null
	then
		default="$1"
	fi

	shift 2

	$default $@
}

# Check if eza is present if not fallback to ls
function ls() {
	exec_fallback eza ls $@
}

# Check if ripgrep is present if not regular grep is used as fallback
function grep() {
	local GREP="grep"
	if command -v rg &>/dev/null; then
		GREP=rg
	fi
	if [ "$1" == "-E" ] && [ "$GREP" == "rg" ]; then
		shift 1
		/usr/bin/rg -e "$@"
	elif [ "$1" == "-E"] && [ "$GREP" != "rg" ]; then
		/usr/bin/grep "$@"
	else
		/usr/bin/$GREP "$@"
	fi
}

# Check if bat is present and if not uses cat as fallback
function cat() {
	exec_fallback bat cat $@
}
