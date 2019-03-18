#!/bin/bash
clear
type_selection(){
  type=$((RANDOM % 2))
    if   [[ $type = 0 ]]; then
      sum
    elif [[ $type = 1 ]]; then
      sum3
    elif [[ $type = 2 ]]; then
      substraction
    elif [[ $type = 3 ]]; then
      multiplication
    else
      division
    fi
}
success(){
  clear
  ((entries_to_do--))
  echo -e "CORRECT! ENTRIES LEFT:$entries_to_do\n"
}
failure(){
  clear
  ((entries_to_do++))
  echo -e "INCORRECT! ENTRIES LEFT: $entries_to_do\n"
}
###########################################
sum(){
      digit1=$(($RANDOM % 10 + 4))
      digit2=$(($RANDOM % 10 + 4))
      digit3=$(($digit1 + $digit2))
      echo -e "COMPUTE: $digit1 + $digit2"
      read vari
      if [ "$vari" = "$digit3" ]; then
        success
      else
        failure
      fi
}
###########################################
sum3(){
      digit0=$(($RANDOM % 5))
      digit1=$(($RANDOM % 5))
      digit2=$(($RANDOM % 5))
      digit3=$(($digit0 + $digit1 + $digit2))
      echo -e "COMPUTE: $digit0 + $digit1 + $digit2"
      read vari
      if [ "$vari" = "$digit3" ]; then
        success
      else
        failure
      fi
}
###########################################
substraction(){
      digit1=$(($RANDOM % 9 +1))
      digit2=$(($RANDOM % $digit1 + 1))
      digit3=$(($digit1 - $digit2))
      echo -e "COMPUTE: $digit1 - $digit2"
      read vari
      if [ "$vari" = "$digit3" ]; then
        success
      else
        failure
      fi
}
###########################################
multiplication(){
      digit1=$(($RANDOM % 10))
      digit2=$(($RANDOM % 2))
      digit3=$(($digit1 * $digit2))
      echo -e "COMPUTE: $digit1 * $digit2"
      read vari
      if [ "$vari" = "$digit3" ]; then
        success
      else
        failure
      fi
}
###########################################
division(){
      digit0=$(($RANDOM % 10))
      digit1=$(($RANDOM % 1 + 1))
      digit2=$(($digit0 * $digit1))
      digit3=$(($digit2 / $digit1))
      echo -e "COMPUTE: $digit2 / $digit1"
      read vari
      if [ "$vari" = "$digit3" ]; then
        success
      else
        failure
      fi
}
#### MAIN CODE ######
clear
#### VIDEO FOLDER SELECT ####
vfolder="/media/$USER/RASPBERRY/Videos/"
options=($(ls $vfolder))
folders=$(ls $vfolder | wc -l)
x=0
while [ $x -lt $folders ]
        do
                echo -e "$x. ${options[$x]}"
                ((x++))
        done
read selector
clear
#### VIDEO FILE SELECT ####
files_folder="$vfolder${options[$selector]}"
files_list=($(ls -1 $files_folder))
files_amount=$(ls -1 $files_folder | wc -l)
i=0
while [ $i -lt $files_amount ]
        do
                echo -e "$i. ${files_list[$i]}"
                ((i++))
        done

#echo -e "NOW PLAYING: \033[33m$vfile\033[0m"
sleep 1
read file_select
clear
file_to_play="$vfolder${options[$selector]}/${files_list[$file_select]}"
#echo $file_to_play
duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$file_to_play")
dur_min=$(( ${duration%.*} / 60 ))

if [[ $dur_min -lt 10 ]]; then
	k=15
	else
	k=40
fi

entries_to_do=$(( ${duration%.*} / $k ))
echo "Видеофайл идёт $dur_min минут."
echo "Для просмотра нужно решить $entries_to_do примеров"
read final
#### MAIN CODE START ####
while [[ $entries_to_do -ne 0 ]]; do
  type_selection
done
echo "Смотрим файл ${files_list[$file_select]}"
sleep 3
cvlc --play-and-exit --fullscreen --no-keyboard-events "$vfolder${options[$selector]}/$vfile"
./selector.sh
