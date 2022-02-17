#!/bin/bash 

# arping хоста  arping -c 3 -i интерфейс префикс.подсеть.хост
# Доступны для ввода: Префикс сети, подсеть, хост и интерфейс
# Валидация по количеству параметров, права пользователя, формат префикса, подсети, хоста и интерфейса.

PREFIX=$1
SUBNET=$2
HOST=$3
INTERFACE=$4

if [ "$(id -u)" != "0" ]; then 
        echo "Вы не имеете прав пользователя root"; exit 0
        exit 1

else 
    trap 'echo "Ping exit (Ctrl-C)"; exit 1' 2

#    apt-get update && sudo apt-get upgrade -y
#    apt-get install arping

    if [ "$#" -ne 4 ]; then echo "Передано не верное число параметров!"; exit 1
   
        else if [[ $PREFIX =~ ^(([1-9]?[0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.)([1-9]?[0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])$ ]]
   	  
               then if [[ $SUBNET =~ ^([1-9]?[0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])$ ]]
	  
   	                then if [[ $HOST =~ ^([1-9]?[0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])$ ]]
		
       			            then if [[ $INTERFACE == "enp0s3" ]]
	
				                 then    echo "[*] IP : "$PREFIX"."$SUBNET"."$HOST
					                     arping -c 3 -i $INTERFACE $PREFIX"."$SUBNET"."$HOST 2> /dev/null

				                 else echo "Ошибка! Введён не корректный интерфейс!"; exit 1  
        			            fi
			                else echo "Ошибка! Введите хост в формате: 0-255"; exit 1
			            fi		

                 	else echo "Ошибка! Введите подсеть в формате: 0-255"; exit 1 
		            fi
     	        else echo "Ошибка! Введите префикс в формате: 0-255.0-255"; exit 1
	        fi	
	fi     
fi
