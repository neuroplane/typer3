#!/bin/bash
############################
##### DIRECTORY CHECK  #####
############################
#echo "LOADING"
getamount(){
	bold=$(tput bold)
	normal=$(tput sgr0)
	y=0
	z=10
	#ssh lumet@ssh.lumet.nichost.ru 'echo 155 > /home/lumet/salary.m'
	while [ $y -lt $z ] 
	        do
	                x=$(ssh lumet@ssh.lumet.nichost.ru 'cat /home/lumet/salary.m')
	                echo $x
	                x=$(($x + 5))
	                ssh lumet@ssh.lumet.nichost.ru "echo $x > /home/lumet/salary.m"
	                y=$(($y + 1))
	done
echo "У ТЕБЯ ${bold}$x${normal} РУБЛЕЙ НА СЧЕТЕ"
}
if [ ! -d ~/typer ]; then
	sudo mkdir ~/typer
	clear
	echo "CREATED SCRIPTS DIRECTORY"
	sleep 4
fi
if [ ! -f ~/typer/wc.t ]; then 
	sudo echo "10" > ~/typer/wc.t
	echo "CREATED WORDS COUNT FILE"
	sleep 4
fi
if [ ! -d /media/pi/RASPBERRYPI ]; then 
	echo -e "\033[41m\033[30mNO USB DRIVE MOUNTED!\nMOUNT DRIVE AND RELAUNCH SCRIPT!\033[0m"
	sleep 4
	exit
fi
############################
wc=$(head -n1 ~/typer/wc.t)
t=0
clear
echo -e "\033[42m\033[30mENTRIES LEFT: $wc\n\n\033[0m"

while [ $t -lt $wc ]
	do
		digit1=$(($RANDOM % 5 + 1))
		digit2=$(($RANDOM % 5 + 1))
		digit3=$(($digit1 + $digit2))
		echo -e "COMPUTE: \033[33m$digit1 + $digit2\033[0m"
		read vari
		if [ "$vari" = "$digit3" ]; then
			clear
			t=$(( $t + 1 ))
			y=$(( $wc - $t ))
			echo -e "\033[42m\033[30mCORRECT! ENTRIES LEFT:$y\nSECONDS PASSED: $SECONDS\n\033[0m"
		elif [ "$vari" = "reset" ]; then
			clear
			echo -e "\033[42m\033[30m  RESET! ENTRIES LEFT: $wc\n\n\033[0m"
			t=0
		else
			clear
			t=$(($t - 1))
			y=$(($wc - $t))
			echo -e "\033[41m\033[30mINCORRECT! ENTRIES LEFT: $y\nSECONDS PASSED: $SECONDS\n\033[0m"
		fi
	done
echo $(($wc + 1)) > ~/typer/wc.t
############################
addon(){
	addons=("sudo" "mkdir" "nano" "less" "rm" "echo" "touch" )
	a=0; b=1;
	addon_length=${#addons[@]}
	
	while [ $a -lt $b ]
	do
		clear
		c=$(($RANDOM % $addon_length))
		echo -e "ЭТОТ МУЛЬТИК СТОИТ ДОРОЖЕ!\nПОВТОРИ: \n\033[33m${addons[$c]}\033[0m"
		read addon_reply
		if [ "$addon_reply" = ${addons[$c]} ]; then
			a=$(( $a + 1 ))
		else
			addon
		fi
	done
}
###################
clear
echo -e "МОЛОДЕЦ! \nА ТЕПЕРЬ ВЫБЕРИ МУЛЬТФИЛЬМ\n"
vfolder="/media/pi/HOME128/Videos/"
options=($(ls $vfolder))
folders=$(ls $vfolder | wc -l)
x=0
while [ $x -lt $folders ]
	do
		echo -e "\033[33m$x\033[0m. ${options[$x]}"
		x=$(( $x + 1 ))
	done
############################

############################
read selector
if [[ ${options[$selector]} = *"+" ]]; then
	addon
fi
vfile=$(ls "$vfolder${options[$selector]}" | shuf -n 1)
clear
echo -e "NOW PLAYING: \033[33m$vfile\033[0m"
sleep 3
omxplayer "$vfolder${options[$selector]}/$vfile"
./typer.sh
