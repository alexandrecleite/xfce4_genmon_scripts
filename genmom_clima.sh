#!/usr/bin/env bash
# by Alexandre Cerqueira Leite
# Depende do pacote Curl
# Use 1800.00 seg de update 

readonly CLIMA=$(curl wttr.in/?format=1)
readonly CLIMATIP=$(curl wttr.in/?0T)

# Panel
INFO+="<txt>"
INFO+="<span weight='Bold' fgcolor='#FFFFFF'>Clima: </span>"
INFO+="<span fgcolor='#FFFFFF'>${CLIMA}</span>"
INFO+="</txt>"

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="Clima:\n"
MORE_INFO+="${CLIMATIP}"
MORE_INFO+="</tool>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"
