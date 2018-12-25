#!/bin/bash
clear
type_selection(){
  type=$((RANDOM % 5))
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
while [[ $entries_to_do -ne 0 ]]; do
  type_selection
done
echo "NOW IT'S TIME TO WATCH SOME CARTOONS"
