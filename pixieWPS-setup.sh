#!/bin/bash

GREEN="\033[01;32m"
RESET="\033[00m"


echo -e "${GREEN}Getting Updates${RESET}"
sleep 1
apt-get update

echo -e "${GREEN}Updates Complete, Installing Dependencies${RESET}"
sleep 1
apt-get -y install libssl-dev libpcap-dev libsqlite3-dev build-essential sqlite3 aircrack-ng pixiewps

echo -e "${GREEN}Dependencies Installed, Downloading PixieWPS${RESET}"
sleep 1
mkdir PixieWPS
cd PixieWPS
wget https://github.com/wiire/pixiewps/archive/master.zip && unzip master.zip

echo -e "${GREEN}PixieWPS Downloaded, Executing 'Make' PixieWPS${RESET}"
sleep 1
rm -rf master.zip
cd pixiewps-master/
cd src/
make

echo -e "${GREEN}Make is Complete, Executing 'Make Install'${RESET}"
sleep 1
make install

echo -e "${GREEN}Make Install is complete${RESET}"
sleep 1

echo -e "${GREEN}Downloading Reaver t6x Fork${RESET}"
sleep 1
cd ../../../
mkdir ReaverT6x
cd ReaverT6x
wget https://github.com/t6x/reaver-wps-fork-t6x/archive/master.zip && unzip master.zip

echo -e "${GREEN}Reaver Downloaded, Executing 'Configure & Make & Make Install'${RESET}"
sleep 1
rm -rf master.zip
cd reaver-wps-fork-t6x-master/
cd src/
/bin/bash configure
make
make install

echo -e "${GREEN}ALL DONE${RESET}"
