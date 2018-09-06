
#!/bin/bash
folder="/media/$USER/"
options=($(ls $folder))
folderlist=$(ls $folder | wc -l)
x=0
while [ $x -lt $folderlist ]
        do
                echo -e "$x. ${options[$x]}"
                x=$(( $x + 1 ))
        done
echo "Choose USB drive containing 'Video' folder"
read selector
echo ${options[$selector]} > ./config/videofolder.conf
[ ! -d "$folder${options[$selector]}/Videos" ] && echo "NO VIDEO FOLDER $folder${options[$selector]}/Videos" || echo "VIDEO FOLDER EXISTS";echo ${options[$selector]} > ./config/videofolder.conf; cat ./confi$
