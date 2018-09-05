#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)
web_money=$(ssh lumet@ssh.lumet.nichost.ru cat /home/lumet/typer/sal.m)
web_wc=$(ssh lumet@ssh.lumet.nichost.ru cat /home/lumet/typer/wc.m)
local_money=$(cat ./config/local_sal.m)
local_wc=$(cat ./config/local_wc.m)

[ $(date +%w) -eq 6 ] && echo "do something on Saturdays" || echo "do different things on other days"

#if [[]]

echo "$web_money, $web_wc, $local_money, $local_wc"
ssh lumet@ssh.lumet.nichost.ru 'echo 120 > /home/lumet/typer/wc.m'

echo "У ТЕБЯ ${bold}$web_money${normal} РУБЛЕЙ НА СЧЕТЕ"
echo "И ${bold}$web_wc${normal} ПОПЫТОК"
