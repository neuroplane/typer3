#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)
try=$(ssh lumet@ssh.lumet.nichost.ru 'head -n2 /home/lumet/salary.m | tail -n1')
echo $try
#while [ $y -lt $z ] 
#	do
#		x=$(ssh lumet@ssh.lumet.nichost.ru 'cat /home/lumet/salary.m')
#		echo $x
#		x=$(($x + 5))
#		ssh lumet@ssh.lumet.nichost.ru "echo $x > /home/lumet/salary.m"
#		y=$(($y + 1))
#done
#echo "У ТЕБЯ ${bold}$x${normal} РУБЛЕЙ НА СЧЕТЕ"
ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo ok || echo error