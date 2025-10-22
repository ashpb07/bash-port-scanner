#! /bin/bash

response=$(zenity --forms \
  --title="Port Scanner Input" \
  --text="Enter details to scan" \
  --add-entry="Hostname or IP" \
  --add-entry="enter the url/ip address" \
   --add-entry="Start Port" \
  --add-entry="End Port")
if [ $? -ne 0 ]; then
    echo "Cancelled"
    exit 1
fi

IFS="|" read userchoice input_addr  start end <<< "$response"


echo "Start port: $start"
echo "End port: $end"
if [ "$userchoice" == "hostname" ];then
   
   name=$(host $input_addr | grep -oP "\d+.\d+\.\d+\.\d+")
     for c in $(seq $start $end);
      do 
         if nc -znv -w 1 $name $c 2>&1 | grep -v "timed out" ; then
         echo "open port : $c";
         zenity --info  --text "open port : $c"

         fi 
      done  
else
  
     for c in $(seq $start $end);
      do 
         if nc -znv -w 1 $input_addr $c 2>&1 | grep -v "timed out" ; then
         echo "open port : $c";
         zenity --info "open ports: " --text "open port : $c"
         fi 
      done 
fi

         







