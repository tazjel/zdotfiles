#!/bin/bash
#
# A featureless todo list manager
# inpired by http://stevelosh.com/projects/t/
#
# Author: Gerome Fournier
# http://foutaise.org/code/

PATH=/bin:/usr/bin:/usr/local/bin

set -f

function usage()
{
	cat <<EOF
Todo list management tool
Usage:
    $0 -i FILE [ /atag ] <task to add>     # add a task
    $0 -i FILE [ /atag ]                   # list todo entries for tag "/atag"
    $0 -i FILE -d #num                     # delete entry number #num

Options:
    -i FILE : specify file to store todo entries
              (this options is required, and must be the first one)
    -d #num : delete entry number #num
    -e      : edit todo file into an external \$EDITOR
    -t      : list tags
    -h      : display this help and exit
EOF
}

function is_tag()
{
	[[ $1 =~ ^/[^/]*$ ]]
}

function is_integer()
{
	[[ $1 =~ ^[0-9]+$ ]]
}

function todo_get_tags()
{
	cut -d\  -f1 $TODO_FILE | sort | uniq
}

function todo_sort()
{
	sort -k1,1 -s < $TODO_FILE > $TODO_FILE.$$
	mv $TODO_FILE{.$$,}
}

function todo_get_line_tag()
{
	local line_nb="$1"

	head -n $line_nb $TODO_FILE | tail -n 1 | cut -d\  -f1
}

function todo_task_done()
{
	local line_nb="$1"
	local tag

	if is_integer $line_nb; then
		tag=$(todo_get_line_tag $line_nb)
		if [ -n "$tag" ]; then
			if ! sed -i -e "${line_nb}d" $TODO_FILE 2>/dev/null; then
				echo "Unable to mark task number '$line_nb' as done" >&2
			fi
			todo_list_tasks $tag
		fi
	else
		echo "'$line_nb' is not an integer" >&2
	fi
}

function todo_list_tasks()
{
	local tag=$1

	if [ -z "$tag" ]; then
		tag="/"
	elif ! is_tag "$tag"; then
		echo "'$tag' is not a valid tag" >&2
		return 1
	fi

	nlines=$(wc -l < $TODO_FILE)
	grep -n "^${tag}[[:space:]]" $TODO_FILE | sed -e 's/^\([[:digit:]]\+\):/\1 /' | \
		while read nb tag data; do
			printf "\e[1;30m%s\e[m %${#nlines}d - %s\n" "$tag" "$nb" "$data"
		done
}

function todo_add()
{
	[ -z "$*" ] && return
	if is_tag "$1"; then
		tag="$1"
		shift
	else
		tag="/"
	fi

	echo "$tag $*" >> $TODO_FILE
	todo_sort
	todo_list_tasks $tag
}

# grab the TODO file first
if [ $# -ge 2 ]; then
	if [ "$1" == "-i" ]; then
		TODO_FILE=$2
		shift 2
	else
		echo "Please specify the todo file before any other option" >&2
		exit 1
	fi
else
	usage
	exit 1
fi

# parse other options
while getopts "htd:e" OPTION
do
	case $OPTION in
		h)
			usage
			exit 0
			;;
		t)
			todo_get_tags
			exit 0
			;;
		d)
			todo_task_done $OPTARG
			exit 0
			;;
		e)
			[ -z "$EDITOR" ] && EDITOR=vi
			exec $EDITOR $TODO_FILE
			;;
		?)
			usage
			exit 1
			;;
		:)
			usage
			exit 1
			;;
	esac
done
shift $(($OPTIND - 1))

if [ $# -eq 0 ]; then
	todo_list_tasks
elif [ $# -eq 1 ] && is_tag $1; then
	todo_list_tasks $1
else
	todo_add $*
fi
