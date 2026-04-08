#!/usr/bin/env bash
# by Alexandre Cerqueira Leite
# Depende do Awk, Grep e Cut
# Use 5.00 seg de update 

readonly USOHD=$(df -m /home | awk 'NR==2 {printf "%.2f GB", $4/1024}')
readonly DFH=$(df -h | grep -e "Uso%" -e "home" | cut -d" " -f8-16 | column -t)

# Panel
INFO+="<txt>"
INFO+="<span weight='Bold' fgcolor='#FFFFFF'>HD: </span>"
INFO+="<span fgcolor='#FFFFFF'>${USOHD}</span>"
INFO+="</txt><txtclick>thunar</txtclick>"

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="DISCO:\n"
MORE_INFO+="${DFH}"
MORE_INFO+="</tool>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"
