# Core Utils QoL Improvements

# Check if eza is present if not fallback to ls
function ls() {
	local LS="ls"

	if command -v eza &>/dev/null; then
		LS=eza
	fi
	/usr/bin/$LS "$@"
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
	local CAT="cat"

	if command -v bat &>/dev/null; then
		CAT=bat
	fi

	/usr/bin/$CAT "$@"
}
