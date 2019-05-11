#!/bin/bash

# https://github.com/sak96/todo.conky

# # Conky Todo
# alias todo=~/.conky/myConky/todo.sh
# alias td='~/.conky/myConky/todo.sh a'
# alias tda='~/.conky/myConky/todo.sh a'
# alias tdr='~/.conky/myConky/todo.sh r'
# alias tdl='~/.conky/myConky/todo.sh l'

todoFile="$(dirname $0)/todo.txt"
todoBackFile="$(dirname $0)/todo.txt.back"
conkyFile="$(dirname $0)/myConky"

help(){
	echo -e "$0 [option] [arguments]";
	echo -e "Updates todo list for Conky";
	echo -e "\ta\tadd\t\tAppends arguments to the list";
	echo -e "\tr x|all\tremove\t\tRemoves item number x, or all the items, from the list";
	echo -e "\tl\tlist\t\tLists all the todos with the item number";
	echo -e "\t-h\thelp\t\tDisplay this help and exit";
}

if [[ "$1" != "a" ]] && [[ "$1" != "add" ]] &&
		[[ "$1" != "r" ]] && [[ "$1" != "remove" ]] &&
		[[ "$1" != "l" ]] && [[ "$1" != "list" ]]; then
	help ;
	exit 1;
fi

op="$1";

refresh(){
	touch -m "$conkyFile";
}

add(){
	echo "$*" >> "$todoFile"
	echo "Added: $*"
	#refresh;
}

remove(){
	if [ -f $todoBackFile ]; then
		rm $todoBackFile;
	fi

	cp $todoFile $todoBackFile;

	id=$1;
	if [[ "$1" -eq "all" ]]; then
		id="1,$";
	fi
	sed "${id}d" -i "$todoFile"
	echo "Removed: $1"

	if [[ "$(stat -c %s $todoFile)" -eq "0" ]]; then
		rm $todoFile;
	fi

	#refresh;
}

list(){
	cat -n "$todoFile" | fmt -s -w 50
}

case $op in
	"add" | "a")
		shift;
		add "$@";
		;;

	"remove" | "r")
		shift;
		if [[ "$#" -ne "1" ]]; then
			exit 1;
		fi
		if [[ "$1" -lt 1 ]] || [[ "$1" -gt 9 ]]; then
			if [[ "$1" != "all" ]]; then
				exit 1;
			fi
		fi
		remove "$@";
		;;

	"list" | "l")
		list "$@";
		;;

	"help" | "-h")
		help "$@";
		;;
esac
