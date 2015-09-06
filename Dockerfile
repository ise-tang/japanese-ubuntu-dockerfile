#
# Ruby with RVM on Japanese Ubuntu Dockerfile
#

From ubuntu:15.04
MAINTAINER issei126

RUN useradd -m -d /home/issei126 -s /bin/bash -g users issei126 
RUN echo "issei126:users" | chpasswd \
 && mkdir /home/issei126/.ssh \
 && chmod 700 /home/issei126/.ssh \
 && chown -R issei126:issei126 /home/issei126/.ssh

RUN echo "issei126 ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN echo "Defaults        exempt_group=wheel" >> /etc/sudoers
WORKDIR /home/issei126

# Japanese packages

RUN wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add -
RUN wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | sudo apt-key add -
RUN sudo wget https://www.ubuntulinux.jp/sources.list.d/vivid.list -O /etc/apt/sources.list.d/ubuntu-ja.list
RUN sudo apt-get update
RUN sudo apt-get upgrade -y
RUN sudo apt-get install ubuntu-defaults-ja -y
 
RUN apt-get update
RUN apt-get upgrade -y

user issei126
