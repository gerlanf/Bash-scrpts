#!/bin/bash

if [ "$1" = "" ]
then
        echo -e "\e[32m===================================================\e[0m"
        echo -e "\e[32m=== Programa para varredura de portas           ===\e[0m"
        echo -e "\e[32m=== Uso: $0 192.168.0.1,192.168.0.2 80,443      ===\e[0m" 
        echo -e "\e[32m===================================================\e[0m"

else

IFS=',' read -ra IPS <<< "$1"
for i in "${IPS[@]}"; do

  IFS=',' read -ra PORTAS <<< "$2"
  for x in "${PORTAS[@]}"; do
   #echo $x

   sudo hping3 -c 1 -S -p $x $i 2>/dev/null |grep "flags=SA" | cut -d " " -f 2,6 #| cut -d "=" -f 2
  done
done
