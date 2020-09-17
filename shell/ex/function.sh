# cat and << and EOF
# function and parentheses
function function_parentheses() {
cat	<<EOF
shell:
	function and parentheses
EOF
}

# only function, no parentheses
function function_only {
cat <<EOF
shell:
	only function, no parentheses
EOF
}

# echo with -e
# only parentheses, no function
parentheses_only() {
	echo "shell:"
	echo -e "\tonly parentheses, no function"
}

# $(cmd) `cmd`
# echo ${var} "$var" $var
# local
# seq for(())
# ;
# "$var" '$var'
# string-concatenation
A="global"
function loop_for() {
	workdir=$(pwd)
	echo ${workdir}
	echo "$A"
	local A
	A=""
	for i in `seq 1 10`; do
		A="$A $i"
	done
	echo $A
	A=""
	for((i=1; i<=10; i=i+1))
	do
		A=$A" "$i
	done
	echo $A
}

# function as one command
# echo and return
function function_test() {
	T=$(use_echo)
	echo $T
	T=`use_echo2`
	echo $T
	T=$(use_echo3)
	echo $T
	T=$(use_return)
	echo $?
}

# echo for $T
function use_echo
{
	echo "only function"
}

# echo for $T
function use_echo2() {
	echo "function and parentheses"
}

# echo for $T
use_echo3() {
	echo "only parentheses"
}

# return for $?
function use_return() {
	return 1
}

# array
function array_usage() {
	variant_choices=(user userdebug eng)
	echo ${#variant_choices}
	echo ${#variant_choices[@]}
	for v in ${variant_choices[@]}
	do
		echo $v
	done
	for v in ${variant_choices[*]}
	do
		echo $v
	done
}

# args
function function_args() {
	echo $@
	echo $*
	echo $#
	echo $0 $1 $2
}

# args test
function function_args_test() {
	echo "no args"
	function_args
	echo "----------"
	echo "one args"
	function_args hello
	echo "----------"
	echo "two args"
	function_args hello shell
}

# autotab and _autotab
# complete compgen compopt
# SYSTEM VARS
function autotab() {
	echo "autotab"
}

autotab_list=("aa" "bb" "cc" "dd" "abcd")
autotab_list=(${autotab_list[@]} "abcdefg")
function _autotab() {
	local cur prev opts
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	COMPREPLY=( $(compgen -W "${autotab_list[*]}" -- ${cur}) )
	return 0
}
if [[ $(type -t compopt) = "builtin" ]]; then
    echo "compopt: builtin"
	complete -F _autotab autotab
else
    echo "compopt: non-builtin"
	complete -o nospace -F _autotab autotab
fi

# read
# echo with -n
function use_read() {
	local var=
	read var
	echo -n $var
	echo $var
}

# if with [] and ()
# () seems to $?
function if_test() {
	local a=$1
	echo "first arg: "$a
	if [ -z "$a" ]
	then
		echo "length: zero"
	elif (echo -n $a | grep -q -e "^[0-9][0-9]*$")
	then
		echo "length: non-zero"
	fi
}

# shell check
if [ "x$SHELL" != "x/bin/bash" ]; then
    case `ps -o command -p $$` in
        *bash*)
            ;;
        *)
            echo "WARNING: Only bash is supported, use of other shell would lead to erroneous results"
            ;;
    esac
else
	echo "shell: $SHELL"
fi
