#!/usr/bin/env bash
# by Alexandre Cerqueira Leite
# Depende do pacote sensors-lm, grep e awk
# Use 2.00 seg de update 

#Pegando IPs
readonly TEMP=$(sensors | grep "Core" | awk '{sum+=$3; count++} END {if (count>0) printf "%.0f°C\n", sum/count; else print "N/A"}'
)
readonly TEMP_ALL=$(sensors)

# Panel
INFO+="<txt>"
INFO+="<span weight='Bold' fgcolor='#FFFFFF'>Temp: </span>"
INFO+="<span fgcolor='#FFFFFF'>${TEMP}</span>"
INFO+="</txt><txtclick>xfce4-sensors</txtclick>"

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="SENSORES:\n\n${TEMP_ALL}"
MORE_INFO+="</tool>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"



