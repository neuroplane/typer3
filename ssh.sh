#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)
web_money=$(ssh lumet@ssh.lumet.nichost.ru cat /home/lumet/typer/sal.m)
web_wc=$(ssh lumet@ssh.lumet.nichost.ru cat /home/lumet/typer/wc.m)
local_money=$(cat ./config/local_sal.m)
local_wc=$(cat ./config/local_wc.m)
date_local_wc=$(date -r ./config/local_wc.m +%s)
date_web_wc=$(ssh lumet@ssh.lumet.nichost.ru 'date -r /home/lumet/typer/wc.m +%s')
datediff=$(($date_local_wc - $date_web_wc))
echo "=$date_local_wc , $date_web_wc, $datediff"

[ $web_money = $local_money ] && echo "MONEY EQUAL" || echo "MONEY NOT EQUAL"
[ $web_wc = $local_wc ] && echo "ENTRIES EQUAL" || echo "ENTRIES NOT EQUAL"

#if [[]]

echo "$web_money, $web_wc, $local_money, $local_wc"
#ssh lumet@ssh.lumet.nichost.ru 'echo 120 > /home/lumet/typer/wc.m'

echo "У ТЕБЯ ${bold}$web_money${normal} РУБЛЕЙ НА СЧЕТЕ"
echo "И ${bold}$web_wc${normal} ПОПЫТОК"
