#!/bin/bash

#if [ "$1" = "" ] 
#then
        echo -e "\e[32m===================================================\e[0m"
        echo -e "\e[32m=== Programa para varredura de portas           ===\e[0m"
        echo -e "\e[32m=== Uso: $0 ips.txt portas.txt                  ===\e[0m" 
        echo -e "\e[32m===================================================\e[0m"

#else
        for ip in $(cat ips.txt);
        do
                echo $ip;
        done;
        for porta in $(cat portas.txt);
        do
                echo $porta;
        done

#fi
#       arrayip=($1)
#       #arrayport="$2"
#       for i in "${arrayip[*]}";
#       do
#               echo $i;
#       done
#fi

#sudo hping3 -c 1 -S -p 80 192.168.50.126 2>/dev/null |grep "flags=SA" | cut -d " " -f 2 | cut -d "=" -f 2
