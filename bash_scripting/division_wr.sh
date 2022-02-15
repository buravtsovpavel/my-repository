#!/bin/bash
counter=1
while [ $counter -le 100 ]
do  if [ $((counter%3)) -eq 0 ]; then
      echo -n " $counter"
    else if [ $counter -eq 100 ]
	        then echo -e
		 fi
	fi
    counter=$(( $counter+1 )); 
done