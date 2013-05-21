WW () {
	desc="ADD DESCRIPTION..." 
	if [ -n "$3" ]
	then
		desc="$3" 
	fi
	echo "" >> $HOME/zdotfiles/.oh-my-zsh/lib/waliases.zsh
	echo "###" >> $HOME/zdotfiles/.oh-my-zsh/lib/waliases.zsh
	echo "alias '$1'='$2'  " >> $HOME/zdotfiles/.oh-my-zsh/lib/aliases.zsh
	source $HOME/zdotfiles/.oh-my-zsh/lib/aliases.zsh
	echo "" && echo "- Alias added  $1 = $2 " && echo ""
}
SuSEconfig () {
	# undefined
	builtin autoload -XUz
}
a2ps () {
	# undefined
	builtin autoload -XUz
}
a2utils () {
	# undefined
	builtin autoload -XUz
}
aap () {
	# undefined
	builtin autoload -XUz
}
acpi () {
	# undefined
	builtin autoload -XUz
}
acpitool () {
	# undefined
	builtin autoload -XUz
}
acroread () {
	# undefined
	builtin autoload -XUz
}
adb () {
	# undefined
	builtin autoload -XUz
}
alias () {
	# undefined
	builtin autoload -XUz
}
aliases () {
	# undefined
	builtin autoload -XUz
}
all_labels () {
	local __gopt __len __tmp __pre __suf __ret=1 __descr __spec __prev
	if [[ "$1" = - ]]
	then
		__prev=- 
		shift
	fi
	__gopt=() 
	zparseopts -D -a __gopt 1 2 V J x
	__tmp=${argv[(ib:4:)-]} 
	__len=$# 
	if [[ __tmp -lt __len ]]
	then
		__pre=$(( __tmp-1 )) 
		__suf=$__tmp 
	elif [[ __tmp -eq $# ]]
	then
		__pre=-2 
		__suf=$(( __len+1 )) 
	else
		__pre=4 
		__suf=5 
	fi
	while comptags "-A$__prev" "$1" curtag __spec
	do
		(( $#funcstack > _tags_level )) && _comp_tags="${_comp_tags% * }" 
		_tags_level=$#funcstack 
		_comp_tags="$_comp_tags $__spec " 
		if [[ "$curtag" = *[^\\]:* ]]
		then
			zformat -f __descr "${curtag#*:}" "d:$3"
			_description "$__gopt[@]" "${curtag%:*}" "$2" "$__descr"
			curtag="${curtag%:*}" 
			"$4" "${(P@)2}" "${(@)argv[5,-1]}" && __ret=0 
		else
			_description "$__gopt[@]" "$curtag" "$2" "$3"
			"${(@)argv[4,__pre]}" "${(P@)2}" "${(@)argv[__suf,-1]}" && __ret=0 
		fi
	done
	return __ret
}
all_matches () {
	# undefined
	builtin autoload -XUz
}
alternative () {
	local tags def expl descr action mesgs nm="$compstate[nmatches]" subopts
	local opt ws curcontext="$curcontext"
	subopts=() 
	while getopts 'O:C:' opt
	do
		case "$opt" in
			(O) subopts=("${(@P)OPTARG}")  ;;
			(C) curcontext="${curcontext%:*}:$OPTARG"  ;;
		esac
	done
	shift OPTIND-1
	[[ "$1" = -(|-) ]] && shift
	mesgs=() 
	_tags "${(@)argv%%:*}"
	while _tags
	do
		for def
		do
			if _requested "${def%%:*}"
			then
				descr="${${def#*:}%%:*}" 
				action="${def#*:*:}" 
				_description "${def%%:*}" expl "$descr"
				if [[ "$action" = \ # ]]
				then
					mesgs=("$mesgs[@]" "${def%%:*}:$descr") 
				elif [[ "$action" = \(\(*\)\) ]]
				then
					eval ws\=\( "${action[3,-3]}" \)
					_describe -t "${def%%:*}" "$descr" ws -M 'r:|[_-]=* r:|=*' "$subopts[@]"
				elif [[ "$action" = \(*\) ]]
				then
					_all_labels "${def%%:*}" expl "$descr" compadd "$subopts[@]" - ${=action[2,-2]}
				elif [[ "$action" = \{*\} ]]
				then
					while _next_label "${def%%:*}" expl "$descr"
					do
						eval "$action[2,-2]"
					done
				elif [[ "$action" = \ * ]]
				then
					eval "action=( $action )"
					while _next_label "${def%%:*}" expl "$descr"
					do
						"$action[@]"
					done
				else
					eval "action=( $action )"
					while _next_label "${def%%:*}" expl "$descr"
					do
						"$action[1]" "$subopts[@]" "$expl[@]" "${(@)action[2,-1]}"
					done
				fi
			fi
		done
		[[ nm -ne compstate[nmatches] ]] && return 0
	done
	for descr in "$mesgs[@]"
	do
		_message -e "${descr%%:*}" "${descr#*:}"
	done
	return 1
}
analyseplugin () {
	# undefined
	builtin autoload -XUz
}
ant () {
	# undefined
	builtin autoload -XUz
}
antiword () {
	# undefined
	builtin autoload -XUz
}
apachectl () {
	# undefined
	builtin autoload -XUz
}
apm () {
	# undefined
	builtin autoload -XUz
}
approximate () {
	# undefined
	builtin autoload -XUz
}
apt () {
	# undefined
	builtin autoload -XUz
}
apt-file () {
	# undefined
	builtin autoload -XUz
}
apt-move () {
	# undefined
	builtin autoload -XUz
}
apt-show-versions () {
	# undefined
	builtin autoload -XUz
}
aptitude () {
	# undefined
	builtin autoload -XUz
}
arch_archives () {
	# undefined
	builtin autoload -XUz
}
arch_namespace () {
	# undefined
	builtin autoload -XUz
}
arg_compile () {
	# undefined
	builtin autoload -XUz
}
arguments () {
	# undefined
	builtin autoload -XUz
}
arp () {
	# undefined
	builtin autoload -XUz
}
arping () {
	# undefined
	builtin autoload -XUz
}
arrays () {
	# undefined
	builtin autoload -XUz
}
assign () {
	# undefined
	builtin autoload -XUz
}
at () {
	# undefined
	builtin autoload -XUz
}
attr () {
	# undefined
	builtin autoload -XUz
}
auto-apt () {
	# undefined
	builtin autoload -XUz
}
autocd () {
	_command_names
	local ret=$?
	[[ -o autocd ]] && _cd || return ret
}
awk () {
	# undefined
	builtin autoload -XUz
}
axi-cache () {
	# undefined
	builtin autoload -XUz
}
bash_completions () {
	# undefined
	builtin autoload -XUz
}
baz () {
	# undefined
	builtin autoload -XUz
}
be_name () {
	# undefined
	builtin autoload -XUz
}
beadm () {
	# undefined
	builtin autoload -XUz
}
bind_addresses () {
	# undefined
	builtin autoload -XUz
}
bindkey () {
	# undefined
	builtin autoload -XUz
}
bison () {
	# undefined
	builtin autoload -XUz
}
bittorrent () {
	# undefined
	builtin autoload -XUz
}
bogofilter () {
	# undefined
	builtin autoload -XUz
}
brace_parameter () {
	# undefined
	builtin autoload -XUz
}
brctl () {
	# undefined
	builtin autoload -XUz
}
bsd_pkg () {
	# undefined
	builtin autoload -XUz
}
bts () {
	# undefined
	builtin autoload -XUz
}
bug () {
	# undefined
	builtin autoload -XUz
}
builtin () {
	# undefined
	builtin autoload -XUz
}
bzip2 () {
	# undefined
	builtin autoload -XUz
}
bzr () {
	# undefined
	builtin autoload -XUz
}
cache_invalid () {
	# undefined
	builtin autoload -XUz
}
cal () {
	# undefined
	builtin autoload -XUz
}
calendar () {
	# undefined
	builtin autoload -XUz
}
call_function () {
	# undefined
	builtin autoload -XUz
}
call_program () {
	local tmp
	if zstyle -s ":completion:${curcontext}:${1}" command tmp
	then
		if [[ "$tmp" = -* ]]
		then
			eval "$tmp[2,-1]" "$argv[2,-1]"
		else
			eval "$tmp"
		fi
	else
		eval "$argv[2,-1]"
	fi
}
call_whatis () {
	case "$(whatis --version)" in
		(whatis from *) local -A args
			zparseopts -D -A args s: r:
			apropos "${args[-r]:-"$@"}" | fgrep "($args[-s]" ;;
		(*) whatis "$@" ;;
	esac
}
canonical_paths () {
	# undefined
	builtin autoload -XUz
}
ccal () {
	# undefined
	builtin autoload -XUz
}
cd () {
	_cd_options () {
		_arguments -s '-q[quiet, no output or use of hooks]' '-s[refuse to use paths with symlinks]' '(-P)-L[retain symbolic links ignoring CHASE_LINKS]' '(-L)-P[resolve symbolic links as CHASE_LINKS]'
	}
	setopt localoptions nonomatch
	local expl ret=1 curarg
	integer argstart=2 noopts
	if (( CURRENT > 1 ))
	then
		while [[ $words[$argstart] = -* && argstart -lt CURRENT ]]
		do
			curarg=$words[$argstart] 
			[[ $curarg = -<-> ]] && break
			(( argstart++ ))
			[[ $curarg = -- ]] && noopts=1  && break
		done
	fi
	if [[ CURRENT -eq $((argstart+1)) ]]
	then
		local rep
		rep=(${~PWD/$words[$argstart]/*}~$PWD(-/)) 
		rep=(${${rep#${PWD%%$words[$argstart]*}}%${PWD#*$words[$argstart]}}) 
		(( $#rep )) && _wanted -C replacement strings expl replacement compadd -a rep
	else
		if [[ "$PREFIX" = (#b)(\~|)[^/]# && ( -n "$match[1]" || ( CURRENT -gt 1 && ! -o cdablevars ) ) ]]
		then
			_directory_stack && ret=0 
		fi
		if [[ $PREFIX != (\~|/|./|../)* ]]
		then
			local tmpcdpath alt
			alt=() 
			tmpcdpath=(${${(@)cdpath:#.}:#$PWD}) 
			(( $#tmpcdpath )) && alt=('path-directories:directory in cdpath:_path_files -W tmpcdpath -/') 
			if [[ -o cdablevars && -n "$PREFIX" && "$PREFIX" != <-> ]]
			then
				if [[ "$PREFIX" != */* ]]
				then
					alt=("$alt[@]" 'named-directories: : _tilde') 
				else
					local oipre="$IPREFIX" opre="$PREFIX" dirpre dir
					dirpre="${PREFIX%%/*}/" 
					IPREFIX="$IPREFIX$dirpre" 
					eval "dir=( ~$dirpre )"
					PREFIX="${PREFIX#*/}" 
					[[ $#dir -eq 1 && "$dir[1]" != "~$dirpre" ]] && _wanted named-directories expl 'directory after cdablevar' _path_files -W dir -/ && ret=0 
					PREFIX="$opre" 
					IPREFIX="$oipre" 
				fi
			fi
			[[ CURRENT -ne 1 || ( -z "$path[(r).]" && $PREFIX != */* ) ]] && alt=("${cdpath+local-}directories:${cdpath+local }directory:_path_files -/" "$alt[@]") 
			if [[ CURRENT -eq argstart && noopts -eq 0 && $PREFIX = -* ]] && zstyle -t ":completion:${curcontext}:options" complete-options
			then
				alt=("$service-options:$service option:_cd_options" "$alt[@]") 
			fi
			_alternative "$alt[@]" && ret=0 
			return ret
		fi
		[[ CURRENT -ne 1 ]] && _wanted directories expl directory _path_files -/ && ret=0 
		return ret
	fi
}
cd_options () {
	_arguments -s '-q[quiet, no output or use of hooks]' '-s[refuse to use paths with symlinks]' '(-P)-L[retain symbolic links ignoring CHASE_LINKS]' '(-L)-P[resolve symbolic links as CHASE_LINKS]'
}
cdbs-edit-patch () {
	# undefined
	builtin autoload -XUz
}
cdcd () {
	# undefined
	builtin autoload -XUz
}
cdr () {
	# undefined
	builtin autoload -XUz
}
cdrdao () {
	# undefined
	builtin autoload -XUz
}
cdrecord () {
	# undefined
	builtin autoload -XUz
}
chflags () {
	# undefined
	builtin autoload -XUz
}
chkconfig () {
	# undefined
	builtin autoload -XUz
}
chmod () {
	# undefined
	builtin autoload -XUz
}
chown () {
	# undefined
	builtin autoload -XUz
}
chrt () {
	# undefined
	builtin autoload -XUz
}
combination () {
	# undefined
	builtin autoload -XUz
}
comm () {
	# undefined
	builtin autoload -XUz
}
command () {
	# undefined
	builtin autoload -XUz
}
command_names () {
	local args defs ffilt
	zstyle -t ":completion:${curcontext}:commands" rehash && rehash
	zstyle -t ":completion:${curcontext}:functions" prefix-needed && [[ $PREFIX != [_.]* ]] && ffilt='[(I)[^_.]*]' 
	defs=('commands:external command:_path_commands') 
	[[ -n "$path[(r).]" || $PREFIX = */* ]] && defs=("$defs[@]" 'executables:executable file or directory:_path_files -/g \*\(-\*\)') 
	if [[ "$1" = -e ]]
	then
		shift
	else
		[[ "$1" = - ]] && shift
		defs=("$defs[@]" 'builtins:builtin command:compadd -k builtins' "functions:shell function:compadd -k 'functions$ffilt'" 'aliases:alias:compadd -k aliases' 'suffix-aliases:suffix alias:_suffix_alias_files' 'reserved-words:reserved word:compadd -k reswords' 'jobs:: _jobs -t' 'parameters:: _parameters -g "^*readonly*" -qS= -r "\n\t\- =["') 
	fi
	args=("$@") 
	local -a cmdpath
	if zstyle -a ":completion:${curcontext}" command-path cmdpath && [[ $#cmdpath -gt 0 ]]
	then
		local -a +h path
		local -A +h commands
		path=($cmdpath) 
	fi
	_alternative -O args "$defs[@]"
}
compdef () {
	# undefined
	builtin autoload -XUz
}
complete () {
	local comp name oldcontext ret=1 service
	typeset -T curcontext="$curcontext" ccarray
	oldcontext="$curcontext" 
	if [[ -n "$compcontext" ]]
	then
		if [[ "${(t)compcontext}" = *array* ]]
		then
			local expl
			_wanted values expl value compadd -a - compcontext
		elif [[ "${(t)compcontext}" = *assoc* ]]
		then
			local expl tmp i
			tmp=() 
			for i in "${(@k)compcontext[(R)*[^[:blank:]]]}"
			do
				tmp=("$tmp[@]" "${i}:${compcontext[$i]}") 
			done
			tmp=("$tmp[@]" "${(k@)compcontext[(R)[[:blank:]]#]}") 
			_describe -t values value tmp
		elif [[ "$compcontext" = *:*:* ]]
		then
			local tag="${${compcontext%%:*}:-values}"
			local descr="${${${compcontext#${tag}:}%%:*}:-value}"
			local action="${compcontext#${tag}:${descr}:}" expl ws ret=1
			case "$action" in
				(\ #) _message -e "$tag" "$descr" ;;
				(\(\(*\)\)) eval ws\=\( "${action[3,-3]}" \)
					_describe -t "$tag" "$descr" ws ;;
				(\(*\)) eval ws\=\( "${action[2,-2]}" \)
					_wanted "$tag" expl "$descr" compadd -a - ws ;;
				(\{*\}) _tags "$tag"
					while _tags
					do
						while _next_label "$tag" expl "$descr"
						do
							eval "$action[2,-2]" && ret=0 
						done
						(( ret )) || break
					done ;;
				(\ *) eval ws\=\( "$action" \)
					_tags "$tag"
					while _tags
					do
						while _next_label "$tag" expl "$descr"
						do
							"$ws[@]"
						done
						(( ret )) || break
					done ;;
				(*) eval ws\=\( "$action" \)
					_tags "$tag"
					while _tags
					do
						while _next_label "$tag" expl "$descr"
						do
							"$ws[1]" "$expl[@]" "${(@)ws[2,-1]}"
						done
						(( ret )) || break
					done ;;
			esac
		else
			ccarray[3]="$compcontext" 
			comp="$_comps[$compcontext]" 
			[[ -n "$comp" ]] && eval "$comp"
		fi
		return
	fi
	comp="$_comps[-first-]" 
	if [[ -n "$comp" ]]
	then
		service="${_services[-first-]:--first-}" 
		ccarray[3]=-first- 
		eval "$comp" && ret=0 
		if [[ "$_compskip" = all ]]
		then
			_compskip= 
			return ret
		fi
	fi
	[[ -n $compstate[vared] ]] && compstate[context]=vared 
	ret=1 
	if [[ "$compstate[context]" = command ]]
	then
		curcontext="$oldcontext" 
		_normal -s && ret=0 
	else
		local cname="-${compstate[context]:s/_/-/}-"
		ccarray[3]="$cname" 
		comp="$_comps[$cname]" 
		service="${_services[$cname]:-$cname}" 
		if [[ -z "$comp" ]]
		then
			if [[ "$_compskip" = *default* ]]
			then
				_compskip= 
				return 1
			fi
			comp="$_comps[-default-]" 
			service="${_services[-default-]:--default-}" 
		fi
		[[ -n "$comp" ]] && eval "$comp" && ret=0 
	fi
	_compskip= 
	return ret
}
complete_debug () {
	# undefined
	builtin autoload -XUz
}
complete_help () {
	# undefined
	builtin autoload -XUz
}
complete_help_generic () {
	# undefined
	builtin autoload -XUz
}
complete_tag () {
	# undefined
	builtin autoload -XUz
}
compress () {
	# undefined
	builtin autoload -XUz
}
condition () {
	# undefined
	builtin autoload -XUz
}
configure () {
	# undefined
	builtin autoload -XUz
}
coreadm () {
	# undefined
	builtin autoload -XUz
}
correct () {
	# undefined
	builtin autoload -XUz
}
correct_filename () {
	# undefined
	builtin autoload -XUz
}
correct_word () {
	# undefined
	builtin autoload -XUz
}
cowsay () {
	# undefined
	builtin autoload -XUz
}
cp () {
	# undefined
	builtin autoload -XUz
}
cpio () {
	# undefined
	builtin autoload -XUz
}
cplay () {
	# undefined
	builtin autoload -XUz
}
cryptsetup () {
	# undefined
	builtin autoload -XUz
}
cssh () {
	# undefined
	builtin autoload -XUz
}
csup () {
	# undefined
	builtin autoload -XUz
}
ctags_tags () {
	# undefined
	builtin autoload -XUz
}
cut () {
	# undefined
	builtin autoload -XUz
}
cvs () {
	# undefined
	builtin autoload -XUz
}
cvsup () {
	# undefined
	builtin autoload -XUz
}
cygcheck () {
	# undefined
	builtin autoload -XUz
}
cygpath () {
	# undefined
	builtin autoload -XUz
}
cygrunsrv () {
	# undefined
	builtin autoload -XUz
}
cygserver () {
	# undefined
	builtin autoload -XUz
}
cygstart () {
	# undefined
	builtin autoload -XUz
}
dak () {
	# undefined
	builtin autoload -XUz
}
darcs () {
	# undefined
	builtin autoload -XUz
}
date () {
	# undefined
	builtin autoload -XUz
}
dchroot () {
	# undefined
	builtin autoload -XUz
}
dchroot-dsa () {
	# undefined
	builtin autoload -XUz
}
dcop () {
	# undefined
	builtin autoload -XUz
}
dd () {
	# undefined
	builtin autoload -XUz
}
deb_packages () {
	# undefined
	builtin autoload -XUz
}
debchange () {
	# undefined
	builtin autoload -XUz
}
debdiff () {
	# undefined
	builtin autoload -XUz
}
debfoster () {
	# undefined
	builtin autoload -XUz
}
debsign () {
	# undefined
	builtin autoload -XUz
}
default () {
	# undefined
	builtin autoload -XUz
}
defaults () {
	# undefined
	builtin autoload -XUz
}
delimiters () {
	# undefined
	builtin autoload -XUz
}
describe () {
	# undefined
	builtin autoload -XUz
}
description () {
	local name gropt nopt xopt format gname hidden hide match opts tag sort
	opts=() 
	gropt=(-J) 
	xopt=(-X) 
	nopt=() 
	zparseopts -K -D -a nopt 1 2 V=gropt J=gropt x=xopt
	3="${${3##[[:blank:]]#}%%[[:blank:]]#}" 
	[[ -n "$3" ]] && _lastdescr=("$_lastdescr[@]" "$3") 
	zstyle -s ":completion:${curcontext}:$1" group-name gname && [[ -z "$gname" ]] && gname="$1" 
	_setup "$1" "${gname:--default-}"
	name="$2" 
	zstyle -s ":completion:${curcontext}:$1" format format || zstyle -s ":completion:${curcontext}:descriptions" format format
	if zstyle -s ":completion:${curcontext}:$1" hidden hidden && [[ "$hidden" = (all|yes|true|1|on) ]]
	then
		[[ "$hidden" = all ]] && format='' 
		opts=(-n) 
	fi
	zstyle -s ":completion:${curcontext}:$1" matcher match && opts=($opts -M "$match") 
	[[ -n "$_matcher" ]] && opts=($opts -M "$_matcher") 
	if {
			zstyle -s ":completion:${curcontext}:$1" sort sort || zstyle -s ":completion:${curcontext}:" sort sort
		} && [[ "$gropt" = -J && $sort != menu ]]
	then
		if [[ "$sort" = (yes|true|1|on) ]]
		then
			gropt=(-J) 
		else
			gropt=(-V) 
		fi
	fi
	if [[ -z "$_comp_no_ignore" ]]
	then
		zstyle -a ":completion:${curcontext}:$1" ignored-patterns _comp_ignore || _comp_ignore=() 
		zstyle -s ":completion:${curcontext}:$1" ignore-line hidden && case "$hidden" in
			(true|yes|on|1) _comp_ignore=("$_comp_ignore[@]" ${(q)"${words[@]}"})  ;;
			(current) _comp_ignore=("$_comp_ignore[@]" "${(q)words[CURRENT]}")  ;;
			(current-shown) [[ "$compstate[old_list]" = *shown* ]] && _comp_ignore=("$_comp_ignore[@]" "${(q)words[CURRENT]}")  ;;
			(other) _comp_ignore=("$_comp_ignore[@]" "${(@q)words[1,CURRENT-1]}" "${(@q)words[CURRENT+1,-1]}")  ;;
		esac
		(( $#_comp_ignore )) && opts=(-F _comp_ignore $opts) 
	else
		_comp_ignore=() 
	fi
	tag="$1" 
	shift 2
	if [[ -z "$1" && $# -eq 1 ]]
	then
		format= 
	elif [[ -n "$format" ]]
	then
		zformat -f format "$format" "d:$1" "${(@)argv[2,-1]}"
	fi
	if [[ -n "$gname" ]]
	then
		if [[ -n "$format" ]]
		then
			set -A "$name" "$opts[@]" "$nopt[@]" "$gropt" "$gname" "$xopt" "$format"
		else
			set -A "$name" "$opts[@]" "$nopt[@]" "$gropt" "$gname"
		fi
	else
		if [[ -n "$format" ]]
		then
			set -A "$name" "$opts[@]" "$nopt[@]" "$gropt" -default- "$xopt" "$format"
		else
			set -A "$name" "$opts[@]" "$nopt[@]" "$gropt" -default-
		fi
	fi
	if ! (( ${funcstack[2,-1][(I)_description]} ))
	then
		local fakestyle descr
		for fakestyle in fake fake-always
		do
			zstyle -a ":completion:${curcontext}:$tag" $fakestyle match || continue
			descr=("${(@M)match:#*[^\\]:*}") 
			opts=("${(@P)name}") 
			if [[ $fakestyle = fake-always && $opts[1,2] = "-F _comp_ignore" ]]
			then
				shift 2 opts
			fi
			compadd "${(@)opts}" - "${(@)${(@)match:#*[^\\]:*}:s/\\:/:/}"
			(( $#descr )) && _describe -t "$tag" '' descr "${(@)opts}"
		done
	fi
	return 0
}
devtodo () {
	# undefined
	builtin autoload -XUz
}
dhclient () {
	# undefined
	builtin autoload -XUz
}
dhcpinfo () {
	# undefined
	builtin autoload -XUz
}
dict () {
	# undefined
	builtin autoload -XUz
}
dict_words () {
	# undefined
	builtin autoload -XUz
}
diff () {
	# undefined
	builtin autoload -XUz
}
diff_options () {
	# undefined
	builtin autoload -XUz
}
diffstat () {
	# undefined
	builtin autoload -XUz
}
dir_list () {
	# undefined
	builtin autoload -XUz
}
directories () {
	# undefined
	builtin autoload -XUz
}
directory_stack () {
	setopt localoptions nonomatch
	local expl list lines revlines disp sep
	zstyle -s ":completion:${curcontext}:directory-stack" list-separator sep || sep=-- 
	[[ $PREFIX = [-+]* ]] || return 1
	if zstyle -T ":completion:${curcontext}:directory-stack" verbose
	then
		lines=("${dirstack[@]}") 
		if [[ ( $PREFIX[1] = - && ! -o pushdminus ) || ( $PREFIX[1] = + && -o pushdminus ) ]]
		then
			integer i
			revlines=($lines) 
			for ((i = 1; i <= $#lines; i++ )) do
				lines[$i]="$((i-1)) $sep ${revlines[-$i]##[0-9]#[	 ]#}" 
			done
		else
			for ((i = 1; i <= $#lines; i++ )) do
				lines[$i]="$i $sep ${lines[$i]##[0-9]#[	 ]#}" 
			done
		fi
		list=(${PREFIX[1]}${^lines%% *}) 
		disp=(-ld lines) 
	else
		list=(${PREFIX[1]}{0..${#dirstack}}) 
		disp=() 
	fi
	_wanted -V directory-stack expl 'directory stack' compadd "$@" "$disp[@]" -Q -a list
}
dirs () {
	# undefined
	builtin autoload -XUz
}
disable () {
	# undefined
	builtin autoload -XUz
}
dispatch () {
	local comp pat val name i ret=1 _compskip="$_compskip"
	local curcontext="$curcontext" service str noskip
	local -a match mbegin mend
	if [[ "$1" = -s ]]
	then
		noskip=yes 
		shift
	fi
	[[ -z "$noskip" ]] && _compskip= 
	curcontext="${curcontext%:*:*}:${1}:" 
	shift
	if [[ "$_compskip" != (all|*patterns*) ]]
	then
		for str in "$@"
		do
			[[ -n "$str" ]] || continue
			service="${_services[$str]:-$str}" 
			for i in "${(@)_patcomps[(K)$str]}"
			do
				if [[ $i = (#b)"="([^=]#)"="(*) ]]
				then
					service=$match[1] 
					i=$match[2] 
				fi
				eval "$i" && ret=0 
				if [[ "$_compskip" = *patterns* ]]
				then
					break
				elif [[ "$_compskip" = all ]]
				then
					_compskip='' 
					return ret
				fi
			done
		done
	fi
	ret=1 
	for str in "$@"
	do
		[[ -n "$str" ]] || continue
		str=${(Q)str} 
		name="$str" 
		comp="${_comps[$str]}" 
		service="${_services[$str]:-$str}" 
		[[ -z "$comp" ]] || break
	done
	if [[ -n "$comp" && "$name" != "${argv[-1]}" ]]
	then
		_compskip=patterns 
		eval "$comp" && ret=0 
		[[ "$_compskip" = (all|*patterns*) ]] && return ret
	fi
	if [[ "$_compskip" != (all|*patterns*) ]]
	then
		for str
		do
			[[ -n "$str" ]] || continue
			service="${_services[$str]:-$str}" 
			for i in "${(@)_postpatcomps[(K)$str]}"
			do
				_compskip=default 
				eval "$i" && ret=0 
				if [[ "$_compskip" = *patterns* ]]
				then
					break
				elif [[ "$_compskip" = all ]]
				then
					_compskip='' 
					return ret
				fi
			done
		done
	fi
	[[ "$name" = "${argv[-1]}" && -n "$comp" && "$_compskip" != (all|*default*) ]] && service="${_services[$name]:-$name}"  && eval "$comp" && ret=0 
	_compskip='' 
	return ret
}
django () {
	# undefined
	builtin autoload -XUz
}
dladm () {
	# undefined
	builtin autoload -XUz
}
dlocate () {
	# undefined
	builtin autoload -XUz
}
dmidecode () {
	# undefined
	builtin autoload -XUz
}
domains () {
	# undefined
	builtin autoload -XUz
}
dpatch-edit-patch () {
	# undefined
	builtin autoload -XUz
}
dpkg () {
	# undefined
	builtin autoload -XUz
}
dpkg-buildpackage () {
	# undefined
	builtin autoload -XUz
}
dpkg-cross () {
	# undefined
	builtin autoload -XUz
}
dpkg-repack () {
	# undefined
	builtin autoload -XUz
}
dpkg_source () {
	# undefined
	builtin autoload -XUz
}
dput () {
	# undefined
	builtin autoload -XUz
}
dtrace () {
	# undefined
	builtin autoload -XUz
}
du () {
	# undefined
	builtin autoload -XUz
}
dumpadm () {
	# undefined
	builtin autoload -XUz
}
dumper () {
	# undefined
	builtin autoload -XUz
}
dupload () {
	# undefined
	builtin autoload -XUz
}
dvi () {
	# undefined
	builtin autoload -XUz
}
dynamic_directory_name () {
	# undefined
	builtin autoload -XUz
}
ecasound () {
	# undefined
	builtin autoload -XUz
}
echotc () {
	# undefined
	builtin autoload -XUz
}
echoti () {
	# undefined
	builtin autoload -XUz
}
elinks () {
	# undefined
	builtin autoload -XUz
}
elm () {
	# undefined
	builtin autoload -XUz
}
email_addresses () {
	# undefined
	builtin autoload -XUz
}
emulate () {
	# undefined
	builtin autoload -XUz
}
enable () {
	# undefined
	builtin autoload -XUz
}
enscript () {
	# undefined
	builtin autoload -XUz
}
env () {
	# undefined
	builtin autoload -XUz
}
equal () {
	# undefined
	builtin autoload -XUz
}
espeak () {
	# undefined
	builtin autoload -XUz
}
ethtool () {
	# undefined
	builtin autoload -XUz
}
expand () {
	setopt localoptions nonomatch
	[[ _matcher_num -gt 1 ]] && return 1
	local exp word sort expr expl subd suf=" " force opt asp tmp opre pre epre
	local continue=0
	(( $# )) && while getopts gsco opt
	do
		force="$force$opt" 
	done
	if [[ "$funcstack[2]" = _prefix ]]
	then
		word="$IPREFIX$PREFIX$SUFFIX" 
	else
		word="$IPREFIX$PREFIX$SUFFIX$ISUFFIX" 
	fi
	[[ "$word" = *\$(|\{[^\}]#) || ( "$word" = *\$[a-zA-Z0-9_]## && $+parameters[${word##*\$}] -eq 0 ) ]] && return 1
	zstyle -T ":completion:${curcontext}:" suffix && [[ "$word" = (\~*/*|*\$(|[=~#^+])[a-zA-Z0-9_\[\]]##[^a-zA-Z0-9_\[\]]|*\$\{*\}?) && "${(e)word}" != (#s)(*[^\\]|)[][^*?\(\)\<\>\{\}\|]* ]] && return 1
	zstyle -s ":completion:${curcontext}:" accept-exact tmp || [[ ! -o recexact ]] || tmp=1 
	if [[ "$tmp" != (yes|true|on|1) ]]
	then
		{
			[[ "$word" = \~(|[-+]) || ( "$word" = \~[-+][1-9]## && $word[3,-1] -le $#dirstack ) ]] && return 1
		}
		{
			[[ ( "$word" = \~* && ${#userdirs[(I)${word[2,-1]}*]}+${#nameddirs[(I)${word[2,-1]}*]} -gt 1 ) || ( "$word" = *\$[a-zA-Z0-9_]## && ${#parameters[(I)${word##*\$}*]} -ne 1 ) ]] && continue=1 
		}
		[[ continue -eq 1 && "$tmp" != continue ]] && return 1
	fi
	exp=("$word") 
	if [[ "$force" = *s* ]] || zstyle -T ":completion:${curcontext}:" substitute
	then
		if [[ ! $_comp_caller_options[ignorebraces] = on && "${#${exp}//[^\{]}" = "${#${exp}//[^\}]}" ]]
		then
			local otmp
			tmp=${(q)word} 
			while [[ $#tmp != $#otmp ]]
			do
				otmp=$tmp 
				tmp=${tmp//(#b)\\\$\\\{(([^\{\}]|\\\\{|\\\\})#)([^\\])\\\}/\\$\\\\{${match[1]}${match[3]}\\\\}} 
			done
			eval exp\=\( ${tmp:gs/\\{/\{/:gs/\\}/\}/} \) 2> /dev/null
		fi
		setopt aliases
		eval 'exp=( ${${(e)exp//\\[ 	
]/ }//(#b)([ 	
])/\\$match[1]} )' 2> /dev/null
		setopt NO_aliases
	else
		exp=(${exp:s/\\\$/\$}) 
	fi
	[[ -z "$exp" ]] && exp=("$word") 
	subd=("$exp[@]") 
	[[ "$force" = *g* ]] || zstyle -T ":completion:${curcontext}:" glob && eval 'exp=( ${~exp//(#b)\\[ 	
]/$match[1]} ); exp=( ${(q)exp} )' 2> /dev/null
	(( $#exp )) || exp=("$subd[@]") 
	[[ $#exp -eq 1 && "${exp[1]//\\}" = "${word//\\}"(|\(N\)) ]] && return 1
	{
		[[ "$force" = *o* ]] || zstyle -t ":completion:${curcontext}:" subst-globs-only
	} && [[ "$subd" = "$exp"(|\(N\)) ]] && return 1
	zstyle -s ":completion:${curcontext}:" keep-prefix tmp || tmp=changed 
	if [[ "$word" = (\~*/*|*\$*/*) && "$tmp" = (yes|true|on|1|changed) ]]
	then
		if [[ "$word" = *\$* ]]
		then
			opre="${(M)word##*\$[^/]##/}" 
		else
			opre="${word%%/*}" 
		fi
		eval 'epre=( ${(e)~opre} )' 2> /dev/null
		if [[ -n "$epre" && $#epre -eq 1 ]]
		then
			pre="${(q)epre[1]}" 
			[[ ( "$tmp" != changed || $#exp -gt 1 || "${opre}${exp[1]#${pre}}" != "$word" ) && "${exp[1]}" = $pre* ]] && exp=(${opre}${^exp#${pre}}) 
		fi
		[[ $#exp -eq 1 && "$exp[1]" = "$word" ]] && return 1
	fi
	zstyle -s ":completion:${curcontext}:" sort sort
	[[ "$sort" = (yes|true|1|on) ]] && exp=("${(@o)exp}") 
	if zstyle -s ":completion:${curcontext}:" add-space tmp
	then
		if [[ "$tmp" != *subst* || "$word" != *\$* || "$exp[1]" = *\$* ]]
		then
			[[ "$tmp" = *file* ]] && asp=file 
			[[ "$tmp" = *(yes|true|1|on|subst)* ]] && asp="yes$asp" 
		fi
	else
		asp=file 
	fi
	if (( $#exp == 1 ))
	then
		if [[ -d ${exp[1]/${opre}/${pre}} && "$exp[1]" != */ ]]
		then
			suf=/ 
		elif [[ "$asp" = yes* || ( "$asp" = *file && -f "${exp[1]/${opre}/${pre}}" ) ]]
		then
			suf=' ' 
		else
			suf= 
		fi
	fi
	if [[ -z "$compstate[insert]" ]]
	then
		if [[ "$sort" = menu ]]
		then
			_description expansions expl expansions "o:$word"
		else
			_description -V expansions expl expansions "o:$word"
		fi
		compadd "$expl[@]" -UQ -qS "$suf" -a exp
	else
		_tags all-expansions expansions original
		if [[ $#exp -gt 1 ]] && _requested expansions
		then
			local i j normal space dir
			if [[ "$sort" = menu ]]
			then
				_description expansions expl expansions "o:$word"
			else
				_description -V expansions expl expansions "o:$word"
			fi
			normal=() 
			space=() 
			dir=() 
			for i in "$exp[@]"
			do
				j="${i/${opre}/${pre}}" 
				if [[ -d "$j" && "$i" != */ ]]
				then
					dir=("$dir[@]" "$i") 
				elif [[ "$asp" = yes* || ( "$asp" = *file && -f "$j" ) ]]
				then
					space=("$space[@]" "$i") 
				else
					normal=("$normal[@]" "$i") 
				fi
			done
			(( $#dir )) && compadd "$expl[@]" -UQ -qS/ -a dir
			(( $#space )) && compadd "$expl[@]" -UQ -qS " " -a space
			(( $#normal )) && compadd "$expl[@]" -UQ -qS "" -a normal
		fi
		if _requested all-expansions expl 'all expansions'
		then
			local disp dstr
			if [[ "${#${exp}}" -ge COLUMNS ]]
			then
				disp=(-ld dstr) 
				dstr=("${(r:COLUMNS-5:)exp} ...") 
			else
				disp=() 
			fi
			[[ -o multios ]] && exp=($exp[1] $compstate[redirect]${^exp[2,-1]}) 
			compadd "$disp[@]" "$expl[@]" -UQ -qS "$suf" - "$exp"
		fi
		_requested original expl original && compadd "$expl[@]" -UQ - "$word"
		compstate[insert]=menu 
	fi
	return continue
}
expand_alias () {
	# undefined
	builtin autoload -XUz
}
expand_word () {
	# undefined
	builtin autoload -XUz
}
fakeroot () {
	# undefined
	builtin autoload -XUz
}
fc () {
	# undefined
	builtin autoload -XUz
}
feh () {
	# undefined
	builtin autoload -XUz
}
fetch () {
	# undefined
	builtin autoload -XUz
}
fetchmail () {
	# undefined
	builtin autoload -XUz
}
ffmpeg () {
	# undefined
	builtin autoload -XUz
}
figlet () {
	# undefined
	builtin autoload -XUz
}
file_descriptors () {
	# undefined
	builtin autoload -XUz
}
file_systems () {
	# undefined
	builtin autoload -XUz
}
files () {
	local opts tmp glob pat pats expl tag i def descr end ign ret=1 match tried
	local type sdef ignvars ignvar
	zparseopts -a opts '/=tmp' 'f=tmp' 'g+:-=tmp' q n 1 2 P: S: r: R: W: X+: M+: F: J+: V+:
	type="${(@j::M)${(@)tmp#-}#?}" 
	if (( $tmp[(I)-g*] ))
	then
		glob="${${${${(@M)tmp:#-g*}#-g}##[[:blank:]]#}%%[[:blank:]]#}" 
		[[ "$glob" = *[^\\][[:blank:]]* ]] && glob="{${glob//(#b)([^\\])[[:blank:]]##/${match[1]},}}" 
		[[ "$glob" = (#b)(*\()([^\|\~]##\)) && $match[2] != \#q* ]] && glob="${match[1]}#q${match[2]}" 
	fi
	tmp=$opts[(I)-F] 
	if (( tmp ))
	then
		ignvars=($=opts[tmp+1]) 
		if [[ $ignvars = _comp_ignore ]]
		then
			ign=($_comp_ignore) 
		else
			ign=() 
			for ignvar in $ignvars
			do
				ign+=(${(P)ignvar}) 
			done
			opts[tmp+1]=_comp_ignore 
		fi
	else
		ign=() 
	fi
	if zstyle -a ":completion:${curcontext}:" file-patterns tmp
	then
		[[ "$type" = */* ]] && glob="$glob,*(-/)" 
		pats=() 
		for i in ${tmp//\%p/${${glob:-\*}//:/\\:}}
		do
			if [[ $i = *[^\\]:* ]]
			then
				pats=("$pats[@]" " $i ") 
			else
				pats=("$pats[@]" " ${i}:files ") 
			fi
		done
	elif zstyle -t ":completion:${curcontext}:" list-dirs-first
	then
		if [[ "$type" = *g* ]]
		then
			if [[ "$glob" = (#b)(*\(\#q)(*\)) ]]
			then
				[[ $match[2] != \^-/* ]] && glob="${match[1]}^-/,${match[2]}" 
			else
				glob="$glob(#q^-/)" 
			fi
			pats=(" *(-/):directories:directories ${glob//:/\\:}:globbed-files") 
		elif [[ "$type" = */* ]]
		then
			pats=('*(-/):directories ' '*:all-files ') 
		else
			pats=('*(-/):directories:directories *(^-/):other-files ') 
		fi
	else
		if [[ "$type" = *g* ]]
		then
			pats=(" ${glob//:/\\:}:globbed-files *(-/):directories" '*:all-files ') 
		elif [[ "$type" = */* ]]
		then
			pats=('*(-/):directories ' '*:all-files ') 
		else
			pats=('*:all-files ') 
		fi
	fi
	tried=() 
	for def in "$pats[@]"
	do
		eval "def=( ${${def//\\:/\\\\\\:}//(#b)([][()|*?^#~<>])/\\${match[1]}} )"
		tmp="${(@M)def#*[^\\]:}" 
		(( $tried[(I)${(q)tmp}] )) && continue
		tried=("$tried[@]" "$tmp") 
		for sdef in "$def[@]"
		do
			tag="${${sdef#*[^\\]:}%%:*}" 
			pat="${${sdef%%:${tag}*}//\\:/:}" 
			if [[ "$sdef" = *:${tag}:* ]]
			then
				descr="${(Q)sdef#*:${tag}:}" 
			else
				if (( $opts[(I)-X] ))
				then
					descr= 
				else
					descr=file 
				fi
				end=yes 
			fi
			_tags "$tag"
			while _tags
			do
				_comp_ignore=() 
				while _next_label "$tag" expl "$descr"
				do
					_comp_ignore=($_comp_ignore $ign) 
					if [[ -n "$end" ]]
					then
						_path_files -g "$pat" "$opts[@]" "$expl[@]" && ret=0 
					else
						_path_files "$expl[@]" -g "$pat" "$opts[@]" && ret=0 
					fi
				done
				(( ret )) || break
			done
			[[ "$pat" = '*' ]] && return ret
		done
		(( ret )) || return 0
	done
	return 1
}
find () {
	# undefined
	builtin autoload -XUz
}
finger () {
	# undefined
	builtin autoload -XUz
}
fink () {
	# undefined
	builtin autoload -XUz
}
first () {
	
}
flasher () {
	# undefined
	builtin autoload -XUz
}
flex () {
	# undefined
	builtin autoload -XUz
}
floppy () {
	# undefined
	builtin autoload -XUz
}
flowadm () {
	# undefined
	builtin autoload -XUz
}
fmadm () {
	# undefined
	builtin autoload -XUz
}
fortune () {
	# undefined
	builtin autoload -XUz
}
freebsd-update () {
	# undefined
	builtin autoload -XUz
}
fsh () {
	# undefined
	builtin autoload -XUz
}
fstat () {
	# undefined
	builtin autoload -XUz
}
functions () {
	# undefined
	builtin autoload -XUz
}
fuse_arguments () {
	# undefined
	builtin autoload -XUz
}
fuse_values () {
	# undefined
	builtin autoload -XUz
}
fuser () {
	# undefined
	builtin autoload -XUz
}
fusermount () {
	# undefined
	builtin autoload -XUz
}
gcc () {
	# undefined
	builtin autoload -XUz
}
gcore () {
	# undefined
	builtin autoload -XUz
}
gdb () {
	# undefined
	builtin autoload -XUz
}
generic () {
	# undefined
	builtin autoload -XUz
}
genisoimage () {
	# undefined
	builtin autoload -XUz
}
getclip () {
	# undefined
	builtin autoload -XUz
}
getconf () {
	# undefined
	builtin autoload -XUz
}
getent () {
	# undefined
	builtin autoload -XUz
}
getfacl () {
	# undefined
	builtin autoload -XUz
}
getmail () {
	# undefined
	builtin autoload -XUz
}
git () {
	# undefined
	builtin autoload -XUz
}
git-buildpackage () {
	# undefined
	builtin autoload -XUz
}
global () {
	# undefined
	builtin autoload -XUz
}
global_tags () {
	# undefined
	builtin autoload -XUz
}
globflags () {
	# undefined
	builtin autoload -XUz
}
globqual_delims () {
	# undefined
	builtin autoload -XUz
}
globquals () {
	# undefined
	builtin autoload -XUz
}
gnome-gv () {
	# undefined
	builtin autoload -XUz
}
gnu_generic () {
	# undefined
	builtin autoload -XUz
}
gnupod () {
	# undefined
	builtin autoload -XUz
}
gnutls () {
	# undefined
	builtin autoload -XUz
}
go () {
	# undefined
	builtin autoload -XUz
}
gpg () {
	# undefined
	builtin autoload -XUz
}
gphoto2 () {
	# undefined
	builtin autoload -XUz
}
gprof () {
	# undefined
	builtin autoload -XUz
}
gqview () {
	# undefined
	builtin autoload -XUz
}
gradle () {
	# undefined
	builtin autoload -XUz
}
graphicsmagick () {
	# undefined
	builtin autoload -XUz
}
grep () {
	# undefined
	builtin autoload -XUz
}
grep-excuses () {
	# undefined
	builtin autoload -XUz
}
groff () {
	# undefined
	builtin autoload -XUz
}
groups () {
	# undefined
	builtin autoload -XUz
}
growisofs () {
	# undefined
	builtin autoload -XUz
}
gs () {
	# undefined
	builtin autoload -XUz
}
guard () {
	# undefined
	builtin autoload -XUz
}
guilt () {
	# undefined
	builtin autoload -XUz
}
gv () {
	# undefined
	builtin autoload -XUz
}
gzip () {
	# undefined
	builtin autoload -XUz
}
hash () {
	# undefined
	builtin autoload -XUz
}
have_glob_qual () {
	local complete
	[[ $2 = complete ]] && complete=")" 
	[[ -z $compstate[quote] && ( ( $_comp_caller_options[bareglobqual] = on && $1 = (#b)(((*[^\\\$]|)(\\\\)#)\()([^\)\|\~]#)$complete && ${#match[1]} -gt 1 ) || ( $_comp_caller_options[extendedglob] = on && $1 = (#b)(((*[^\\\$]|)(\\\\)#)"(#q")([^\)]#)$complete ) ) ]]
}
hdiutil () {
	# undefined
	builtin autoload -XUz
}
hg () {
	# undefined
	builtin autoload -XUz
}
history () {
	# undefined
	builtin autoload -XUz
}
history_complete_word () {
	# undefined
	builtin autoload -XUz
}
history_modifiers () {
	# undefined
	builtin autoload -XUz
}
hosts () {
	# undefined
	builtin autoload -XUz
}
hwinfo () {
	# undefined
	builtin autoload -XUz
}
iconv () {
	# undefined
	builtin autoload -XUz
}
id () {
	# undefined
	builtin autoload -XUz
}
ifconfig () {
	# undefined
	builtin autoload -XUz
}
iftop () {
	# undefined
	builtin autoload -XUz
}
ignored () {
	# undefined
	builtin autoload -XUz
}
imagemagick () {
	# undefined
	builtin autoload -XUz
}
in_vared () {
	# undefined
	builtin autoload -XUz
}
inetadm () {
	# undefined
	builtin autoload -XUz
}
init_d () {
	# undefined
	builtin autoload -XUz
}
initctl () {
	# undefined
	builtin autoload -XUz
}
invoke-rc.d () {
	# undefined
	builtin autoload -XUz
}
ionice () {
	# undefined
	builtin autoload -XUz
}
ip () {
	# undefined
	builtin autoload -XUz
}
ipadm () {
	# undefined
	builtin autoload -XUz
}
ipset () {
	# undefined
	builtin autoload -XUz
}
iptables () {
	# undefined
	builtin autoload -XUz
}
irssi () {
	# undefined
	builtin autoload -XUz
}
ispell () {
	# undefined
	builtin autoload -XUz
}
iwconfig () {
	# undefined
	builtin autoload -XUz
}
java () {
	# undefined
	builtin autoload -XUz
}
java_class () {
	# undefined
	builtin autoload -XUz
}
jobs () {
	local expl disp jobs job jids pfx='%' desc how expls sep
	if [[ "$1" = -t ]]
	then
		zstyle -T ":completion:${curcontext}:jobs" prefix-needed && [[ "$PREFIX" != %* && compstate[nmatches] -ne 0 ]] && return 1
		shift
	fi
	zstyle -t ":completion:${curcontext}:jobs" prefix-hidden && pfx='' 
	zstyle -T ":completion:${curcontext}:jobs" verbose && desc=yes 
	if [[ "$1" = -r ]]
	then
		jids=("${(@k)jobstates[(R)running*]}") 
		shift
		expls='running job' 
	elif [[ "$1" = -s ]]
	then
		jids=("${(@k)jobstates[(R)suspended*]}") 
		shift
		expls='suspended job' 
	else
		[[ "$1" = - ]] && shift
		jids=("${(@k)jobtexts}") 
		expls=job 
	fi
	if [[ -n "$desc" ]]
	then
		disp=() 
		zstyle -s ":completion:${curcontext}:jobs" list-separator sep || sep=-- 
		for job in "$jids[@]"
		do
			[[ -n "$desc" ]] && disp=("$disp[@]" "${pfx}${(r:2:: :)job} $sep ${(r:COLUMNS-8:: :)jobtexts[$job]}") 
		done
	fi
	zstyle -s ":completion:${curcontext}:jobs" numbers how
	if [[ "$how" = (yes|true|on|1) ]]
	then
		jobs=("$jids[@]") 
	else
		local texts i text str tmp num max=0
		texts=("$jobtexts[@]") 
		jobs=() 
		for i in "$jids[@]"
		do
			text="$jobtexts[$i]" 
			str="${text%% *}" 
			if [[ "$text" = *\ * ]]
			then
				text="${text#* }" 
			else
				text="" 
			fi
			tmp=("${(@M)texts:#${str}*}") 
			num=1 
			while [[ -n "$text" && $#tmp -ge 2 ]]
			do
				str="${str} ${text%% *}" 
				if [[ "$text" = *\ * ]]
				then
					text="${text#* }" 
				else
					text="" 
				fi
				tmp=("${(@M)texts:#${str}*}") 
				(( num++ ))
			done
			[[ num -gt max ]] && max="$num" 
			jobs=("$jobs[@]" "$str") 
		done
		if [[ "$how" = [0-9]## && max -gt how ]]
		then
			jobs=("$jids[@]") 
		else
			[[ -z "$pfx" && -n "$desc" ]] && disp=("${(@)disp#%}") 
		fi
	fi
	if [[ -n "$desc" ]]
	then
		_wanted jobs expl "$expls" compadd "$@" -ld disp - "%$^jobs[@]"
	else
		_wanted jobs expl "$expls" compadd "$@" - "%$^jobs[@]"
	fi
}
jobs_bg () {
	# undefined
	builtin autoload -XUz
}
jobs_builtin () {
	# undefined
	builtin autoload -XUz
}
jobs_fg () {
	# undefined
	builtin autoload -XUz
}
joe () {
	# undefined
	builtin autoload -XUz
}
join () {
	# undefined
	builtin autoload -XUz
}
kfmclient () {
	# undefined
	builtin autoload -XUz
}
kill () {
	# undefined
	builtin autoload -XUz
}
killall () {
	# undefined
	builtin autoload -XUz
}
kld () {
	# undefined
	builtin autoload -XUz
}
knock () {
	# undefined
	builtin autoload -XUz
}
kvno () {
	# undefined
	builtin autoload -XUz
}
last () {
	# undefined
	builtin autoload -XUz
}
ld_debug () {
	# undefined
	builtin autoload -XUz
}
ldd () {
	# undefined
	builtin autoload -XUz
}
less () {
	# undefined
	builtin autoload -XUz
}
lighttpd () {
	# undefined
	builtin autoload -XUz
}
limit () {
	# undefined
	builtin autoload -XUz
}
limits () {
	# undefined
	builtin autoload -XUz
}
linda () {
	# undefined
	builtin autoload -XUz
}
links () {
	# undefined
	builtin autoload -XUz
}
lintian () {
	# undefined
	builtin autoload -XUz
}
list () {
	# undefined
	builtin autoload -XUz
}
list_files () {
	local stat f elt what dir
	local -a stylevals
	integer ok
	listfiles=() 
	listopts=() 
	zstyle -a ":completion:${curcontext}:" file-list stylevals || return 1
	case $WIDGETSTYLE in
		(*complete*) what=insert  ;;
		(*) what=list  ;;
	esac
	for elt in $stylevals
	do
		case $elt in
			(*($what|all|true|1|yes)*=<->) (( ${(P)#1} <= ${elt##*=} )) && (( ok = 1 ))
				break ;;
			(*($what|all|true|1|yes)[^=]#) (( ok = 1 ))
				break ;;
		esac
	done
	(( ok )) || return 1
	zmodload -F zsh/stat b:zstat 2> /dev/null || return 1
	dir=${2:+$2/} 
	dir=${(Q)dir} 
	for f in ${(PQ)1}
	do
		if [[ ! -e "$dir$f" ]]
		then
			listfiles+=("$dir$f") 
			continue
		fi
		zstat -s -H stat -F "%b %e %H:%M" - "$dir$f" > /dev/null 2>&1
		listfiles+=("$stat[mode] ${(l:3:)stat[nlink]} ${(r:8:)stat[uid]}  ${(r:8:)stat[gid]} ${(l:8:)stat[size]} $stat[mtime] $f") 
	done
	(( ${#listfiles} )) && listopts=(-d listfiles -l -o) 
	return 0
}
ln () {
	# undefined
	builtin autoload -XUz
}
loadkeys () {
	# undefined
	builtin autoload -XUz
}
locales () {
	# undefined
	builtin autoload -XUz
}
locate () {
	# undefined
	builtin autoload -XUz
}
logical_volumes () {
	# undefined
	builtin autoload -XUz
}
look () {
	# undefined
	builtin autoload -XUz
}
losetup () {
	# undefined
	builtin autoload -XUz
}
lp () {
	# undefined
	builtin autoload -XUz
}
ls () {
	# undefined
	builtin autoload -XUz
}
lscfg () {
	# undefined
	builtin autoload -XUz
}
lsdev () {
	# undefined
	builtin autoload -XUz
}
lslv () {
	# undefined
	builtin autoload -XUz
}
lsof () {
	# undefined
	builtin autoload -XUz
}
lspv () {
	# undefined
	builtin autoload -XUz
}
lsusb () {
	# undefined
	builtin autoload -XUz
}
lsvg () {
	# undefined
	builtin autoload -XUz
}
lynx () {
	# undefined
	builtin autoload -XUz
}
lzop () {
	# undefined
	builtin autoload -XUz
}
mac_applications () {
	# undefined
	builtin autoload -XUz
}
mac_files_for_application () {
	# undefined
	builtin autoload -XUz
}
madison () {
	# undefined
	builtin autoload -XUz
}
mail () {
	# undefined
	builtin autoload -XUz
}
mailboxes () {
	# undefined
	builtin autoload -XUz
}
main_complete () {
	local IFS=$' \t\n\0'
	eval "$_comp_setup"
	local func funcs ret=1 tmp _compskip format nm call match min max i num _completers _completer _completer_num curtag _comp_force_list _matchers _matcher _c_matcher _matcher_num _comp_tags _comp_mesg mesg str context state state_descr line opt_args val_args curcontext="$curcontext" _last_nmatches=-1 _last_menu_style _def_menu_style _menu_style sel _tags_level=0 _saved_exact="${compstate[exact]}" _saved_lastprompt="${compstate[last_prompt]}" _saved_list="${compstate[list]}" _saved_insert="${compstate[insert]}" _saved_colors="$ZLS_COLORS" _saved_colors_set=${+ZLS_COLORS}
	local -a precommands
	typeset -U _lastdescr _comp_ignore _comp_colors
	[[ -z "$curcontext" ]] && curcontext=::: 
	zstyle -s ":completion:${curcontext}:" insert-tab tmp || tmp=yes 
	if [[ ( "$tmp" = *pending(|[[:blank:]]*) && PENDING -gt 0 ) || ( "$tmp" = *pending=(#b)([0-9]##)(|[[:blank:]]*) && PENDING -ge $match[1] ) ]]
	then
		compstate[insert]=tab 
		return 0
	fi
	if [[ "$compstate[insert]" = tab* ]]
	then
		if [[ "$tmp" = (|*[[:blank:]])(yes|true|on|1)(|[[:blank:]]*) ]]
		then
			if [[ "$curcontext" != :* || -z "$compstate[vared]" ]] || zstyle -t ":completion:vared${curcontext}:" insert-tab
			then
				return 0
			fi
		fi
		compstate[insert]="${compstate[insert]//tab /}" 
	fi
	if [[ -z "$compstate[quote]" ]]
	then
		if [[ -o equals ]] && compset -P 1 '='
		then
			compstate[context]=equal 
		elif [[ "$PREFIX" != */* && "$PREFIX[1]" = '~' ]]
		then
			compset -p 1
			compstate[context]=tilde 
		fi
	fi
	_setup default
	_def_menu_style=("$_last_menu_style[@]") 
	_last_menu_style=() 
	if zstyle -s ":completion:${curcontext}:default" list-prompt tmp
	then
		LISTPROMPT="$tmp" 
		zmodload -i zsh/complist
	fi
	if zstyle -s ":completion:${curcontext}:default" select-prompt tmp
	then
		MENUPROMPT="$tmp" 
		zmodload -i zsh/complist
	fi
	if zstyle -s ":completion:${curcontext}:default" select-scroll tmp
	then
		MENUSCROLL="$tmp" 
		zmodload -i zsh/complist
	fi
	if (( $# ))
	then
		if [[ "$1" = - ]]
		then
			if [[ $# -lt 3 ]]
			then
				_completers=() 
			else
				_completers=("$2") 
				call=yes 
			fi
		else
			_completers=("$@") 
		fi
	else
		zstyle -a ":completion:${curcontext}:" completer _completers || _completers=(_complete _ignored) 
	fi
	_completer_num=1 
	funcs=("$compprefuncs[@]") 
	compprefuncs=() 
	for func in "$funcs[@]"
	do
		"$func"
	done
	for tmp in "$_completers[@]"
	do
		if [[ -n "$call" ]]
		then
			_completer="${tmp}" 
		elif [[ "$tmp" = *:-* ]]
		then
			_completer="${${tmp%:*}[2,-1]//_/-}${tmp#*:}" 
			tmp="${tmp%:*}" 
		elif [[ $tmp = *:* ]]
		then
			_completer="${tmp#*:}" 
			tmp="${tmp%:*}" 
		else
			_completer="${tmp[2,-1]//_/-}" 
		fi
		curcontext="${curcontext/:[^:]#:/:${_completer}:}" 
		zstyle -t ":completion:${curcontext}:" show-completer && zle -R "Trying completion for :completion:${curcontext}"
		zstyle -a ":completion:${curcontext}:" matcher-list _matchers || _matchers=('') 
		_matcher_num=1 
		_matcher='' 
		for _c_matcher in "$_matchers[@]"
		do
			if [[ "$_c_matcher" = +* ]]
			then
				_matcher="$_matcher $_c_matcher[2,-1]" 
			else
				_matcher="$_c_matcher" 
			fi
			_comp_mesg= 
			if [[ -n "$call" ]]
			then
				if "${(@)argv[3,-1]}"
				then
					ret=0 
					break 2
				fi
			elif "$tmp"
			then
				ret=0 
				break 2
			fi
			(( _matcher_num++ ))
		done
		[[ -n "$_comp_mesg" ]] && break
		(( _completer_num++ ))
	done
	curcontext="${curcontext/:[^:]#:/::}" 
	if [[ $compstate[old_list] = keep ]]
	then
		nm=$_lastcomp[nmatches] 
	else
		nm=$compstate[nmatches] 
	fi
	if [[ $compstate[old_list] = keep || nm -gt 1 ]]
	then
		[[ _last_nmatches -ge 0 && _last_nmatches -ne nm ]] && _menu_style=("$_last_menu_style[@]" "$_menu_style[@]") 
		tmp=$(( compstate[list_lines] + BUFFERLINES + 1 )) 
		_menu_style=("$_menu_style[@]" "$_def_menu_style[@]") 
		if [[ "$compstate[list]" = *list && tmp -gt LINES && ( -n "$_menu_style[(r)select=long-list]" || -n "$_menu_style[(r)(yes|true|on|1)=long-list]" ) ]]
		then
			compstate[insert]=menu 
		elif [[ "$compstate[insert]" = "$_saved_insert" ]]
		then
			if [[ -n "$compstate[insert]" && -n "$_menu_style[(r)(yes|true|1|on)=long]" && tmp -gt LINES ]]
			then
				compstate[insert]=menu 
			else
				sel=("${(@M)_menu_style:#(yes|true|1|on)*}") 
				if (( $#sel ))
				then
					min=9999999 
					for i in "$sel[@]"
					do
						if [[ "$i" = *\=[0-9]* ]]
						then
							num="${i#*\=}" 
							[[ num -lt 0 ]] && num=0 
						elif [[ "$i" != *\=* ]]
						then
							num=0 
						else
							num=9999999 
						fi
						[[ num -lt min ]] && min="$num" 
						(( min )) || break
					done
				fi
				sel=("${(@M)_menu_style:#(no|false|0|off)*}") 
				if (( $#sel ))
				then
					max=9999999 
					for i in "$sel[@]"
					do
						if [[ "$i" = *\=[0-9]* ]]
						then
							num="${i#*\=}" 
							[[ num -lt 0 ]] && num=0 
						elif [[ "$i" != *\=* ]]
						then
							num=0 
						else
							num=9999999 
						fi
						[[ num -lt max ]] && max="$num" 
						(( max )) || break
					done
				fi
				if [[ ( -n "$min" && nm -ge min && ( -z "$max" || nm -lt max ) ) || ( -n "$_menu_style[(r)auto*]" && "$compstate[insert]" = automenu ) ]]
				then
					compstate[insert]=menu 
				elif [[ -n "$max" && nm -ge max ]]
				then
					compstate[insert]=unambiguous 
				elif [[ -n "$_menu_style[(r)auto*]" && "$compstate[insert]" != automenu ]]
				then
					compstate[insert]=automenu-unambiguous 
				fi
			fi
		fi
		if [[ "$compstate[insert]" = *menu* ]]
		then
			[[ "$MENUSELECT" = 00 ]] && MENUSELECT=0 
			if [[ -n "$_menu_style[(r)no-select*]" ]]
			then
				unset MENUSELECT
			elif [[ -n "$_menu_style[(r)select=long*]" ]]
			then
				if [[ tmp -gt LINES ]]
				then
					zmodload -i zsh/complist
					MENUSELECT=00 
				fi
			fi
			if [[ "$MENUSELECT" != 00 ]]
			then
				sel=("${(@M)_menu_style:#select*}") 
				if (( $#sel ))
				then
					min=9999999 
					for i in "$sel[@]"
					do
						if [[ "$i" = *\=[0-9]* ]]
						then
							num="${i#*\=}" 
							[[ num -lt 0 ]] && num=0 
						elif [[ "$i" != *\=* ]]
						then
							num=0 
						else
							num=9999999 
						fi
						[[ num -lt min ]] && min="$num" 
						(( min )) || break
					done
					zmodload -i zsh/complist
					MENUSELECT="$min" 
				else
					unset MENUSELECT
				fi
			fi
			if [[ -n "$MENUSELECT" ]]
			then
				if [[ -n "$_menu_style[(r)interactive*]" ]]
				then
					MENUMODE=interactive 
				elif [[ -n "$_menu_style[(r)search*]" ]]
				then
					if [[ -n "$_menu_style[(r)*backward*]" ]]
					then
						MENUMODE=search-backward 
					else
						MENUMODE=search-forward 
					fi
				else
					unset MENUMODE
				fi
			fi
		fi
	elif [[ nm -lt 1 && -n "$_comp_mesg" ]]
	then
		compstate[insert]='' 
		compstate[list]='list force' 
	elif [[ nm -eq 0 && -z "$_comp_mesg" && $#_lastdescr -ne 0 && $compstate[old_list] != keep ]] && zstyle -s ":completion:${curcontext}:warnings" format format
	then
		compstate[list]='list force' 
		compstate[insert]='' 
		tmp=("\`${(@)^_lastdescr:#}'") 
		case $#tmp in
			(1) str="$tmp[1]"  ;;
			(2) str="$tmp[1] or $tmp[2]"  ;;
			(*) str="${(j:, :)tmp[1,-2]}, or $tmp[-1]"  ;;
		esac
		_setup warnings
		zformat -f mesg "$format" "d:$str" "D:${(F)${(@)_lastdescr:#}}"
		compadd -x "$mesg"
	fi
	[[ "$_comp_force_list" = always || ( "$_comp_force_list" = ?* && nm -ge _comp_force_list ) ]] && compstate[list]="${compstate[list]//messages} force" 
	if [[ "$compstate[old_list]" = keep ]]
	then
		if [[ $_saved_colors_set = 1 ]]
		then
			ZLS_COLORS="$_saved_colors" 
		else
			unset ZLS_COLORS
		fi
	elif (( $#_comp_colors ))
	then
		ZLS_COLORS="${(j.:.)_comp_colors}" 
	else
		unset ZLS_COLORS
	fi
	funcs=("$comppostfuncs[@]") 
	comppostfuncs=() 
	for func in "$funcs[@]"
	do
		"$func"
	done
	_lastcomp=("${(@kv)compstate}") 
	_lastcomp[nmatches]=$nm 
	_lastcomp[completer]="$_completer" 
	_lastcomp[prefix]="$PREFIX" 
	_lastcomp[suffix]="$SUFFIX" 
	_lastcomp[iprefix]="$IPREFIX" 
	_lastcomp[isuffix]="$ISUFFIX" 
	_lastcomp[qiprefix]="$QIPREFIX" 
	_lastcomp[qisuffix]="$QISUFFIX" 
	_lastcomp[tags]="$_comp_tags" 
	return ret
}
make () {
	# undefined
	builtin autoload -XUz
}
make-kpkg () {
	# undefined
	builtin autoload -XUz
}
man () {
	# undefined
	builtin autoload -XUz
}
match () {
	# undefined
	builtin autoload -XUz
}
math () {
	# undefined
	builtin autoload -XUz
}
matlab () {
	# undefined
	builtin autoload -XUz
}
md5sum () {
	# undefined
	builtin autoload -XUz
}
mdadm () {
	# undefined
	builtin autoload -XUz
}
members () {
	# undefined
	builtin autoload -XUz
}
mencal () {
	# undefined
	builtin autoload -XUz
}
menu () {
	# undefined
	builtin autoload -XUz
}
mere () {
	# undefined
	builtin autoload -XUz
}
mergechanges () {
	# undefined
	builtin autoload -XUz
}
message () {
	# undefined
	builtin autoload -XUz
}
metaflac () {
	# undefined
	builtin autoload -XUz
}
mh () {
	# undefined
	builtin autoload -XUz
}
mii-tool () {
	# undefined
	builtin autoload -XUz
}
mime_types () {
	# undefined
	builtin autoload -XUz
}
mkdir () {
	# undefined
	builtin autoload -XUz
}
mkshortcut () {
	# undefined
	builtin autoload -XUz
}
mkzsh () {
	# undefined
	builtin autoload -XUz
}
module () {
	# undefined
	builtin autoload -XUz
}
module-assistant () {
	# undefined
	builtin autoload -XUz
}
modutils () {
	# undefined
	builtin autoload -XUz
}
mondo () {
	# undefined
	builtin autoload -XUz
}
monotone () {
	# undefined
	builtin autoload -XUz
}
mosh () {
	# undefined
	builtin autoload -XUz
}
most_recent_file () {
	# undefined
	builtin autoload -XUz
}
mount () {
	# undefined
	builtin autoload -XUz
}
mozilla () {
	# undefined
	builtin autoload -XUz
}
mpc () {
	# undefined
	builtin autoload -XUz
}
mplayer () {
	# undefined
	builtin autoload -XUz
}
mt () {
	# undefined
	builtin autoload -XUz
}
mtools () {
	# undefined
	builtin autoload -XUz
}
mtr () {
	# undefined
	builtin autoload -XUz
}
multi_parts () {
	# undefined
	builtin autoload -XUz
}
mutt () {
	# undefined
	builtin autoload -XUz
}
my_accounts () {
	# undefined
	builtin autoload -XUz
}
mysql_utils () {
	# undefined
	builtin autoload -XUz
}
mysqldiff () {
	# undefined
	builtin autoload -XUz
}
nautilus () {
	# undefined
	builtin autoload -XUz
}
ncftp () {
	# undefined
	builtin autoload -XUz
}
nedit () {
	# undefined
	builtin autoload -XUz
}
net_interfaces () {
	# undefined
	builtin autoload -XUz
}
netcat () {
	# undefined
	builtin autoload -XUz
}
netscape () {
	# undefined
	builtin autoload -XUz
}
netstat () {
	# undefined
	builtin autoload -XUz
}
newsgroups () {
	# undefined
	builtin autoload -XUz
}
next_label () {
	local __gopt __descr __spec
	__gopt=() 
	zparseopts -D -a __gopt 1 2 V J x
	if comptags -A "$1" curtag __spec
	then
		(( $#funcstack > _tags_level )) && _comp_tags="${_comp_tags% * }" 
		_tags_level=$#funcstack 
		_comp_tags="$_comp_tags $__spec " 
		if [[ "$curtag" = *[^\\]:* ]]
		then
			zformat -f __descr "${curtag#*:}" "d:$3"
			_description "$__gopt[@]" "${curtag%:*}" "$2" "$__descr"
			curtag="${curtag%:*}" 
			set -A $2 "${(P@)2}" "${(@)argv[4,-1]}"
		else
			_description "$__gopt[@]" "$curtag" "$2" "$3"
			set -A $2 "${(@)argv[4,-1]}" "${(P@)2}"
		fi
		return 0
	fi
	return 1
}
next_tags () {
	# undefined
	builtin autoload -XUz
}
nice () {
	# undefined
	builtin autoload -XUz
}
nm () {
	# undefined
	builtin autoload -XUz
}
nmap () {
	# undefined
	builtin autoload -XUz
}
nmcli () {
	# undefined
	builtin autoload -XUz
}
normal () {
	local _comp_command1 _comp_command2 _comp_command skip
	if [[ "$1" = -s ]]
	then
		skip=(-s) 
	else
		skip=() 
		_compskip='' 
	fi
	if [[ -o BANG_HIST && ( ( $words[CURRENT] = \!*: && -z $compstate[quote] ) || ( $words[CURRENT] = \"\!*: && $compstate[all_quotes] = \" ) ) ]]
	then
		PREFIX=${PREFIX//\\!/!} 
		compset -P '*:'
		_history_modifiers h
		return
	fi
	if [[ CURRENT -eq 1 ]]
	then
		curcontext="${curcontext%:*:*}:-command-:" 
		comp="$_comps[-command-]" 
		[[ -n "$comp" ]] && eval "$comp" && ret=0 
		return ret
	fi
	_set_command
	_dispatch "$skip[@]" "$_comp_command" "$_comp_command1" "$_comp_command2" -default-
}
nothing () {
	# undefined
	builtin autoload -XUz
}
notmuch () {
	# undefined
	builtin autoload -XUz
}
npm () {
	# undefined
	builtin autoload -XUz
}
nslookup () {
	# undefined
	builtin autoload -XUz
}
object_classes () {
	# undefined
	builtin autoload -XUz
}
okular () {
	# undefined
	builtin autoload -XUz
}
oldlist () {
	# undefined
	builtin autoload -XUz
}
open () {
	# undefined
	builtin autoload -XUz
}
options () {
	# undefined
	builtin autoload -XUz
}
options_set () {
	# undefined
	builtin autoload -XUz
}
options_unset () {
	# undefined
	builtin autoload -XUz
}
osc () {
	# undefined
	builtin autoload -XUz
}
other_accounts () {
	# undefined
	builtin autoload -XUz
}
pack () {
	# undefined
	builtin autoload -XUz
}
parameter () {
	# undefined
	builtin autoload -XUz
}
parameters () {
	local expl pattern fakes faked tmp pfilt
	pattern=(-g \*) 
	zparseopts -D -K -E g:=pattern
	fakes=() 
	faked=() 
	if zstyle -a ":completion:${curcontext}:" fake-parameters tmp
	then
		for i in "$tmp[@]"
		do
			if [[ "$i" = *:* ]]
			then
				faked=("$faked[@]" "$i") 
			else
				fakes=("$fakes[@]" "$i") 
			fi
		done
	fi
	zstyle -t ":completion:${curcontext}:parameters" prefix-needed && [[ $PREFIX != [_.]* ]] && pfilt='[^_.]' 
	_wanted parameters expl parameter compadd "$@" -Q - "${(@M)${(@k)parameters[(R)${pattern[2]}~*local*]}:#${~pfilt}*}" "$fakes[@]" "${(@)${(@M)faked:#${~pattern[2]}}%%:*}"
}
patch () {
	# undefined
	builtin autoload -XUz
}
path_commands () {
	local need_desc expl ret=1
	if zstyle -t ":completion:${curcontext}:" extra-verbose
	then
		local update_policy first
		if [[ $+_command_descriptions -eq 0 ]]
		then
			first=yes 
			typeset -A -g _command_descriptions
		fi
		zstyle -s ":completion:${curcontext}:" cache-policy update_policy
		[[ -z "$update_policy" ]] && zstyle ":completion:${curcontext}:" cache-policy _path_commands_caching_policy
		if (
				[[ -n $first ]] || _cache_invalid command-descriptions
			) && ! _retrieve_cache command-descriptions
		then
			local line
			for line in "${(f)$(_call_program command-descriptions _call_whatis -s 1 -r .\\\*\; _call_whatis -s 6 -r .\\\* 2>/dev/null)}"
			do
				[[ -n ${line:#(#b)([^ ]#) #\([^ ]#\)( #\[[^ ]#\]|)[ -]#(*)} ]] && continue
				[[ -z $match[1] || -z $match[3] || -z ${${match[1]}:#*:*} ]] && continue
				_command_descriptions[$match[1]]=$match[3] 
			done
			_store_cache command-descriptions _command_descriptions
		fi
		(( $#_command_descriptions )) && need_desc=yes 
	fi
	if [[ -n $need_desc ]]
	then
		typeset -a dcmds descs cmds matches
		local desc cmd sep
		compadd "$@" -O matches -k commands
		for cmd in $matches
		do
			desc=$_command_descriptions[$cmd] 
			if [[ -z $desc ]]
			then
				cmds+=$cmd 
			else
				dcmds+=$cmd 
				descs+="$cmd:$desc" 
			fi
		done
		zstyle -s ":completion:${curcontext}:" list-separator sep || sep=-- 
		zformat -a descs " $sep " $descs
		descs=("${(@r:COLUMNS-1:)descs}") 
		_wanted commands expl 'external command' compadd "$@" -ld descs -a dcmds && ret=0 
		_wanted commands expl 'external command' compadd "$@" -a cmds && ret=0 
	else
		_wanted commands expl 'external command' compadd "$@" -k commands && ret=0 
	fi
	if [[ -o path_dirs ]]
	then
		local -a path_dirs
		path_dirs=(${^path}/*(/N:t)) 
		(( ${#path_dirs} )) && _wanted path-dirs expl 'directory in path' compadd "$@" -a path_dirs && ret=0 
		if [[ $PREFIX$SUFFIX = */* ]]
		then
			_wanted commands expl 'external command' _path_files -W path -g '*(*)' && ret=0 
		fi
	fi
	return $ret
}
path_commands_caching_policy () {
	local file
	local -a oldp dbfiles
	oldp=("$1"(Nmw+1)) 
	(( $#oldp )) && return 0
	dbfiles=(/usr/share/man/index.(bt|db|dir|pag)(N) /usr/man/index.(bt|db|dir|pag)(N) /var/cache/man/index.(bt|db|dir|pag)(N) /var/catman/index.(bt|db|dir|pag)(N) /usr/share/man/*/whatis(N)) 
	for file in $dbfiles
	do
		[[ $file -nt $1 ]] && return 0
	done
	return 1
}
path_files () {
	local -a match mbegin mend
	if _have_glob_qual $PREFIX
	then
		compset -p ${#match[1]}
		if [[ $_comp_caller_options[extendedglob] = on ]] && compset -P '\#'
		then
			_globflags
		else
			_globquals
		fi
		return
	fi
	local linepath realpath donepath prepath testpath exppath skips skipped
	local tmp1 tmp2 tmp3 tmp4 i orig eorig pre suf tpre tsuf opre osuf cpre
	local pats haspats ignore pfx pfxsfx sopt gopt opt sdirs ignpar cfopt listsfx
	local nm=$compstate[nmatches] menu matcher mopts sort mid accex fake
	local listfiles listopts tmpdisp origtmp1 Uopt
	local accept_exact_dirs path_completion
	integer npathcheck
	local -a Mopts
	typeset -U prepaths exppaths
	exppaths=() 
	zparseopts -a mopts 'P:=pfx' 'S:=pfxsfx' 'q=pfxsfx' 'r:=pfxsfx' 'R:=pfxsfx' 'W:=prepaths' 'F:=ignore' 'M+:=matcher' J+: V+: X+: 1 2 n 'f=tmp1' '/=tmp1' 'g+:-=tmp1'
	sopt="-${(@j::M)${(@)tmp1#-}#?}" 
	(( $tmp1[(I)-[/g]*] )) && haspats=yes 
	(( $tmp1[(I)-g*] )) && gopt=yes 
	if (( $tmp1[(I)-/] ))
	then
		pats="${(@)${(@M)tmp1:#-g*}#-g}" 
		pats=('*(-/)' ${${(z):-x $pats}[2,-1]}) 
	else
		pats="${(@)${(@M)tmp1:#-g*}#-g}" 
		pats=(${${(z):-x $pats}[2,-1]}) 
	fi
	pats=("${(@)pats:# #}") 
	if (( $#pfx ))
	then
		compset -P "$pfx[2]" || pfxsfx=("$pfx[@]" "$pfxsfx[@]") 
	fi
	if (( $#prepaths ))
	then
		tmp1="${prepaths[2]}" 
		if [[ "$tmp1[1]" = '(' ]]
		then
			prepaths=(${^=tmp1[2,-2]%/}/) 
		elif [[ "$tmp1[1]" = '/' ]]
		then
			prepaths=("${tmp1%/}/") 
		else
			prepaths=(${(P)^tmp1%/}/) 
			(( ! $#prepaths )) && prepaths=(${tmp1%/}/) 
		fi
		(( ! $#prepaths )) && prepaths=('') 
	else
		prepaths=('') 
	fi
	if (( $#ignore ))
	then
		if [[ "${ignore[2]}" = \(* ]]
		then
			ignore=(${=ignore[2][2,-2]}) 
		else
			ignore=(${(P)ignore[2]}) 
		fi
	fi
	if [[ "$sopt" = -(f|) ]]
	then
		if [[ -z "$gopt" ]]
		then
			sopt='-f' 
			pats=('*') 
		else
			unset sopt
		fi
	fi
	if (( ! $mopts[(I)-[JVX]] ))
	then
		local expl
		if [[ -z "$gopt" && "$sopt" = -/ ]]
		then
			_description directories expl directory
		else
			_description files expl file
		fi
		tmp1=$expl[(I)-M*] 
		if (( tmp1 ))
		then
			if (( $#matcher ))
			then
				matcher[2]="$matcher[2] $expl[1+tmp1]" 
			else
				matcher=(-M "$expl[1+tmp1]") 
			fi
		fi
		mopts=("$mopts[@]" "$expl[@]") 
	fi
	[[ -z "$_comp_no_ignore" && $#ignore -eq 0 && ( -z $gopt || "$pats" = \ #\*\ # ) && -n $FIGNORE ]] && ignore=("?*${^fignore[@]}") 
	if (( $#ignore ))
	then
		_comp_ignore=("$_comp_ignore[@]" "$ignore[@]") 
		(( $mopts[(I)-F] )) || mopts=("$mopts[@]" -F _comp_ignore) 
	fi
	if [[ $#matcher -eq 0 && -o nocaseglob ]]
	then
		matcher=(-M 'm:{a-zA-Z}={A-Za-z}') 
	fi
	if (( $#matcher ))
	then
		mopts=("$mopts[@]" "$matcher[@]") 
	fi
	if zstyle -s ":completion:${curcontext}:" file-sort tmp1
	then
		case "$tmp1" in
			(*size*) sort=oL  ;;
			(*links*) sort=ol  ;;
			(*(time|date|modi)*) sort=om  ;;
			(*access*) sort=oa  ;;
			(*(inode|change)*) sort=oc  ;;
			(*) sort=on  ;;
		esac
		[[ "$tmp1" = *rev* ]] && sort[1]=O 
		[[ "$tmp1" = *follow* ]] && sort="-${sort}-" 
		if [[ "$sort" = on ]]
		then
			sort= 
		else
			mopts=("${(@)mopts/#-J/-V}") 
			tmp2=() 
			for tmp1 in "$pats[@]"
			do
				if _have_glob_qual "$tmp1" complete
				then
					tmp2+=("${match[1]}#q${sort})(${match[5]})") 
				else
					tmp2+=("${tmp1}(${sort})") 
				fi
			done
			pats=("$tmp2[@]") 
		fi
	fi
	if zstyle -t ":completion:${curcontext}:paths" squeeze-slashes
	then
		skips='((.|..|)/)##' 
	else
		skips='((.|..)/)##' 
	fi
	zstyle -s ":completion:${curcontext}:paths" special-dirs sdirs
	zstyle -t ":completion:${curcontext}:paths" list-suffixes && listsfx=yes 
	[[ "$pats" = ((|*[[:blank:]])\*(|[[:blank:]]*|\([^[:blank:]]##\))|*\([^[:blank:]]#/[^[:blank:]]#\)*) ]] && sopt=$sopt/ 
	zstyle -a ":completion:${curcontext}:paths" accept-exact accex
	zstyle -a ":completion:${curcontext}:" fake-files fake
	zstyle -s ":completion:${curcontext}:" ignore-parents ignpar
	zstyle -t ":completion:${curcontext}:paths" accept-exact-dirs && accept_exact_dirs=1 
	zstyle -T ":completion:${curcontext}:paths" path-completion && path_completion=1 
	if [[ -n "$compstate[pattern_match]" ]]
	then
		if {
				[[ -z "$SUFFIX" ]] && _have_glob_qual "$PREFIX" complete
			} || _have_glob_qual "$SUFFIX" complete
		then
			tmp3=${match[5]} 
			if [[ -n "$SUFFIX" ]]
			then
				SUFFIX=${match[2]} 
			else
				PREFIX=${match[2]} 
			fi
			tmp2=() 
			for tmp1 in "$pats[@]"
			do
				if _have_glob_qual "$tmp1" complete
				then
					tmp2+=("${match[1]}${tmp3}${match[5]})") 
				else
					tmp2+=("${tmp1}(${tmp3})") 
				fi
			done
			pats=("$tmp2[@]") 
		fi
	fi
	pre="$PREFIX" 
	suf="$SUFFIX" 
	opre="$PREFIX" 
	osuf="$SUFFIX" 
	orig="${PREFIX}${SUFFIX}" 
	eorig="$orig" 
	[[ $compstate[insert] = (*menu|[0-9]*) || -n "$_comp_correct" || ( -n "$compstate[pattern_match]" && "${orig#\~}" != (|*[^\\])[][*?#~^\|\<\>]* ) ]] && menu=yes 
	if [[ -n "$_comp_correct" ]]
	then
		cfopt=- 
		Uopt=-U 
	else
		Mopts=(-M "r:|/=* r:|=*") 
	fi
	if [[ "$pre" = [^][*?#^\|\<\>\\]#(\`[^\`]#\`|\$)*/* && "$compstate[quote]" != \' ]]
	then
		linepath="${(M)pre##*\$[^/]##/}" 
		() {
			setopt localoptions nounset
			eval 'realpath=${(e)~linepath}' 2> /dev/null
		}
		[[ -z "$realpath" || "$realpath" = "$linepath" ]] && return 1
		pre="${pre#${linepath}}" 
		i='[^/]' 
		i="${#linepath//$i}" 
		orig="${orig[1,(in:i:)/][1,-2]}" 
		donepath= 
		prepaths=('') 
	elif [[ "$pre[1]" = \~ && -z "$compstate[quote]" ]]
	then
		linepath="${pre[2,-1]%%/*}" 
		if [[ -z "$linepath" ]]
		then
			realpath="${HOME%/}/" 
		elif [[ "$linepath" = ([-+]|)[0-9]## ]]
		then
			if [[ "$linepath" != [-+]* ]]
			then
				tmp1="$linepath" 
			else
				if [[ "$linepath" = -* ]]
				then
					tmp1=$(( $#dirstack $linepath )) 
				else
					tmp1=$linepath[2,-1] 
				fi
				[[ -o pushdminus ]] && tmp1=$(( $#dirstack - $tmp1 )) 
			fi
			if (( ! tmp1 ))
			then
				realpath=$PWD/ 
			elif [[ tmp1 -le $#dirstack ]]
			then
				realpath=$dirstack[tmp1]/ 
			else
				_message 'not enough directory stack entries'
				return 1
			fi
		elif [[ "$linepath" = [-+] ]]
		then
			realpath=${~:-\~$linepath}/ 
		else
			eval "realpath=~${linepath}/" 2> /dev/null
			if [[ -z "$realpath" ]]
			then
				_message "unknown user \`$linepath'"
				return 1
			fi
		fi
		linepath="~${linepath}/" 
		[[ "$realpath" = "$linepath" ]] && return 1
		pre="${pre#*/}" 
		orig="${orig#*/}" 
		donepath= 
		prepaths=('') 
	else
		linepath= 
		realpath= 
		if zstyle -s ":completion:${curcontext}:" preserve-prefix tmp1 && [[ -n "$tmp1" && "$pre" = (#b)(${~tmp1})* ]]
		then
			pre="$pre[${#match[1]}+1,-1]" 
			orig="$orig[${#match[1]}+1,-1]" 
			donepath="$match[1]" 
			prepaths=('') 
		elif [[ "$pre[1]" = / ]]
		then
			pre="$pre[2,-1]" 
			orig="$orig[2,-1]" 
			donepath='/' 
			prepaths=('') 
		else
			[[ "$pre" = (.|..)/* ]] && prepaths=('') 
			donepath= 
		fi
	fi
	for prepath in "$prepaths[@]"
	do
		skipped= 
		cpre= 
		if [[ ( -n $accept_exact_dirs || -z $path_completion ) && ${pre} = (#b)(*)/([^/]#) ]]
		then
			tmp1=${match[1]} 
			tpre=${match[2]} 
			tmp2=${(Q)tmp1} 
			tmp1=${tmp1//(#b)\\(?)/$match[1]} 
			tpre=${tpre//(#b)\\([^\\\]\[\^\~\(\)\#\*\?])/$match[1]} 
			tmp3=${donepath//(#b)\\(?)/$match[1]} 
			while true
			do
				if [[ -z $path_completion || -d $prepath$realpath$tmp3$tmp2 ]]
				then
					tmp3=$tmp3$tmp1/ 
					donepath=${tmp3//(#b)([\\\]\[\^\~\(\)\#\*\?])/\\$match[1]} 
					pre=$tpre 
					break
				elif [[ $tmp1 = (#b)(*)/([^/]#) ]]
				then
					tmp1=$match[1] 
					tpre=$match[2]/$tpre 
				else
					break
				fi
			done
		fi
		tpre="$pre" 
		tsuf="$suf" 
		testpath="${donepath//(#b)\\([\\\]\[\^\~\(\)\#\*\?])/$match[1]}" 
		tmp2="${(M)tpre##${~skips}}" 
		tpre="${tpre#$tmp2}" 
		tmp1=("$prepath$realpath$donepath$tmp2") 
		(( npathcheck = 0 ))
		while true
		do
			origtmp1=("${tmp1[@]}") 
			if [[ "$tpre" = */* ]]
			then
				PREFIX="${tpre%%/*}" 
				SUFFIX= 
			else
				PREFIX="${tpre}" 
				SUFFIX="${tsuf%%/*}" 
			fi
			tmp2=("$tmp1[@]") 
			if [[ "$tpre$tsuf" = (#b)*/(*) ]]
			then
				if [[ -n "$fake${match[1]}" ]]
				then
					compfiles -P$cfopt tmp1 accex "$skipped" "$_matcher $matcher[2]" "$sdirs" fake
				else
					compfiles -P$cfopt tmp1 accex "$skipped" "$_matcher $matcher[2]" '' fake
				fi
			elif [[ "$sopt" = *[/f]* ]]
			then
				compfiles -p$cfopt tmp1 accex "$skipped" "$_matcher $matcher[2]" "$sdirs" fake "$pats[@]"
			else
				compfiles -p$cfopt tmp1 accex "$skipped" "$_matcher $matcher[2]" '' fake "$pats[@]"
			fi
			tmp1=($~tmp1)  2> /dev/null
			if [[ -n "$PREFIX$SUFFIX" ]]
			then
				if (( ! $#tmp1 && npathcheck == 0 ))
				then
					(( npathcheck = 1 ))
					for tmp3 in "$tmp2[@]"
					do
						if [[ -n $tmp3 && $tmp3 != */ ]]
						then
							tmp3+=/ 
						fi
						if [[ -e "$tmp3${(Q)PREFIX}${(Q)SUFFIX}" ]]
						then
							(( npathcheck = 2 ))
						fi
					done
					if (( npathcheck == 2 ))
					then
						tmp1=("$origtmp1[@]") 
						continue
					fi
				fi
				if (( ! $#tmp1 ))
				then
					tmp2=(${^${tmp2:#/}}/$PREFIX$SUFFIX) 
				elif [[ "$tmp1[1]" = */* ]]
				then
					if [[ -n "$_comp_correct" ]]
					then
						tmp2=("$tmp1[@]") 
						builtin compadd -D tmp1 "$matcher[@]" - "${(@)tmp1:t}"
						if [[ $#tmp1 -eq 0 ]]
						then
							tmp1=("$tmp2[@]") 
							compadd -D tmp1 "$matcher[@]" - "${(@)tmp2:t}"
						fi
					else
						tmp2=("$tmp1[@]") 
						compadd -D tmp1 "$matcher[@]" - "${(@)tmp1:t}"
					fi
				else
					tmp2=('') 
					compadd -D tmp1 "$matcher[@]" -a tmp1
				fi
				if (( ! $#tmp1 ))
				then
					if [[ "$tmp2[1]" = */* ]]
					then
						tmp2=("${(@)tmp2#${prepath}${realpath}}") 
						if [[ "$tmp2[1]" = */* ]]
						then
							tmp2=("${(@)tmp2:h}") 
							compquote tmp2
							if [[ "$tmp2" = */ ]]
							then
								exppaths=("$exppaths[@]" ${^tmp2}${tpre}${tsuf}) 
							else
								exppaths=("$exppaths[@]" ${^tmp2}/${tpre}${tsuf}) 
							fi
						elif [[ ${tpre}${tsuf} = */* ]]
						then
							exppaths=("$exppaths[@]" ${tpre}${tsuf}) 
						fi
					fi
					continue 2
				fi
			elif (( ! $#tmp1 ))
			then
				if [[ -z "$tpre$tsuf" && -n "$pre$suf" ]]
				then
					pfxsfx=(-S '' "$pfxsfx[@]") 
				elif [[ -n "$haspats" && -z "$tpre$tsuf$suf" && "$pre" = */ ]]
				then
					PREFIX="${opre}" 
					SUFFIX="${osuf}" 
					compadd -nQS '' - "$linepath$donepath$orig"
					tmp4=- 
				fi
				continue 2
			fi
			if [[ -n "$ignpar" && -z "$_comp_no_ignore" && "$tpre$tsuf" != */* && $#tmp1 -ne 0 && ( "$ignpar" != *dir* || "$pats" = '*(-/)' ) && ( "$ignpar" != *..* || "$tmp1[1]" = *../* ) ]]
			then
				compfiles -i tmp1 _comp_ignore "$ignpar" "$prepath$realpath$donepath"
				(( $#_comp_ignore && $mopts[(I)-F] )) || mopts=("$mopts[@]" -F _comp_ignore) 
			fi
			if [[ "$tpre" = */* ]]
			then
				tpre="${tpre#*/}" 
			elif [[ "$tsuf" = */* ]]
			then
				tpre="${tsuf#*/}" 
				tsuf= 
			else
				break
			fi
			tmp1=(${tmp1//(#b)([][()|*?^#~<>\\=])/\\${match[1]}}) 
			tmp2="${(M)tpre##${~skips}}" 
			if [[ -n "$tmp2" ]]
			then
				skipped="/$tmp2" 
				tpre="${tpre#$tmp2}" 
			else
				skipped=/ 
			fi
			(( npathcheck = 0 ))
		done
		tmp3="$pre$suf" 
		tpre="$pre" 
		tsuf="$suf" 
		[[ -n "${prepath}${realpath}${testpath}" ]] && tmp1=("${(@)tmp1#${prepath}${realpath}${testpath}}") 
		while true
		do
			compfiles -r tmp1 "${(Q)tmp3}"
			tmp4=$? 
			if [[ "$tpre" = */* ]]
			then
				tmp2="${cpre}${tpre%%/*}" 
				PREFIX="${linepath}${donepath}${tmp2}" 
				SUFFIX="/${tpre#*/}${tsuf#*/}" 
			else
				tmp2="${cpre}${tpre}" 
				PREFIX="${linepath}${donepath}${tmp2}" 
				SUFFIX="${tsuf}" 
			fi
			if (( tmp4 ))
			then
				tmp2="$testpath" 
				if [[ -n "$linepath" ]]
				then
					compquote -p tmp2 tmp1
				elif [[ -n "$tmp2" ]]
				then
					compquote -p tmp1
					compquote tmp2
				else
					compquote tmp1 tmp2
				fi
				if [[ -z "$_comp_correct" && "$compstate[pattern_match]" = \* && -n "$listsfx" && "$tmp2" = (|*[^\\])[][*?#~^\|\<\>]* ]]
				then
					PREFIX="$opre" 
					SUFFIX="$osuf" 
				fi
				if [[ -z "$compstate[insert]" ]] || {
						! zstyle -t ":completion:${curcontext}:paths" expand suffix && [[ -z "$listsfx" && ( -n "$_comp_correct" || -z "$compstate[pattern_match]" || "$SUFFIX" != */* || "${SUFFIX#*/}" = (|*[^\\])[][*?#~^\|\<\>]* ) ]]
					}
				then
					(( tmp4 )) && zstyle -t ":completion:${curcontext}:paths" ambiguous && compstate[to_end]= 
					if [[ "$tmp3" = */* ]]
					then
						if [[ -z "$listsfx" || "$tmp3" != */?* ]]
						then
							tmp1=("${(@)tmp1%%/*}") 
							_list_files tmp1 "$prepath$realpath$testpath"
							compadd $Uopt -Qf "$mopts[@]" -p "${Uopt:+$IPREFIX}$linepath$tmp2" -s "/${tmp3#*/}${Uopt:+$ISUFFIX}" -W "$prepath$realpath$testpath" "$pfxsfx[@]" $Mopts $listopts -a tmp1
						else
							tmp1=("${(@)^tmp1%%/*}/${tmp3#*/}") 
							_list_files tmp1 "$prepath$realpath$testpath"
							compadd $Uopt -Qf "$mopts[@]" -p "${Uopt:+$IPREFIX}$linepath$tmp2" -s "${Uopt:+$ISUFFIX}" -W "$prepath$realpath$testpath" "$pfxsfx[@]" $Mopts $listopts -a tmp1
						fi
					else
						_list_files tmp1 "$prepath$realpath$testpath"
						compadd $Uopt -Qf "$mopts[@]" -p "${Uopt:+$IPREFIX}$linepath$tmp2" -s "${Uopt:+$ISUFFIX}" -W "$prepath$realpath$testpath" "$pfxsfx[@]" $Mopts $listopts -a tmp1
					fi
				else
					if [[ "$tmp3" = */* ]]
					then
						tmp4=($Uopt -Qf "$mopts[@]" -p "${Uopt:+$IPREFIX}$linepath$tmp2" -W "$prepath$realpath$testpath" "$pfxsfx[@]" $Mopts) 
						if [[ -z "$listsfx" ]]
						then
							for i in "$tmp1[@]"
							do
								tmpdisp=("$i") 
								_list_files tmpdisp "$prepath$realpath$testpath"
								compadd "$tmp4[@]" -s "${Uopt:+$ISUFFIX}" $listopts - "$tmpdisp"
							done
						else
							[[ -n "$compstate[pattern_match]" ]] && SUFFIX="${SUFFIX:s./.*/}*" 
							for i in "$tmp1[@]"
							do
								_list_files i "$prepath$realpath$testpath"
								compadd "$tmp4[@]" $listopts - "$i"
							done
						fi
					else
						_list_files tmp1 "$prepath$realpath$testpath"
						compadd $Uopt -Qf "$mopts[@]" -p "${Uopt:+$IPREFIX}$linepath$tmp2" -s "${Uopt:+$ISUFFIX}" -W "$prepath$realpath$testpath" "$pfxsfx[@]" $Mopts $listopts -a tmp1
					fi
				fi
				tmp4=- 
				break
			fi
			if [[ "$tmp3" != */* ]]
			then
				tmp4= 
				break
			fi
			testpath="${testpath}${tmp1[1]%%/*}/" 
			tmp3="${tmp3#*/}" 
			if [[ "$tpre" = */* ]]
			then
				if [[ -z "$_comp_correct" && -n "$compstate[pattern_match]" && "$tmp2" = (|*[^\\])[][*?#~^\|\<\>]* ]]
				then
					cpre="${cpre}${tmp1[1]%%/*}/" 
				else
					cpre="${cpre}${tpre%%/*}/" 
				fi
				tpre="${tpre#*/}" 
			elif [[ "$tsuf" = */* ]]
			then
				[[ "$tsuf" != /* ]] && mid="$testpath" 
				if [[ -z "$_comp_correct" && -n "$compstate[pattern_match]" && "$tmp2" = (|*[^\\])[][*?#~^\|\<\>]* ]]
				then
					cpre="${cpre}${tmp1[1]%%/*}/" 
				else
					cpre="${cpre}${tpre}/" 
				fi
				tpre="${tsuf#*/}" 
				tsuf= 
			else
				tpre= 
				tsuf= 
			fi
			tmp1=("${(@)tmp1#*/}") 
		done
		if [[ -z "$tmp4" ]]
		then
			if [[ "$mid" = */ ]]
			then
				PREFIX="${opre}" 
				SUFFIX="${osuf}" 
				tmp4="${testpath#${mid}}" 
				if [[ $mid = */*/* ]]
				then
					tmp3="${mid%/*/}" 
					tmp2="${${mid%/}##*/}" 
					if [[ -n "$linepath" ]]
					then
						compquote -p tmp3
					else
						compquote tmp3
					fi
					compquote tmp4 tmp2 tmp1
					for i in "$tmp1[@]"
					do
						_list_files tmp2 "$prepath$realpath${mid%/*/}"
						compadd $Uopt -Qf "$mopts[@]" -p "${Uopt:+$IPREFIX}$linepath$tmp3/" -s "/$tmp4$i${Uopt:+$ISUFFIX}" -W "$prepath$realpath${mid%/*/}/" "$pfxsfx[@]" $Mopts $listopts - "$tmp2"
					done
				else
					tmp2="${${mid%/}##*/}" 
					compquote tmp4 tmp2 tmp1
					for i in "$tmp1[@]"
					do
						_list_files tmp2 "$prepath$realpath${mid%/*/}"
						compadd $Uopt -Qf "$mopts[@]" -p "${Uopt:+$IPREFIX}$linepath" -s "/$tmp4$i${Uopt:+$ISUFFIX}" -W "$prepath$realpath" "$pfxsfx[@]" $Mopts $listopts - "$tmp2"
					done
				fi
			else
				if [[ "$osuf" = */* ]]
				then
					PREFIX="${opre}${osuf}" 
					SUFFIX= 
				else
					PREFIX="${opre}" 
					SUFFIX="${osuf}" 
				fi
				tmp4="$testpath" 
				if [[ -n "$linepath" ]]
				then
					compquote -p tmp4 tmp1
				elif [[ -n "$tmp4" ]]
				then
					compquote -p tmp1
					compquote tmp4
				else
					compquote tmp4 tmp1
				fi
				if [[ -z "$_comp_correct" && -n "$compstate[pattern_match]" && "${PREFIX#\~}$SUFFIX" = (|*[^\\])[][*?#~^\|\<\>]* ]]
				then
					tmp1=("$linepath$tmp4${(@)^tmp1}") 
					_list_files tmp1 "$prepath$realpath"
					compadd -Qf -W "$prepath$realpath" "$pfxsfx[@]" "$mopts[@]" -M "r:|/=* r:|=*" $listopts -a tmp1
				else
					_list_files tmp1 "$prepath$realpath$testpath"
					compadd $Uopt -Qf -p "${Uopt:+$IPREFIX}$linepath$tmp4" -s "${Uopt:+$ISUFFIX}" -W "$prepath$realpath$testpath" "$pfxsfx[@]" "$mopts[@]" $Mopts $listopts -a tmp1
				fi
			fi
		fi
	done
	if [[ _matcher_num -eq ${#_matchers} ]] && zstyle -t ":completion:${curcontext}:paths" expand prefix && [[ nm -eq compstate[nmatches] && $#exppaths -ne 0 && "$linepath$exppaths" != "$eorig" ]]
	then
		PREFIX="${opre}" 
		SUFFIX="${osuf}" 
		compadd -Q "$mopts[@]" -S '' -M "r:|/=* r:|=*" -p "$linepath" -a exppaths
	fi
	[[ nm -ne compstate[nmatches] ]]
}
pax () {
	# undefined
	builtin autoload -XUz
}
pbm () {
	# undefined
	builtin autoload -XUz
}
pbuilder () {
	# undefined
	builtin autoload -XUz
}
pdf () {
	# undefined
	builtin autoload -XUz
}
pdftk () {
	# undefined
	builtin autoload -XUz
}
perforce () {
	# undefined
	builtin autoload -XUz
}
perl () {
	# undefined
	builtin autoload -XUz
}
perl_basepods () {
	# undefined
	builtin autoload -XUz
}
perl_modules () {
	# undefined
	builtin autoload -XUz
}
perldoc () {
	# undefined
	builtin autoload -XUz
}
pfctl () {
	# undefined
	builtin autoload -XUz
}
pfexec () {
	# undefined
	builtin autoload -XUz
}
pgrep () {
	# undefined
	builtin autoload -XUz
}
php () {
	# undefined
	builtin autoload -XUz
}
physical_volumes () {
	# undefined
	builtin autoload -XUz
}
pick_variant () {
	# undefined
	builtin autoload -XUz
}
pids () {
	# undefined
	builtin autoload -XUz
}
pine () {
	# undefined
	builtin autoload -XUz
}
ping () {
	# undefined
	builtin autoload -XUz
}
piuparts () {
	# undefined
	builtin autoload -XUz
}
pkg-config () {
	# undefined
	builtin autoload -XUz
}
pkg5 () {
	# undefined
	builtin autoload -XUz
}
pkg_instance () {
	# undefined
	builtin autoload -XUz
}
pkgadd () {
	# undefined
	builtin autoload -XUz
}
pkginfo () {
	# undefined
	builtin autoload -XUz
}
pkgrm () {
	# undefined
	builtin autoload -XUz
}
pkgtool () {
	# undefined
	builtin autoload -XUz
}
pon () {
	# undefined
	builtin autoload -XUz
}
portaudit () {
	# undefined
	builtin autoload -XUz
}
portlint () {
	# undefined
	builtin autoload -XUz
}
portmaster () {
	# undefined
	builtin autoload -XUz
}
ports () {
	# undefined
	builtin autoload -XUz
}
portsnap () {
	# undefined
	builtin autoload -XUz
}
postfix () {
	# undefined
	builtin autoload -XUz
}
powerd () {
	# undefined
	builtin autoload -XUz
}
prcs () {
	# undefined
	builtin autoload -XUz
}
precommand () {
	# undefined
	builtin autoload -XUz
}
prefix () {
	# undefined
	builtin autoload -XUz
}
print () {
	# undefined
	builtin autoload -XUz
}
printenv () {
	# undefined
	builtin autoload -XUz
}
printers () {
	# undefined
	builtin autoload -XUz
}
procstat () {
	# undefined
	builtin autoload -XUz
}
prompt () {
	# undefined
	builtin autoload -XUz
}
prstat () {
	# undefined
	builtin autoload -XUz
}
ps () {
	# undefined
	builtin autoload -XUz
}
ps1234 () {
	# undefined
	builtin autoload -XUz
}
pscp () {
	# undefined
	builtin autoload -XUz
}
pspdf () {
	# undefined
	builtin autoload -XUz
}
psutils () {
	# undefined
	builtin autoload -XUz
}
ptree () {
	# undefined
	builtin autoload -XUz
}
pump () {
	# undefined
	builtin autoload -XUz
}
putclip () {
	# undefined
	builtin autoload -XUz
}
pydoc () {
	# undefined
	builtin autoload -XUz
}
python () {
	# undefined
	builtin autoload -XUz
}
qemu () {
	# undefined
	builtin autoload -XUz
}
qiv () {
	# undefined
	builtin autoload -XUz
}
qtplay () {
	# undefined
	builtin autoload -XUz
}
quilt () {
	# undefined
	builtin autoload -XUz
}
raggle () {
	# undefined
	builtin autoload -XUz
}
rake () {
	# undefined
	builtin autoload -XUz
}
ranlib () {
	# undefined
	builtin autoload -XUz
}
rar () {
	# undefined
	builtin autoload -XUz
}
rcs () {
	# undefined
	builtin autoload -XUz
}
read () {
	# undefined
	builtin autoload -XUz
}
read_comp () {
	# undefined
	builtin autoload -XUz
}
readshortcut () {
	# undefined
	builtin autoload -XUz
}
rebootin () {
	# undefined
	builtin autoload -XUz
}
redirect () {
	local strs _comp_command1 _comp_command2 _comp_command
	_set_command
	strs=(-default-) 
	if [[ "$CURRENT" != "1" ]]
	then
		strs=("${_comp_command}" "$strs[@]") 
		if [[ -n "$_comp_command1" ]]
		then
			strs=("${_comp_command1}" "$strs[@]") 
			[[ -n "$_comp_command2" ]] && strs=("${_comp_command2}" "$strs[@]") 
		fi
	fi
	_dispatch -redirect-,{${compstate[redirect]},-default-},${^strs}
}
regex_arguments () {
	# undefined
	builtin autoload -XUz
}
regex_words () {
	# undefined
	builtin autoload -XUz
}
remote_files () {
	# undefined
	builtin autoload -XUz
}
renice () {
	# undefined
	builtin autoload -XUz
}
reprepro () {
	# undefined
	builtin autoload -XUz
}
requested () {
	local __gopt
	__gopt=() 
	zparseopts -D -a __gopt 1 2 V J x
	if comptags -R "$1"
	then
		if [[ $# -gt 3 ]]
		then
			_all_labels - "$__gopt[@]" "$@" || return 1
		elif [[ $# -gt 1 ]]
		then
			_description "$__gopt[@]" "$@"
		fi
		return 0
	else
		return 1
	fi
}
retrieve_cache () {
	# undefined
	builtin autoload -XUz
}
retrieve_mac_apps () {
	# undefined
	builtin autoload -XUz
}
ri () {
	# undefined
	builtin autoload -XUz
}
rlogin () {
	# undefined
	builtin autoload -XUz
}
rm () {
	# undefined
	builtin autoload -XUz
}
rpm () {
	# undefined
	builtin autoload -XUz
}
rpmbuild () {
	# undefined
	builtin autoload -XUz
}
rrdtool () {
	# undefined
	builtin autoload -XUz
}
rsync () {
	# undefined
	builtin autoload -XUz
}
rubber () {
	# undefined
	builtin autoload -XUz
}
ruby () {
	# undefined
	builtin autoload -XUz
}
sablotron () {
	# undefined
	builtin autoload -XUz
}
samba () {
	# undefined
	builtin autoload -XUz
}
savecore () {
	# undefined
	builtin autoload -XUz
}
sccs () {
	# undefined
	builtin autoload -XUz
}
sched () {
	# undefined
	builtin autoload -XUz
}
schedtool () {
	# undefined
	builtin autoload -XUz
}
schroot () {
	# undefined
	builtin autoload -XUz
}
screen () {
	# undefined
	builtin autoload -XUz
}
sed () {
	# undefined
	builtin autoload -XUz
}
sep_parts () {
	# undefined
	builtin autoload -XUz
}
service () {
	# undefined
	builtin autoload -XUz
}
services () {
	# undefined
	builtin autoload -XUz
}
set () {
	# undefined
	builtin autoload -XUz
}
set_command () {
	local command
	command="$words[1]" 
	[[ -z "$command" ]] && return
	if (( $+builtins[$command] + $+functions[$command] ))
	then
		_comp_command1="$command" 
		_comp_command="$_comp_command1" 
	elif [[ "$command[1]" = '=' ]]
	then
		eval _comp_command2\=$command
		_comp_command1="$command[2,-1]" 
		_comp_command="$_comp_command2" 
	elif [[ "$command" = ..#/* ]]
	then
		_comp_command1="${PWD}/$command" 
		_comp_command2="${command:t}" 
		_comp_command="$_comp_command2" 
	elif [[ "$command" = */* ]]
	then
		_comp_command1="$command" 
		_comp_command2="${command:t}" 
		_comp_command="$_comp_command2" 
	else
		_comp_command1="$command" 
		_comp_command2="$commands[$command]" 
		_comp_command="$_comp_command1" 
	fi
}
setfacl () {
	# undefined
	builtin autoload -XUz
}
setopt () {
	# undefined
	builtin autoload -XUz
}
setup () {
	local val nm="$compstate[nmatches]"
	[[ $# -eq 1 ]] && 2="$1" 
	if zstyle -a ":completion:${curcontext}:$1" list-colors val
	then
		zmodload -i zsh/complist
		if [[ "$1" = default ]]
		then
			_comp_colors=("$val[@]") 
		else
			_comp_colors=("$_comp_colors[@]" "(${2})${(@)^val:#(|\(*\)*)}" "${(M@)val:#\(*\)*}") 
		fi
	elif [[ "$1" = default ]]
	then
		unset ZLS_COLORS ZLS_COLOURS
	fi
	if zstyle -t ":completion:${curcontext}:$1" list-packed
	then
		compstate[list]="${compstate[list]} packed" 
	elif [[ $? -eq 1 ]]
	then
		compstate[list]="${compstate[list]:gs/packed//}" 
	else
		compstate[list]="$_saved_list" 
	fi
	if zstyle -t ":completion:${curcontext}:$1" list-rows-first
	then
		compstate[list]="${compstate[list]} rows" 
	elif [[ $? -eq 1 ]]
	then
		compstate[list]="${compstate[list]:gs/rows//}" 
	else
		compstate[list]="$_saved_list" 
	fi
	if zstyle -t ":completion:${curcontext}:$1" last-prompt
	then
		compstate[last_prompt]=yes 
	elif [[ $? -eq 1 ]]
	then
		compstate[last_prompt]='' 
	else
		compstate[last_prompt]="$_saved_lastprompt" 
	fi
	if zstyle -t ":completion:${curcontext}:$1" accept-exact
	then
		compstate[exact]=accept 
	elif [[ $? -eq 1 ]]
	then
		compstate[exact]='' 
	else
		compstate[exact]="$_saved_exact" 
	fi
	[[ _last_nmatches -ge 0 && _last_nmatches -ne nm ]] && _menu_style=("$_last_menu_style[@]" "$_menu_style[@]") 
	if zstyle -a ":completion:${curcontext}:$1" menu val
	then
		_last_nmatches=$nm 
		_last_menu_style=("$val[@]") 
	else
		_last_nmatches=-1 
	fi
	[[ "$_comp_force_list" != always ]] && zstyle -s ":completion:${curcontext}:$1" force-list val && [[ "$val" = always || ( "$val" = [0-9]## && ( -z "$_comp_force_list" || _comp_force_list -gt val ) ) ]] && _comp_force_list="$val" 
}
sh () {
	# undefined
	builtin autoload -XUz
}
showmount () {
	# undefined
	builtin autoload -XUz
}
signals () {
	# undefined
	builtin autoload -XUz
}
sisu () {
	# undefined
	builtin autoload -XUz
}
slrn () {
	# undefined
	builtin autoload -XUz
}
smit () {
	# undefined
	builtin autoload -XUz
}
snoop () {
	# undefined
	builtin autoload -XUz
}
socket () {
	# undefined
	builtin autoload -XUz
}
sockstat () {
	# undefined
	builtin autoload -XUz
}
softwareupdate () {
	# undefined
	builtin autoload -XUz
}
sort () {
	# undefined
	builtin autoload -XUz
}
source () {
	# undefined
	builtin autoload -XUz
}
spamassassin () {
	# undefined
	builtin autoload -XUz
}
sqlite () {
	# undefined
	builtin autoload -XUz
}
sqsh () {
	# undefined
	builtin autoload -XUz
}
ssh () {
	# undefined
	builtin autoload -XUz
}
sshfs () {
	# undefined
	builtin autoload -XUz
}
stat () {
	# undefined
	builtin autoload -XUz
}
stgit () {
	# undefined
	builtin autoload -XUz
}
store_cache () {
	# undefined
	builtin autoload -XUz
}
strace () {
	# undefined
	builtin autoload -XUz
}
strip () {
	# undefined
	builtin autoload -XUz
}
stty () {
	# undefined
	builtin autoload -XUz
}
su () {
	# undefined
	builtin autoload -XUz
}
sub_commands () {
	# undefined
	builtin autoload -XUz
}
subscript () {
	# undefined
	builtin autoload -XUz
}
subversion () {
	# undefined
	builtin autoload -XUz
}
sudo () {
	# undefined
	builtin autoload -XUz
}
suffix_alias_files () {
	local expl pat
	(( ${#saliases} )) || return 1
	if (( ${#saliases} == 1 ))
	then
		pat="*.${(kq)saliases}" 
	else
		local -a tmpa
		tmpa=(${(kq)saliases}) 
		pat="*.(${(kj.|.)tmpa})" 
	fi
	_path_files "$@" -g $pat
}
surfraw () {
	# undefined
	builtin autoload -XUz
}
svcadm () {
	# undefined
	builtin autoload -XUz
}
svccfg () {
	# undefined
	builtin autoload -XUz
}
svcprop () {
	# undefined
	builtin autoload -XUz
}
svcs () {
	# undefined
	builtin autoload -XUz
}
svcs_fmri () {
	# undefined
	builtin autoload -XUz
}
svn-buildpackage () {
	# undefined
	builtin autoload -XUz
}
sysctl () {
	# undefined
	builtin autoload -XUz
}
systemd () {
	# undefined
	builtin autoload -XUz
}
tags () {
	local prev
	if [[ "$1" = -- ]]
	then
		prev=- 
		shift
	fi
	if (( $# ))
	then
		local curcontext="$curcontext" order tag nodef tmp
		if [[ "$1" = -C?* ]]
		then
			curcontext="${curcontext%:*}:${1[3,-1]}" 
			shift
		elif [[ "$1" = -C ]]
		then
			curcontext="${curcontext%:*}:${2}" 
			shift 2
		fi
		[[ "$1" = -(|-) ]] && shift
		zstyle -a ":completion:${curcontext}:" group-order order && compgroups "$order[@]"
		comptags "-i$prev" "$curcontext" "$@"
		if [[ -n "$_sort_tags" ]]
		then
			"$_sort_tags" "$@"
		else
			zstyle -a ":completion:${curcontext}:" tag-order order || (( ! ${@[(I)options]} )) || order=('(|*-)argument-* (|*-)option[-+]* values' options) 
			for tag in $order
			do
				case $tag in
					(-) nodef=yes  ;;
					(\!*) comptry "${(@)argv:#(${(j:|:)~${=~tag[2,-1]}})}" ;;
					(?*) comptry -m "$tag" ;;
				esac
			done
			[[ -z "$nodef" ]] && comptry "$@"
		fi
		comptags "-T$prev"
		return
	fi
	comptags "-N$prev"
}
tar () {
	# undefined
	builtin autoload -XUz
}
tar_archive () {
	# undefined
	builtin autoload -XUz
}
tardy () {
	# undefined
	builtin autoload -XUz
}
tcpdump () {
	# undefined
	builtin autoload -XUz
}
tcpsys () {
	# undefined
	builtin autoload -XUz
}
tcptraceroute () {
	# undefined
	builtin autoload -XUz
}
telnet () {
	# undefined
	builtin autoload -XUz
}
terminals () {
	# undefined
	builtin autoload -XUz
}
tex () {
	# undefined
	builtin autoload -XUz
}
texi () {
	# undefined
	builtin autoload -XUz
}
texinfo () {
	# undefined
	builtin autoload -XUz
}
tidy () {
	# undefined
	builtin autoload -XUz
}
tiff () {
	# undefined
	builtin autoload -XUz
}
tilde () {
	[[ -n "$compstate[quote]" ]] && return 1
	local expl suf ret=1
	if [[ "$SUFFIX" = */* ]]
	then
		ISUFFIX="/${SUFFIX#*/}$ISUFFIX" 
		SUFFIX="${SUFFIX%%/*}" 
		suf=(-S '') 
	else
		suf=(-qS/) 
	fi
	_tags users named-directories directory-stack
	while _tags
	do
		_requested users && _users "$suf[@]" "$@" && ret=0 
		_requested named-directories expl 'named directory' compadd "$suf[@]" "$@" -k nameddirs && ret=0 
		_requested directory-stack && _directory_stack "$suf[@]" && ret=0 
		(( ret )) || return 0
	done
	return ret
}
tilde_files () {
	# undefined
	builtin autoload -XUz
}
time_zone () {
	# undefined
	builtin autoload -XUz
}
tin () {
	# undefined
	builtin autoload -XUz
}
tla () {
	# undefined
	builtin autoload -XUz
}
tmux () {
	# undefined
	builtin autoload -XUz
}
todo.sh () {
	# undefined
	builtin autoload -XUz
}
toilet () {
	# undefined
	builtin autoload -XUz
}
toolchain-source () {
	# undefined
	builtin autoload -XUz
}
topgit () {
	# undefined
	builtin autoload -XUz
}
totd () {
	# undefined
	builtin autoload -XUz
}
tpb () {
	# undefined
	builtin autoload -XUz
}
tpconfig () {
	# undefined
	builtin autoload -XUz
}
tracepath () {
	# undefined
	builtin autoload -XUz
}
trap () {
	# undefined
	builtin autoload -XUz
}
tree () {
	# undefined
	builtin autoload -XUz
}
ttyctl () {
	# undefined
	builtin autoload -XUz
}
tune2fs () {
	# undefined
	builtin autoload -XUz
}
twidge () {
	# undefined
	builtin autoload -XUz
}
twisted () {
	# undefined
	builtin autoload -XUz
}
typeset () {
	# undefined
	builtin autoload -XUz
}
ulimit () {
	# undefined
	builtin autoload -XUz
}
uml () {
	# undefined
	builtin autoload -XUz
}
unace () {
	# undefined
	builtin autoload -XUz
}
uname () {
	# undefined
	builtin autoload -XUz
}
unexpand () {
	# undefined
	builtin autoload -XUz
}
unhash () {
	# undefined
	builtin autoload -XUz
}
uniq () {
	# undefined
	builtin autoload -XUz
}
unison () {
	# undefined
	builtin autoload -XUz
}
units () {
	# undefined
	builtin autoload -XUz
}
unsetopt () {
	# undefined
	builtin autoload -XUz
}
update-alternatives () {
	# undefined
	builtin autoload -XUz
}
update-rc.d () {
	# undefined
	builtin autoload -XUz
}
update_ruby_version () {
	typeset -g ruby_version=''
	if which rvm-prompt &> /dev/null
	then
		ruby_version="$(rvm-prompt i v g)" 
	else
		if which rbenv &> /dev/null
		then
			ruby_version="$(rbenv version | sed -e "s/ (set.*$//")" 
		fi
	fi
}
urls () {
	# undefined
	builtin autoload -XUz
}
urpmi () {
	# undefined
	builtin autoload -XUz
}
urxvt () {
	# undefined
	builtin autoload -XUz
}
uscan () {
	# undefined
	builtin autoload -XUz
}
user_admin () {
	# undefined
	builtin autoload -XUz
}
user_at_host () {
	# undefined
	builtin autoload -XUz
}
user_expand () {
	# undefined
	builtin autoload -XUz
}
users () {
	local expl users
	if zstyle -a ":completion:${curcontext}:users" users users
	then
		_wanted users expl user compadd "$@" -a - users
		return 0
	fi
	_wanted users expl user compadd "$@" -k - userdirs
}
users_on () {
	# undefined
	builtin autoload -XUz
}
uzbl () {
	# undefined
	builtin autoload -XUz
}
valgrind () {
	# undefined
	builtin autoload -XUz
}
value () {
	# undefined
	builtin autoload -XUz
}
values () {
	# undefined
	builtin autoload -XUz
}
vared () {
	# undefined
	builtin autoload -XUz
}
vars () {
	# undefined
	builtin autoload -XUz
}
vcsh () {
	# undefined
	builtin autoload -XUz
}
vim () {
	# undefined
	builtin autoload -XUz
}
vim-addons () {
	# undefined
	builtin autoload -XUz
}
vnc () {
	# undefined
	builtin autoload -XUz
}
volume_groups () {
	# undefined
	builtin autoload -XUz
}
vorbis () {
	# undefined
	builtin autoload -XUz
}
vorbiscomment () {
	# undefined
	builtin autoload -XUz
}
vserver () {
	# undefined
	builtin autoload -XUz
}
vux () {
	# undefined
	builtin autoload -XUz
}
w3m () {
	# undefined
	builtin autoload -XUz
}
wait () {
	# undefined
	builtin autoload -XUz
}
wajig () {
	# undefined
	builtin autoload -XUz
}
wakeup_capable_devices () {
	# undefined
	builtin autoload -XUz
}
wanna-build () {
	# undefined
	builtin autoload -XUz
}
wanted () {
	local -a __targs __gopt
	zparseopts -D -a __gopt 1 2 V J x C:=__targs
	_tags "$__targs[@]" "$1"
	while _tags
	do
		_all_labels "$__gopt[@]" "$@" && return 0
	done
	return 1
}
webbrowser () {
	# undefined
	builtin autoload -XUz
}
wget () {
	# undefined
	builtin autoload -XUz
}
whereis () {
	# undefined
	builtin autoload -XUz
}
which () {
	# undefined
	builtin autoload -XUz
}
whois () {
	# undefined
	builtin autoload -XUz
}
wiggle () {
	# undefined
	builtin autoload -XUz
}
wpa_cli () {
	# undefined
	builtin autoload -XUz
}
x_arguments () {
	# undefined
	builtin autoload -XUz
}
x_borderwidth () {
	# undefined
	builtin autoload -XUz
}
x_color () {
	# undefined
	builtin autoload -XUz
}
x_colormapid () {
	# undefined
	builtin autoload -XUz
}
x_cursor () {
	# undefined
	builtin autoload -XUz
}
x_display () {
	# undefined
	builtin autoload -XUz
}
x_extension () {
	# undefined
	builtin autoload -XUz
}
x_font () {
	# undefined
	builtin autoload -XUz
}
x_geometry () {
	# undefined
	builtin autoload -XUz
}
x_keysym () {
	# undefined
	builtin autoload -XUz
}
x_locale () {
	# undefined
	builtin autoload -XUz
}
x_modifier () {
	# undefined
	builtin autoload -XUz
}
x_name () {
	# undefined
	builtin autoload -XUz
}
x_resource () {
	# undefined
	builtin autoload -XUz
}
x_selection_timeout () {
	# undefined
	builtin autoload -XUz
}
x_title () {
	# undefined
	builtin autoload -XUz
}
x_utils () {
	# undefined
	builtin autoload -XUz
}
x_visual () {
	# undefined
	builtin autoload -XUz
}
x_window () {
	# undefined
	builtin autoload -XUz
}
xargs () {
	# undefined
	builtin autoload -XUz
}
xauth () {
	# undefined
	builtin autoload -XUz
}
xclip () {
	# undefined
	builtin autoload -XUz
}
xdvi () {
	# undefined
	builtin autoload -XUz
}
xfig () {
	# undefined
	builtin autoload -XUz
}
xft_fonts () {
	# undefined
	builtin autoload -XUz
}
xloadimage () {
	# undefined
	builtin autoload -XUz
}
xmlsoft () {
	# undefined
	builtin autoload -XUz
}
xmms2 () {
	# undefined
	builtin autoload -XUz
}
xmodmap () {
	# undefined
	builtin autoload -XUz
}
xournal () {
	# undefined
	builtin autoload -XUz
}
xpdf () {
	# undefined
	builtin autoload -XUz
}
xrandr () {
	# undefined
	builtin autoload -XUz
}
xscreensaver () {
	# undefined
	builtin autoload -XUz
}
xset () {
	# undefined
	builtin autoload -XUz
}
xt_arguments () {
	# undefined
	builtin autoload -XUz
}
xt_session_id () {
	# undefined
	builtin autoload -XUz
}
xterm () {
	# undefined
	builtin autoload -XUz
}
xv () {
	# undefined
	builtin autoload -XUz
}
xwit () {
	# undefined
	builtin autoload -XUz
}
yast () {
	# undefined
	builtin autoload -XUz
}
yast2 () {
	# undefined
	builtin autoload -XUz
}
yodl () {
	# undefined
	builtin autoload -XUz
}
yp () {
	# undefined
	builtin autoload -XUz
}
yum () {
	# undefined
	builtin autoload -XUz
}
zargs () {
	# undefined
	builtin autoload -XUz
}
zattr () {
	# undefined
	builtin autoload -XUz
}
zcalc_line () {
	# undefined
	builtin autoload -XUz
}
zcat () {
	# undefined
	builtin autoload -XUz
}
zcompile () {
	# undefined
	builtin autoload -XUz
}
zdump () {
	# undefined
	builtin autoload -XUz
}
zed () {
	# undefined
	builtin autoload -XUz
}
zfs () {
	# undefined
	builtin autoload -XUz
}
zfs_dataset () {
	# undefined
	builtin autoload -XUz
}
zfs_keysource_props () {
	# undefined
	builtin autoload -XUz
}
zfs_pool () {
	# undefined
	builtin autoload -XUz
}
zftp () {
	# undefined
	builtin autoload -XUz
}
zip () {
	# undefined
	builtin autoload -XUz
}
zle () {
	# undefined
	builtin autoload -XUz
}
zlogin () {
	# undefined
	builtin autoload -XUz
}
zmodload () {
	# undefined
	builtin autoload -XUz
}
zmv () {
	# undefined
	builtin autoload -XUz
}
zoneadm () {
	# undefined
	builtin autoload -XUz
}
zones () {
	# undefined
	builtin autoload -XUz
}
zpool () {
	# undefined
	builtin autoload -XUz
}
zpty () {
	# undefined
	builtin autoload -XUz
}
zsh-mime-handler () {
	# undefined
	builtin autoload -XUz
}
zstyle () {
	# undefined
	builtin autoload -XUz
}
ztodo () {
	# undefined
	builtin autoload -XUz
}
zypper () {
	# undefined
	builtin autoload -XUz
}
any () {
	emulate -L zsh
	unsetopt KSH_ARRAYS
	if [[ -z "$1" ]]
	then
		echo "any - grep for process(es) by keyword" >&2
		echo "Usage: any " >&2
		return 1
	else
		ps xauwww | grep -i --color=auto "[${1[1]}]${1[2,-1]}"
	fi
}
box_name () {
	[ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}
ccc () {
	echo "$1" >> /home/bani/zdotfiles/Tools/1/aliasw.sh
	echo "Now, we got '$1' "
	cat '/home/bani/zdotfiles/Tools/1/aliasw.sh'
	echo '/home/bani/zdotfiles/Tools/1/aliasw.sh'
}
cmdfu () {
	local t=~/cmdfu
	echo -e "\n# $1 {{{1" >> $t
	curl -L "commandlinefu.com/commands/matching/$1/`echo -n $1|base64`/plaintext" | sed '1,2d;s/^#.*/& {{{2/g' > $t
	vim -u /dev/null -c "set ft=sh fdm=marker fdl=1 noswf" -M $t
	rm $t
}
colors () {
	emulate -L zsh
	typeset -Ag color colour
	color=(00 none 01 bold 02 faint 22 normal 03 standout 23 no-standout 04 underline 24 no-underline 05 blink 25 no-blink 07 reverse 27 no-reverse 08 conceal 28 no-conceal 30 black 40 bg-black 31 red 41 bg-red 32 green 42 bg-green 33 yellow 43 bg-yellow 34 blue 44 bg-blue 35 magenta 45 bg-magenta 36 cyan 46 bg-cyan 37 white 47 bg-white 39 default 49 bg-default) 
	local k
	for k in ${(k)color}
	do
		color[${color[$k]}]=$k 
	done
	for k in ${color[(I)3?]}
	do
		color[fg-${color[$k]}]=$k 
	done
	color[grey]=${color[black]} 
	color[fg-grey]=${color[grey]} 
	color[bg-grey]=${color[bg-black]} 
	colour=(${(kv)color}) 
	local lc=$'\e[' rc=m
	typeset -Hg reset_color bold_color
	reset_color="$lc${color[none]}$rc" 
	bold_color="$lc${color[bold]}$rc" 
	typeset -AHg fg fg_bold fg_no_bold
	for k in ${(k)color[(I)fg-*]}
	do
		fg[${k#fg-}]="$lc${color[$k]}$rc" 
		fg_bold[${k#fg-}]="$lc${color[bold]};${color[$k]}$rc" 
		fg_no_bold[${k#fg-}]="$lc${color[normal]};${color[$k]}$rc" 
	done
	typeset -AHg bg bg_bold bg_no_bold
	for k in ${(k)color[(I)bg-*]}
	do
		bg[${k#bg-}]="$lc${color[$k]}$rc" 
		bg_bold[${k#bg-}]="$lc${color[bold]};${color[$k]}$rc" 
		bg_no_bold[${k#bg-}]="$lc${color[normal]};${color[$k]}$rc" 
	done
}
compaudit () {
	# undefined
	builtin autoload -XUz
}
compdef () {
	local opt autol type func delete eval new i ret=0 cmd svc
	local -a match mbegin mend
	emulate -L zsh
	setopt extendedglob
	if (( ! $# ))
	then
		print -u2 "$0: I need arguments"
		return 1
	fi
	while getopts "anpPkKde" opt
	do
		case "$opt" in
			(a) autol=yes  ;;
			(n) new=yes  ;;
			([pPkK]) if [[ -n "$type" ]]
				then
					print -u2 "$0: type already set to $type"
					return 1
				fi
				if [[ "$opt" = p ]]
				then
					type=pattern 
				elif [[ "$opt" = P ]]
				then
					type=postpattern 
				elif [[ "$opt" = K ]]
				then
					type=widgetkey 
				else
					type=key 
				fi ;;
			(d) delete=yes  ;;
			(e) eval=yes  ;;
		esac
	done
	shift OPTIND-1
	if (( ! $# ))
	then
		print -u2 "$0: I need arguments"
		return 1
	fi
	if [[ -z "$delete" ]]
	then
		if [[ -z "$eval" ]] && [[ "$1" = *\=* ]]
		then
			while (( $# ))
			do
				if [[ "$1" = *\=* ]]
				then
					cmd="${1%%\=*}" 
					svc="${1#*\=}" 
					func="$_comps[${_services[(r)$svc]:-$svc}]" 
					[[ -n ${_services[$svc]} ]] && svc=${_services[$svc]} 
					[[ -z "$func" ]] && func="${${_patcomps[(K)$svc][1]}:-${_postpatcomps[(K)$svc][1]}}" 
					if [[ -n "$func" ]]
					then
						_comps[$cmd]="$func" 
						_services[$cmd]="$svc" 
					else
						print -u2 "$0: unknown command or service: $svc"
						ret=1 
					fi
				else
					print -u2 "$0: invalid argument: $1"
					ret=1 
				fi
				shift
			done
			return ret
		fi
		func="$1" 
		[[ -n "$autol" ]] && autoload -Uz "$func"
		shift
		case "$type" in
			(widgetkey) while [[ -n $1 ]]
				do
					if [[ $# -lt 3 ]]
					then
						print -u2 "$0: compdef -K requires <widget> <comp-widget> <key>"
						return 1
					fi
					[[ $1 = _* ]] || 1="_$1" 
					[[ $2 = .* ]] || 2=".$2" 
					[[ $2 = .menu-select ]] && zmodload -i zsh/complist
					zle -C "$1" "$2" "$func"
					if [[ -n $new ]]
					then
						bindkey "$3" | IFS=$' \t' read -A opt
						[[ $opt[-1] = undefined-key ]] && bindkey "$3" "$1"
					else
						bindkey "$3" "$1"
					fi
					shift 3
				done ;;
			(key) if [[ $# -lt 2 ]]
				then
					print -u2 "$0: missing keys"
					return 1
				fi
				if [[ $1 = .* ]]
				then
					[[ $1 = .menu-select ]] && zmodload -i zsh/complist
					zle -C "$func" "$1" "$func"
				else
					[[ $1 = menu-select ]] && zmodload -i zsh/complist
					zle -C "$func" ".$1" "$func"
				fi
				shift
				for i
				do
					if [[ -n $new ]]
					then
						bindkey "$i" | IFS=$' \t' read -A opt
						[[ $opt[-1] = undefined-key ]] || continue
					fi
					bindkey "$i" "$func"
				done ;;
			(*) while (( $# ))
				do
					if [[ "$1" = -N ]]
					then
						type=normal 
					elif [[ "$1" = -p ]]
					then
						type=pattern 
					elif [[ "$1" = -P ]]
					then
						type=postpattern 
					else
						case "$type" in
							(pattern) if [[ $1 = (#b)(*)=(*) ]]
								then
									_patcomps[$match[1]]="=$match[2]=$func" 
								else
									_patcomps[$1]="$func" 
								fi ;;
							(postpattern) if [[ $1 = (#b)(*)=(*) ]]
								then
									_postpatcomps[$match[1]]="=$match[2]=$func" 
								else
									_postpatcomps[$1]="$func" 
								fi ;;
							(*) if [[ "$1" = *\=* ]]
								then
									cmd="${1%%\=*}" 
									svc=yes 
								else
									cmd="$1" 
									svc= 
								fi
								if [[ -z "$new" || -z "${_comps[$1]}" ]]
								then
									_comps[$cmd]="$func" 
									[[ -n "$svc" ]] && _services[$cmd]="${1#*\=}" 
								fi ;;
						esac
					fi
					shift
				done ;;
		esac
	else
		case "$type" in
			(pattern) unset "_patcomps[$^@]" ;;
			(postpattern) unset "_postpatcomps[$^@]" ;;
			(key) print -u2 "$0: cannot restore key bindings"
				return 1 ;;
			(*) unset "_comps[$^@]" ;;
		esac
	fi
}
compdump () {
	# undefined
	builtin autoload -XUz
}
compinit () {
	# undefined
	builtin autoload -XUz
}
compinstall () {
	# undefined
	builtin autoload -XUz
}
console () {
	if [[ $# > 0 ]]
	then
		query=$(echo "$*"|tr -s ' ' '|') 
		tail -f /var/log/system.log | grep -i --color=auto -E "$query"
	else
		tail -f /var/log/system.log
	fi
}
current_pwd () {
	echo $(pwd | sed -e "s,^$HOME,~,")
}
ex () {
	if [[ -f $1 ]]
	then
		case $1 in
			(*.tar.bz2) tar xvjf $1 ;;
			(*.tar.gz) tar xvzf $1 ;;
			(*.tar.xz) tar xvJf $1 ;;
			(*.tar.lzma) tar --lzma xvf $1 ;;
			(*.bz2) bunzip $1 ;;
			(*.rar) unrar $1 ;;
			(*.gz) gunzip $1 ;;
			(*.tar) tar xvf $1 ;;
			(*.tbz2) tar xvjf $1 ;;
			(*.tgz) tar xvzf $1 ;;
			(*.zip) unzip $1 ;;
			(*.Z) uncompress $1 ;;
			(*.7z) 7z x $1 ;;
			(*.dmg) hdiutul mount $1 ;;
			(*) echo "'$1' cannot be extracted via >ex<" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}
git_prompt_string () {
	local git_where="$(parse_git_branch)"
	[ -n "$git_where" ] && echo "on %{$fg[blue]%}${git_where#(refs/heads/|tags/)}$(parse_git_state)"
}
givedef () {
	if [[ $# -ge 2 ]]
	then
		echo "givedef: too many arguments" >&2
		return 1
	else
		curl "dict://dict.org/d:$1"
	fi
}
glll () {
	cd $HOME/zdotfiles
	git add -A
	git commit -a
	git push origin master
}
google () {
	Q="$@" 
	GOOG_URL='https://www.google.de/search?tbs=li:1&q=' 
	AGENT="Mozilla/4.0" 
	stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\ /+}" | grep -oP '\/url\?q=.+?&amp' | sed 's|/url?q=||; s|&amp||') 
	echo -e "${stream//\%/\x}"
}
i () {
	cd "$(cat ~/.save_dir)"
}
myip () {
	ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0 : " $2}'
	ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}
nicemount () {
	(
		echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2="";1'
	) | column -t
}
parse_git_branch () {
	(
		git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD
	) 2> /dev/null
}
parse_git_state () {
	local GIT_STATE=""
	local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
	if [ "$NUM_AHEAD" -gt 0 ]
	then
		GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD} 
	fi
	local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
	if [ "$NUM_BEHIND" -gt 0 ]
	then
		GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND} 
	fi
	local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
	if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD
	then
		GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING 
	fi
	if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]
	then
		GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED 
	fi
	if ! git diff --quiet 2> /dev/null
	then
		GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED 
	fi
	if ! git diff --cached --quiet 2> /dev/null
	then
		GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED 
	fi
	if [[ -n $GIT_STATE ]]
	then
		echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
	fi
}
path () {
	echo $PATH | tr ":" "\n" | awk "{ sub(\"/usr\", \"$fg_no_bold[green]/usr$reset_color\");         sub(\"/bin\", \"$fg_no_bold[blue]/bin$reset_color\");         sub(\"/opt\", \"$fg_no_bold[cyan]/opt$reset_color\");         sub(\"/sbin\", \"$fg_no_bold[magenta]/sbin$reset_color\");         sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\");         print }"
}
postexec () {
	set_running_app
}
precmd () {
	echo -ne "\e]2;$PWD\a"
	echo -ne "\e]1;$PWD:h:t/$PWD:t\a"
}
preexec () {
	set_running_app
}
prompt_char () {
	git branch > /dev/null 2> /dev/null && echo '±' && return
	hg root > /dev/null 2> /dev/null && echo '☿' && return
	echo '○'
}
run-help () {
	# undefined
	builtin autoload -XUz
}
s () {
	pwd > ~/.save_dir
}
set_running_app () {
	printf "\e]1; $PWD:t:$(history $HISTCMD | cut -b7- ) \a"
}
virtualenv_info () {
	[ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}
wW_grep_logs () {
	grep --color=auto "$1" */logs/*.log
}
wpr () {
	grep '^'$(date +\%d) $HOME/zdotfiles/Time/$(date +\%m) | awk '{print " \n\n Fajer   : " $2 "\n SHAROOK : " $3 "\n Dohr    : " $4  "\n ASER    : " $5  "\n MAGREP  : " $6  "\n ISHA    : " $7 }'
}
wsed () {
	find . -name '*.txt' -exec sed -ir 's/this/that/g' {} \;
}
ww10 () {
	for i in $(seq 0 10)
	do
		echo $i
	done
}
wwgg () {
	curl -u tazjel --silent "https://mail.google.com/mail/feed/atom" | awk 'BEGIN{FS="\n";RS="(</entry>\n)?<entry>"}NR!=1{print "\033[1;31m"$9"\033[0;32m ("$10")\033[0m:\t\033[1;33m"$2"\033[0m"}' | sed -e 's,<[^>]*>,,g' | column -t -s $'\t'
}
wwiki () {
	./zdotfiles/Tools/wikisole.sh $1
}
zbp () {
	for xx in ~/.*
	do
		rsync -avz --progress $HOME/.* $HOME/zrsync
		echo $xx
	done
}
zle-line-finish () {
	printf '%s' ${terminfo[rmkx]}
}
zle-line-init () {
	printf '%s' ${terminfo[smkx]}
}