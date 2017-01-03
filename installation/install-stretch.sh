#!/bin/bash

#lmms qSynth mixxx

clear

#codename=jessie
codename=stretch

echo "script configured for Debian $codename"

fontSourceDir="~/Daten.2015/Buero/Vorlagen/fonts"

apt-get update
apt-get upgrade

echo 
echo 
echo
echo -e "Bitte mit sudo starten, z.B.: \e[91msudo ./install.sh\e[39m, sudo muss zuerst installiert werden mit 'apt-get -y install sudo'?"
echo -e "Run with sudo, eg: \e[91msudo ./install.sh\e[39m, you must install sudo first with 'apt-get -y install sudo'?"

printf "continue? (y/n)"
read answer
if echo "$answer" | grep -iq "^y" ;
then
  echo "weiter..."
  echo "continuing..."
else
  exit
fi


echo
echo
echo -e "\e[91mDebian Schlüssel\e[39m runterladen & lokal speichern (y/n)?"
echo -e "Download \e[91mDebian KeyFingerprints\e[39m & save local (y/n)?"

printf "save? (y/n)"

read answer
if echo "$answer" | grep -iq "^y" ;
then
mkdir $(date +%y%m%d)
cd $(date +%y%m%d)
wget -r -l4 -A sign http://cdimage.debian.org/debian-cd/8.3.0
cd ..

for i in $(ls -d $(date +%y)* |grep -v sum); do find ./$i -exec cat '{}' >$i.sums  \; && echo ---; done
apt-get -y install diffuse && diffuse $(date +%y)*.sums

else
  echo -e "lade Debian Schlüssel nicht runter"
  echo -e "not downloading debian fingerprints"
fi

echo -e "\e[91mDebian Repository Index\e[39m über \e[33mTor\e[39m runterladen, was dann apt automatisch vergleicht (y/n)?"
echo -e "Donwload \e[91mDebian repository Index\e[39m über \e[33mTor\e[39m, apt would say if someone changed them (y/n)?"

printf "use TOR (The Onion Router)? (y/n)"

read answer
if echo "$answer" | grep -iq "^y" ;then
apt-get update
apt-get upgrade
apt-get -y install torsocks apt-transport-tor
mv /etc/apt/sources.list /etc/apt/sources.list.bak$(date +%y%m%d%H%M%S)

echo "
deb tor+http://vwakviie2ienjx6t.onion/debian/ $codename main contrib
deb tor+http://earthqfvaeuv5bla.onion/debian/ $codename main contrib
" >> /etc/apt/sources.list
apt-get update
apt-get upgrade
else
    echo Benutzer das Tor-Netzwerk nicht
    echo Not using Tor-Network
fi

apt-get -y install tor tor-arm

echo
echo
echo -e "Wieder den normalen \e[91mhttpredir.debian.org\e[39m verwenden der \e[33mschneller\e[39m ist also über das Tor-Netzwerk?"
echo -e "Switch back to normale \e[91mhttpredir.debian.org\e[39m mirror, normally \e[33mfaster\e[39m than with Tor-Netzwork?"

printf "use normal mirror? (y/n)"

read answer
if echo "$answer" | grep -iq "^y" ;then

#Sicherheitskopie vom sources.list machen
mv /etc/apt/sources.list /etc/apt/sources.list.bak$(date +%y%m%d%H%M%S)

#neue sources,list schreiben
echo "
deb http://httpredir.debian.org/debian/ $codename main contrib
deb-src http://httpredir.debian.org/debian/ $codename main contrib

deb http://security.debian.org/ $codename/updates main contrib
deb-src http://security.debian.org/ $codename/updates main contrib

deb http://httpredir.debian.org/debian/ $codename-updates main contrib
deb-src http://httpredir.debian.org/debian/ $codename-updates main contrib
" >>/etc/apt/sources.list

else
  echo -e "Verwende weiter das Tor-Netzwerk"
  echo -e "Continuing using apt-transport-tor"
fi

#update && upgrade
apt-get update && apt-get upgrade

#vi /etc/apt/sources.list

