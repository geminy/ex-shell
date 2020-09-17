##################################################
# Grep functions from current directory          #
##################################################

#!/usr/bin/env bash

# necessary functions added here
GREP_FUNCTIONS=(\
#	\[\
	at\(\
	front\(\)\
	back\(\)\
	first\(\)\
	last\(\)\
	constFirst\(\)\
	constLast\(\)\
	pop_front\(\)\
	pop_back\(\)\
	takeAt\(\
	takeFirst\(\)\
	takeLast\(\)\
	move\(\
	swap\(\
	replace\(\
	erase\(\
	insert\()

function grep_functions()
{
	echo "********** grep [ begin **********"
	grep -nr "\[" .
    echo "********** gerp ] end **********"

	local function_num=${#GREP_FUNCTIONS[*]}
	for ((i=0; i<$function_num; i=i+1))
	do
		local function_name=${GREP_FUNCTIONS[$i]}
		echo "********** grep $function_name begin **********"
		grep -nr "$function_name" .
		echo "********** gerp $function_name end **********"
	done
}

main()
{
	echo "********** begin **********"
	grep_functions
	echo "********** end **********"
}

main
