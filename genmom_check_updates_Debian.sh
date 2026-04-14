#!/usr/bin/env bash
# by Alexandre Cerqueira Leite
# Depende do gerenciador de pacotes apt e do grep
# Use 3600.00 seg de update 

#Pegando IPs
readonly TOTAL=$(apt-get -s upgrade | grep -P '^\d+' | cut -d " " -f1)
readonly UPGLIST=$(apt-get -s upgrade | grep -P '^\d+' )

# Panel
INFO+="<txt>"
INFO+="<span weight='Bold' fgcolor='#FFFFFF'>Upd: </span>"
INFO+="<span fgcolor='#FFFFFF'>${TOTAL}</span>"
INFO+="</txt>"

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="Atualizações:\n\n${UPGLIST}"
MORE_INFO+="</tool>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"



