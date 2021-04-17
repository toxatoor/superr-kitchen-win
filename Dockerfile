FROM ubuntu:20.04


RUN apt-get update && apt-get install -y python3 sudo openjdk-11-jre unzip
RUN useradd -m -s /bin/bash super

ADD SuperRs-Kitchen_Linux-64_v1.2.1.2.zip /SuperRs-Kitchen_Linux-64_v1.2.1.2.zip
ADD mounts /mounts
ADD prepare.sh /prepare.sh

ADD sudoers /etc/sudoers
RUN chmod 440 /etc/sudoers
RUN mkdir -p /chroot/home/super
CMD ["/bin/bash", "/prepare.sh"]


