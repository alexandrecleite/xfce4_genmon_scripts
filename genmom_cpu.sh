#!/usr/bin/env bash
# by Alexandre Cerqueira Leite
# Depende do Top, Grep e Awk
# Use 3.00 seg de update 

readonly LSCPU=$(lscpu | grep -e "modelo" | column -t)
readonly LSCPU2=$(lscpu | grep -e "CPU MHz" -e "CPU(s):" | column -t -R 2-6)
readonly USO=$(top -bn1 | grep "CPU(s)" | awk '{print 100 - $8"%"}')
readonly USO2=$(top -bn1 | grep "CPU(s)")
readonly UPT=$(uptime | cut -d" " -f3-)
readonly PROCS=$(ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | grep -vw "ps"| head | column -t -H6,7)


# Panel
INFO+="<txt>"
INFO+="<span weight='Bold' fgcolor='#FFFFFF'>CPU: </span>"
INFO+="<span fgcolor='#FFFFFF'>${USO}</span>"
INFO+="</txt><txtclick>xfce4-taskmanager</txtclick>"

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="CPU:  ${USO}  ${UPT}\n\n"
MORE_INFO+="${LSCPU}\n"
MORE_INFO+="${LSCPU2}\n\n"
MORE_INFO+="${USO2}\n\n"
MORE_INFO+="<span font='Monospace 9'>${PROCS}</span>"
MORE_INFO+="</tool>"



# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"

