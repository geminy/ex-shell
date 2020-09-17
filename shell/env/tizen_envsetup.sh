##################################################
# Build Tizen with Yocto Project                 #
##################################################

#!/usr/bin/env bash

# necessary packages added here
UBUNTU_PACKAGES=(\
	gawk\
	wget\
	git-core\
	diffstat\
	unzip\
	texinfo\
	gcc-multilib\
	build-essential\
	chrpath\
	libsdl1.2-dev\
	xterm\
	libattr1-dev\
	binutils-gold\
	quilt\
	cpio\
	libwayland-dev\
	ccache\
	socat)

function install_package()
{
	local package_num=${#UBUNTU_PACKAGES[*]}
	for ((i=0; i<$package_num; i=i+1))
	do
		local package_name=${UBUNTU_PACKAGES[$i]}
		echo "********** install $package_name begin **********"
		sudo apt-get install $package_name -y > /dev/null
		echo "********** install $package_name end **********"
	done
}

# 1. download tizen distribution
#    git clone git://git.tizen.org/scm/bb/tizen-distro
# 2. create build directory
#   cd tizen-distro
#   git checkout tizen-ivi
#   build_directory_name=build-modello
#   source ./tizen-ivi-init-build-env $build_directory_name
# 3. local configuration
#   vi conf/local.conf
#   select MACHINE ??= "genericx86-64"
# 4. build image
#   bitbake tizen-ivi-Modello-image
#   generated image in tmp-glibc/depoly/images/${MACHINE}

main()
{
	echo "********** begin **********"
	install_package
	echo "********** end **********"
}

main
