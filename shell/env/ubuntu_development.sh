#!/bin/bash

# version
# cat /etc/issue
# Ubuntu 16.04.1 LTS \n \l

# source
# /etc/apt/sources.list
# http://mirrors.163.com/.help/ubuntu.html
# http://ftp.sjtu.edu.cn/ubunbu/
# sudo apt-get update

# samba winbind
# sudo apt-get install samba winbind -y
# or
# sudo apt-get install samba libnss-winbind -y
# /etc/samba/smb.conf [global] wins server = 172.26.10.91
# /etc/nsswitch.conf hosts wins
# sudo service smbd restart

# gcc/g++
# sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.7 40
# sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 30
# sudo update-alternatives --config gcc
# sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.7 40
# sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.6 30
# sudo update-alternatives --config g++

# file
# sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so /usr/lib/i386-linux-gnu/libGL.so
# sudo cp /usr/include/x86_64-linux-gnu/zconf.h /usr/include/

# jdk6
# java javac javaws jar

# qmake
# QtCreator

# ssh
# ssh-keygen -t rsa
# ~/.ssh/

# git
# git config --global user.name xxx
# git config --global user.email xxx
# git config --global core.autocrlf input
# git config --global core.safecrlf true

# repo
# git clone ssh://igerrit.storm:29418/tools/repo.git
# cd repo
# git checkout -b stable origin/stable
# sudo ln repo /usr/bin/repo

UBUNTU_PREREQUISITES=(
	synaptic\
	samba\
	winbind\
	apt-file\
	rabbitvcs-nautilus\
	rabbitvcs-gedit\
	nautilus-open-terminal\
	dos2unix\
	vim\
	libreadline6-dev:i386\
	chromium-browser\
	chromium-codecs-ffmpeg-extra\
	ssh\
	xrdp\
	gnupg\
	curl\
	git\
	gitk\
	subversion\
	meld\
	build-essential\
	cmake\
	dh-autoreconf\
	ccache\
	bison\
	gperf\
	gcc-4.6\
	g++-4.6\
	g++-4.6-multilib\
	g++-multilib\
	g++-4.7-multilib\
	ia32-libs\
	libc-dev:i386\
	libc-dev-i386\
	libc6-dev\
	libc6-dev-i386\
	libdirectfb-dev\
	libsqlite3-dev\
	libdbus-1-dev\
	libevent-dev\
	libncurses5-dev\
	libncurses5-dev:i386\
	lib32ncurses5-dev\
	libxcursor-dev\
	libx11-dev:i386\
	x11proto-core-dev\
	libglapi-mesa:i386\
	libgl1-mesa-dev\
	libgl1-mesa-glx:i386\
	libegl1-mesa-dev\
	libgles2-mesa-dev\
	xserver-xorg\
	xserver-common\
	mingw32\
	libpango1.0-dev\
	libicu-dev\
	gimp\
	flex\
	tofrodos\
	libtiff4\
	libpulse-dev\
	libasound2-dev\
	libesd0-dev\
	libgstreamer0.10-dev\
	libgstreamer-plugins-base0.10-dev\
	gstreamer0.10-plugins-good\
	gstreamer0.10-plugins-ugly\
	gstreamer0.10-plugins-bad\
	gstreamer0.10-plugins-bad-multiverse\
	gstreamer0.10-fluendo-mp3\
	gstreamer0.10-ffmpeg\
	gstreamer0.10-libav\
	ffmpeg\
	libxml2-dev\
	libxml2-utils\
	xsltproc\
	zip\
	zlib1g-dev:i386\
	lib32z1-dev\
	eclipse\
	eclipse-cdt\
	android-tools-adb\
	pyside-tools\
	python-m2crypto\
	python-lxml\
	python-markdown\
	python-setuptools\
	python-pygments\
	python-yaml\
	libgif-dev\
	xvfb)

install_prerequisite()
{
	test $# == 0 && return
	echo "INSTALL $1 ..."
	sudo apt-get install $1 -y
	test $? != 0 && echo "ERROR $1" exit
}

install_all()
{
	for name in ${UBUNTU_PREREQUISITES[@]}
	do
		install_prerequisite $name
	done
}

config_hosts()
{
	sudo echo "172.26.10.20  jupiter" >> /etc/hosts
	sudo echo "172.26.10.41  oa-center" >> /etc/hosts
	sudo echo "172.26.178.153" >> /etc/hosts
	sudo echo "192.168.8.200  ibigtom" >> /etc/hosts
	sudo echo "192.168.8.201  iwiki" >> /etc/hosts
	sudo echo "192.168.8.202  iredmine" >> /etc/hosts
	sudo echo "192.168.8.203  igerrit" >> /etc/hosts
	sudo echo "192.168.8.204  17cyci" >> /etc/hosts
}

echo "DONE"
