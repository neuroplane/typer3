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

echo "TYPE IN NUMBER OF ENTRIES"
read entries_to_do
clear
while [[ $entries_to_do -ne 0 ]]; do
  type_selection
done
#### VIDEO SELECT ####
vfolder="/media/$USER/RASPBERRY/Videos/"
options=($(ls $vfolder))
folders=$(ls $vfolder | wc -l)
x=0
while [ $x -lt $folders ]
        do
                echo -e "\033[33m$x\033[0m. ${options[$x]}"
                ((x++))
        done
read selector
vfile=$(ls "$vfolder${options[$selector]}" | shuf -n 1)
clear
echo -e "NOW PLAYING: \033[33m$vfile\033[0m"
sleep 3
#cvlc --play-and-exit --fullscreen --no-keyboard-events "$vfolder${options[$selector]}/$vfile"
echo "NOW IT'S TIME TO WATCH SOME CARTOONS"
