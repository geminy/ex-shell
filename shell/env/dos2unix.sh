####################
# dos2unix tool    #
####################

function do_dos2unix()
{
	echo "f...${PWD}/$1"
	file $1 | grep "CRLF" &> /dev/null
	if [ 0 == $? ]; then
		dos2unix $1
	fi
}

function do_process_dir()
{
	echo "d...${PWD}"
	for file in `ls -A`
	do
		if [ -f $file ]; then
			do_dos2unix $file
		elif [ -d $file ]; then
			cd $file
			do_process_dir $file
			cd ..
		else
			echo "ignore...$file"
		fi
	done
}

for file in `ls -A`
do
	if [ -f $file ]; then
		do_dos2unix $file
	elif [ -d $file ]; then
		cd $file
		do_process_dir $file
		cd ..
	else
		echo "ignore...$file"
	fi
done