#debian jessie
#apt-get -y install sudo gdm3 gnome gnome-shell inkscape gimp libreoffice nmap keepassx vim icedove gnome-commander iceweasel libreoffice-help-de libreoffice-l10n-de clive mc pam-usb* xsane md5deep rsync redshift extundelete gconf-editor  gparted chromium rdfind kdenlive snmp virtualbox kazam stopmotion jigdo-file qrencode posterazor audacity build-essential pkg-config  libdbus-1-dev apt-xapian-index apt-file figlet gconf-editor git nmon tcpdump iptraf mumble font-manager quassel libreoffice-l10n-de pidgin

#Debian stretch
apt-get -y install sudo
apt-get -y install gdm3
apt-get -y install lightdm lxde
apt-get -y install gnome gnome-shell
apt-get -y install inkscape gimp libreoffice
apt-get -y install nmap
apt-get -y install keepassx 
apt-get -y install vim
apt-get -y install icedove
#apt-get -y install gnome-commander
apt-get -y install iceweasel
apt-get -y install libreoffice-help-de libreoffice-l10n-de 
#apt-get -y install mc 
#apt-get -y install xsane 
apt-get -y install md5deep
apt-get -y install rsync 
apt-get -y install redshift
apt-get -y install extundelete
apt-get -y install gconf-editor
apt-get -y install gparted
apt-get -y install chromium
apt-get -y install rdfind
apt-get -y install kdenlive
apt-get -y install snmp
apt-get -y install virtualbox
apt-get -y install kazam 
apt-get -y install jigdo-file
apt-get -y install qrencode 
apt-get -y install posterazor 
apt-get -y install audacity 
apt-get -y install build-essential
apt-get -y install pkg-config 
apt-get -y install libdbus-1-dev
apt-get -y install apt-xapian-index
apt-get -y install apt-file
apt-file update
apt-get -y install figlet
apt-get -y install gconf-editor
apt-get -y install git
apt-get -y install nmon
apt-get -y install tcpdump
apt-get -y install iptraf
apt-get -y install mumble
apt-get -y install font-manager 
apt-get -y install quassel 
apt-get -y install libreoffice-l10n-de
apt-get -y install pidgin
apt-get -y install cups-pdf

apt-get -y install arduro alsa-gnome alsa-base bluez
apt-get -y install xmms
apt-get -y install mixxx
apt-get -y install wine
apt-get -y install epiphany-browser

#trisquel linux
#apt-get -y install sudo gdm3 gnome gnome-shell inkscape gimp libreoffice nmap keepassx vim icedove gnome-commander  libreoffice-help-de libreoffice-l10n-de clive mc pam-usb* xsane md5deep rsync redshift extundelete gconf-editor tripwire gparted chromium rdfind kdenlive snmp virtualbox kazam stopmotion jigdo-file qrencode posterazor audacity build-essential pkg-config  libdbus-1-dev apt-xapian-index apt-file figlet gconf-editor git nmon tcpdump iptraf mumble font-manager quassel smuxi

#apt-file ist um einzelne dateien in den apt-repositories zu suchen, gut z.B. wenn man beim schreiben von code libraries oder headerdateien (.h) sucht
sudo apt-file update


#sudo vim /etc/iwatch/iwatch.xml
#vim /etc/default/iwatch
#sudo /etc/init.d/iwatch restart

echo
echo
echo -e "\e[91mMultif-Factor Authentication\e[39m installieren \e[33mdafür bitte einen leeren memorystick eintecken\e[39m und z.B. 4 partitionen erstellen?"
echo -e "Install \e[91mMulti-Factor authentication\e[39m \e[33mdafür bitte einen leeren memorystick eintecken\e[39m und z.B. 4 partitionen erstellen"

printf "install pamusb (y/n)"

read answer
if echo "$answer" | grep -iq "^y" ;then

xgd-open https://en.wikipedia.org/wiki/Multi-factor_authentication &
xgd-open https://de.wikipedia.org/wiki/Zwei-Faktor-Authentifizierung &

gparted
/usr/bin/pamusb-conf --add-device seven
/usr/bin/pamusb-conf --add-user $(id -u 1000 -n)

