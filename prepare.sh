#!/bin/bash

if [ ! -d /chroot ]; then 
	mkdir /chroot
fi

for dir in $(find / -maxdepth 1 -type d,l | grep -v '^/$' | grep -v chroot | grep -v proc | grep -v home)
do 
	mkdir /chroot${dir}
	mount -o bind ${dir} /chroot${dir}
done

mkdir /chroot/proc ; cp /mounts /chroot/proc/mounts 
hostname super 
echo -ne "nameserver 1.1.1.1" > /chroot/etc/resolv.conf 
echo -ne "127.0.0.1 super" >> /chroot/etc/hosts
ln -s ln -s /usr/lib/jvm/java-11-openjdk-amd64/lib/jli/libjli.so /lib/

cd /chroot/home/super 

if [ ! -f tools.img ] ;  then 
	dd if=/dev/zero of=tools.img bs=1M count=200 
	mkfs.ext3 tools.img
fi

if [ ! -d tools ] ;  then 
	mkdir tools
fi

mount -o loop tools.img tools

if [ ! -f README.md ] ; then 
	unzip /SuperRs-Kitchen_Linux-64_v1.2.1.2.zip ; chown -R super:super /chroot/home/super
fi
chroot /chroot sudo -u super bash -c 'reset ; cd /home/super ; ./superr'
# bash
