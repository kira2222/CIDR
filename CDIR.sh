#!/bin/bash

# Author: kira2222

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


trap ctrl_c INT


function ctrl_c(){
      	echo -e "\n${yellowColour}[*]${endColour}${grayColour}Saliendo${endColour}"

        tput cnorm;

        exit 1


}




function get_info() {
    tput civis

    result=$(curl -s "https://jodies.de/ipcalc?host=$1&mask1=$2&mask2=" | \
        sed -n '116,117p' | \
        awk '{ gsub(/<[^>]*>/, ""); print; }' | \
        grep -E "Address|Network" | xargs | \
        awk '{ print $1,$2,$4,$5,$6,$7,$9,$10,$11,$13,$14,$17,$18,$19,$21,$22,$24,$25,$27,$28 }' | \
        sed 's/.00000001//g; s/.00000000//g; s/.11111111//g; s/.11111110//g; s/.00001101//g; s/.10000111//g')

    echo -e "\nInformación de Red:\n"
    
    for string in $result; do
      echo -e "${blueColour}[+]${endColour}${redColour}$string${endColour}"
    done

    tput cnorm
}




if [ -n "$1" ] && [ -n "$2" ]; then
    
    
   get_info $1 $2
  

else 

  echo -e "\n[+] Uso :$0 <ip> <CIDR>"

fi