else
    echo kein Multi-Factor Authentication installieren
    echo not installing Multi-Factor Authentication
fi


echo -e "Im \e[91m /etc/pam.d/common-auth\e[39m sollte man nun das \e[91msufficient\e[39m mit \e[91requisite\e[49m austauschen\e[39m bei der Zeile \e[91m pam_usb.so\e[39m, somit braucht es stick && passwort um einzuloggen, handbuch \e[34mman pam.d\e[39m"
echo -e "In \e[91m /etc/pam.d/common-auth\e[39m you should change the \e[91msufficient\e[39m with \e[91requisite\e[49m in the row \e[91m pam_usb.so\e[39m so that it requires bothm, not either or. Manual: \e[34mman pam.d\e[39m"
man pam.d |grep " requisite$" -a7

echo
echo
echo -e "bitte [enter] drücken, allenfalls im Editor \e[34m:syntax on\e[39m [enter] drücken, das schaltet das Syntax Highlighting ein"

printf "hit [enter]"

read answer

vim /etc/pam.d/common-auth

echo -e "Dann macht es allenfalls Sinn den root Account zu deaktivieren nach dem man den Benutzer $(id -u 1000 -n) im sudoers eingetragen hat, damit man noch einen Adminkonto hat"
echo -e "Possibily its wise to disable the root Account, after the user $(id -u 1000 -n) was added to the /etc/sudoers, that there is at least one Admin Account"
vim "+:syntax on" /etc/sudoers
vim "+:syntax on" /etc/passwd

#scroobar nicht ubuntu style
#gsettings set com.canonical.desktop.interface scrollbar-mode normal
#gsettings set org.gnome.nautilus.preferences always-use-location-entry true 
#./linux-brprinter-installer-2.0.0-1

echo -e "tripwire: Erstellt Signaturen für alle wichtige Dateien, falls jemand Viren lädt, würde das dann da auffallen, komplette Auswertung ist aber Aufwendig"
echo -e "tripwire: Creates Signatures for all important Files, in case someone installs a Virus or Trojan, complete Evaluation would give a lot to do"

printf "install tripwire?"

read answer
if echo "$answer" | grep -iq "^y" ;then
apt-get -f install tripwire
tripwire -m i
tripwire -m u
else
  echo Erstelle kene Tripwire Signaturen
  echo Not creating Tripwire Signatures
fi


echo -e "Benutzer \e[92mguest\e[39m erstellen mit zweitem mini MemoryStick, den man auch stecken lassen kann und keine Admin-rechte hat (y/n)?"
echo -e "Create a \e[92mguest \e[39m user with a mini second MemoryStick, that you can leave the usb port, without Admin-Premissions (y/n)?"
printf "press [enter]"
read answer
if echo "$answer" | grep -iq "^y" ;then

xdg-open https://www.google.ch/search?q=mini+usb+stickts
adduser --quiet guest --disabled-password --gecos "guest"
echo guest | passwd geust --stdin

gparted
/usr/bin/pamusb-conf --add-device six
/usr/bin/pamusb-conf --add-user guest

else
    echo Erstelle keinen Gast bentuzer
    echo Not Creating guest user
fi

echo
echo
echo -e "In gnome nautilus die Pfadleiste aktivieren"
echo -e "Enable Path bar in gnome nautilus"
gsettings set org.gnome.nautilus.preferences always-use-location-entry true

echo -e "generell Bunt einschalten im vim"
echo "syntax on" >>$HOME/.vimrc

echo
echo
echo -e "\e[91mSchriften\e[39m installieren? (y/n)?"
echo -e "Install \e[91mfonts\e[39m? (y/n)?"

printf "install fonts (y/n)"

read answer
#if echo "$answer" | grep -iq "^y" ;then
#  cd $fontSourceDir
#  for i in $(ls *.ttf); do gnome-open $i; done;
#else
#    echo "not installing fonts"
#fi
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

#sudo apt-get -y install youtube-dl
apt-get install -y python-pip
pip install youtube-dl

sudo apt-get -y install torbrowser-launcher

#xdg-open $fontSourceDir


