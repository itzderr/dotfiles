# g functions to navigate projects

function __g-validate-name {
! [[ "$1" =~ [^A-Za-z0-9_-] ]]
}

function g {
if [ "$#" != 1 ]; then
	echo >&2 "usage: g name[/subdir]"
	return 1
fi
local tname subdir
IFS=/ read -r tname subdir <<< "$1"
if ! __g-validate-name "$tname"; then
	echo >&2 "g: $tname: invalid name"
	return 1
fi
if [ -f ~/.g.conf ]; then
	local name dir
	while read -r name dir; do
		if [ "$name" = "$tname" ]; then
			cd "$dir"/"$subdir"
			return
		fi
	done < ~/.g.conf
fi
echo >&2 "g: $tname: not found"
return 1
}

function g-add {
if [ "$#" != 1 -a "$#" != 2 ]; then
	echo >&2 "usage: g-add name [dir]"
	return 1
fi
if ! __g-validate-name "$1"; then
	echo >&2 "g-add: $1: invalid name"
	return 1
fi
local name="$1" dir
if [ "$#" = 2 ]; then
	dir="$2"
else
	dir="$(pwd)"
fi
>> ~/.g.conf
# remove old
sed "/^$1 /d" "$(readlink -f ~/.g.conf)" < ~/.g.conf > ~/.g.conf.bak
# add new
echo "$name $dir" >> ~/.g.conf.bak
# sort
sort < ~/.g.conf.bak > ~/.g.conf
rm ~/.g.conf.bak
}

function g-rm {
if [ "$#" != 1 ]; then
	echo >&2 "usage: g-rm name"
	return 1
fi
if ! __g-validate-name "$1"; then
	echo >&2 "g-rm: $1: invalid name"
	return 1
fi
if [ -f ~/.g.conf ]; then
	cp ~/.g.conf ~/.g.conf.bak
	sed "/^$1 /d" < ~/.g.conf.bak > ~/.g.conf
	rm ~/.g.conf.bak
fi
}

function g-ls {
if [ -f ~/.g.conf ]; then
	local name dir
	while read -r name dir; do
		echo "$name -> $dir"
	done < ~/.g.conf
fi
}

function g-help {
echo "g name      : goto name dir."
echo "g-ls        : list all directories registered."
echo "g-add name  : add current dir as name to the list."
echo "g-rm name   : remove name dir from the list."
}

