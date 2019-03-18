#!/bin/bash
clear
correct=$(head -n1 ~/study/config/countdown.txt)
handicap=50
sleep 1
clear
echo "Осталось слов: $(($handicap - $correct))"
while [ $correct -lt $handicap ]
        do
                correct=$(head -n1 ~/study/config/countdown.txt)
                word=$(shuf -n 1 ~/study/config/words.txt)
		echo -e "Повтори:\n"
		echo -e "\e[30;42m$word\e[0m"
		read input
                if [ "$input" = "$word" ]; then
                        clear
                        update=$(($handicap - $correct -1))
                        echo "Осталось слов: $update"
                        echo $(($correct + 1)) > ~/study/config/countdown.txt
                else
                        clear
                        echo "Осталось слов: $(($handicap - $correct))"
                fi
        done
clear
echo 0 > ~/study/config/countdown.txt
echo "ТЫ ВЫИГРАЛ ПРИЗ"
