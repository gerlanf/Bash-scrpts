#!/bin/bash

if [ "$1" = "" ]
then
	echo -e "\e[32m=====================================================================\e[0m"
        echo -e "\e[32m=== Programa para varredura de portas                             ===\e[0m"
        echo -e "\e[32m=== Uso: $0 192.168.0.1,192.168.0.2 80,443                        ===\e[0m" 
        echo -e "\e[32m=== Uso: $0 -f ips.txt portas.txt                                 ===\e[0m" 
        echo -e "\e[32m=== Uso: $0 -rede 192.168.0.0/24 portas.txt                       ===\e[0m" 
        echo -e "\e[32m=====================================================================\e[0m"

elif [ "$1" == "-f" ]
then
        for ip in $(cat ips.txt);
        do
                #echo $ip;
		echo -e "\e[31m== iniciando IP: $ip ==\e[0m";
        	for porta in $(cat portas.txt);
        	do
                	#echo $porta;
			hping3 -c 1 -S -p $porta $ip 2>/dev/null |grep "flags=SA" #| cut -d " " -f 2,6 #| cut -d "=" -f 2

        	done;
        done;
elif [ "$1" == "-rede" ]
then
      for ip in {1..254};
        do
                echo -e "\e[31m== iniciando IP: $2.$ip ==\e[0m";
        	echo "$2.$ip"
        	for porta in $(cat portas.txt);
        	do
                	echo $porta;
			hping3 -c 1 -S -p $porta $2.$ip 2>/dev/null |grep "flags=SA" #| cut -d " " -f 2,6 #| cut -d "=" -f 2

        	done;
	done;

else


IFS=',' read -ra IPS <<< "$1"
for i in "${IPS[@]}"; do

  IFS=',' read -ra PORTAS <<< "$2"
  for x in "${PORTAS[@]}"; do
   #echo $x

   hping3 -c 1 -S -p $x $i 2>/dev/null |grep "flags=SA" #| cut -d " " -f 2,6 #| cut -d "=" -f 2
  done
done
fi
