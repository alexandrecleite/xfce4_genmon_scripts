#!/usr/bin/env bash
# by Alexandre Cerqueira Leite based on xfce4-genmon-panel-scripts by levimake
# Dependencies: bash>=3.2, coreutils, file, gawk
# Use 3.00 seg de update 

# Calculate RAM values
readonly TOTAL=$(free -b | awk '/^[Mm]em/{$2 = $2 / 1073741824; printf "%.2f", $2}')
readonly USED=$(free -b | awk '/^[Mm]em/{$3 = $3 / 1073741824; printf "%.2f", $3}')
readonly FREE=$(free -b | awk '/^[Mm]em/{$4 = $4 / 1073741824; printf "%.2f", $4}')
readonly SHARED=$(free -b | awk '/^[Mm]em/{$5 = $5 / 1073741824; printf "%.2f", $5}')
readonly CACHED=$(free -b | awk '/^[Mm]em/{$6 = $6 / 1073741824; printf "%.2f", $6}')
readonly AVAILABLE=$(free -b | awk '/^[Mm]em/{$7 = $7 / 1073741824; printf "%.2f", $7}')

# Swap Values
readonly SWP_TOTAL=$(free -b | awk '/^[Ss]wap/{$2 = $2 / 1073741824; printf "%.2f", $2}')
readonly SWP_USED=$(free -b | awk '/^[Ss]wap/{$3 = $3 / 1073741824; printf "%.2f", $3}')
readonly SWP_FREE=$(free -b | awk '/^[Ss]wap/{$4 = $4 / 1073741824; printf "%.2f", $4}')

# Panel
INFO+="<txt>"
INFO+="<span weight='Bold' fgcolor='#FFFFFF'>Mem: </span>"
INFO+="<span fgcolor='#FFFFFF'>${USED}</span>"
# INFO+="／"
# INFO+="${TOTAL} GB"
INFO+="<span fgcolor='#FFFFFF'>G</span>"
INFO+="</txt><txtclick>xfce4-taskmanager</txtclick>"

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="┌ RAM\n"
MORE_INFO+="├─ Usada\t\t\t${USED} GB\n"
MORE_INFO+="├─ Livre\t\t\t${FREE} GB\n"
MORE_INFO+="├─ Compartilhada\t${SHARED} GB\n"
MORE_INFO+="├─ Cache\t\t\t${CACHED} GB\n"
MORE_INFO+="├─ Disponivel\t\t${AVAILABLE} GB\n"
MORE_INFO+="└─ Total\t\t\t${TOTAL} GB"
MORE_INFO+="\n\n"
MORE_INFO+="┌ SWAP\n"
MORE_INFO+="├─ Usada\t\t${SWP_USED} GB\n"
MORE_INFO+="├─ Livre\t\t${SWP_FREE} GB\n"
MORE_INFO+="└─ Total\t\t${SWP_TOTAL} GB"
MORE_INFO+="</tool>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"
