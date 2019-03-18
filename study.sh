#!/bin/bash
clear
type_selection(){
  type=$((RANDOM % 2)) #Change RANDOM ceiling to define maximum difficulty. For example $((RANDOM % 2)) includes
    if   [[ $type = 0 ]]; then
      sum #Basic sum X + Y
    elif [[ $type = 1 ]]; then
      sum3 #Advanced sum X + Y + Z
    elif [[ $type = 2 ]]; then
      words #Words input
    elif [[ $type = 3 ]]; then
      substraction #Basic substraction X - Y
    elif [[ $type = 4 ]]; then
      multiplication #Basic multiplication X * Y
    else
      division #Basic division X / Y
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
##Basic sum X + Y##########################################
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
#Advanced sum X + Y + Z##########################################
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
#Words input##########################################
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
#Basic substraction X - Y##########################################
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
#Basic multiplication X * Y##########################################
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
echo -e "\n"
while [[ $entries_to_do -ne 0 ]]; do
  type_selection
done
#### VIDEO SELECT ####
#Defining folder that contains videofiles. Default is "Videos" folder in USB drive named "RASPBERRY"
vfolder="/media/$USER/RASPBERRY/Videos/"
#Next one generates list of folders in folder "Videos"
options=($(ls $vfolder))
#Defining amount of folders for generation of the list for choosing exact file
folders=$(ls $vfolder | wc -l)
#Next cycle prints list of folders before selection
x=0
while [ $x -lt $folders ]
        do
                echo -e "$x. ${options[$x]}"
                ((x++))
        done
read selector
#Next we choose random file from the selected subfolder
vfile=$(ls "$vfolder${options[$selector]}" | shuf -n 1)
clear
echo -e "NOW PLAYING: $vfile"
sleep 0
cvlc --play-and-exit --fullscreen --no-keyboard-events "$vfolder${options[$selector]}/$vfile"

#Next script defines the number of tasks depending on the duration of the videofile
#dur_sec=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$vfolder${options[$selector]}/$vfile")
#dur_min=${dur_sec%.*}
#ls "$vfolder${options[$selector]}/" -lh
#echo $dur_sec
#echo $(($dur_min/60))

#echo "NOW IT'S TIME TO WATCH SOME CARTOONS"

### MANUAL SELECT ###
#manual_select(){
#f=0
#files=$(ls "$vfolder${options[$selector]}" | wc -l)
#while [ $f -lt $files ]
#        do
#                echo -e "$f. ${options[$f]}"
#                ((x++))
#        done
#read selector
#	}
