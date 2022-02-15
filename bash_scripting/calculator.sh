#!/bin/bash
us='yes'
while [[ $us = "yes" ]]
do
        echo "Simple Calculator"
        echo "Enter the first number:"
        z='^[0-9]+$'
        read x
        if ! [[ $x =~ $z ]] ; then
           echo "error: Not a number" >&2; exit 1
        fi
        echo "Enter the second number:"
        read y
        if ! [[ $y =~ $z ]] ; then
           echo "error: Not a number" >&2; exit 1       
        fi
        select math in Addition Subtraction Multiplication Division 
                do 
                case "$math" in
                Addition)
                        result=$(( $x + $y ))
                        echo Result: $result
                        break
                ;;
                Subtraction)
                        result=$(( $x - $y )) 
                        echo Result: $result
                        break
                ;;
                Multiplication)
                        result=$(( $x * $y ))
                        echo Result: $result
                        break
                ;;
                Division)
                        if [ $y -eq 0 ]; then
                               echo "Error: division by zero";
                        else 
                              result=$(expr "scale=10; $x/$y" | bc)
                        echo Result: = $result
                        fi;
                        break
                ;;
                *)
                        echo Choose 1 to 4 only!!!!
                        break
                ;;
                esac
done
echo "Continue?(yes/no):"
read us
done