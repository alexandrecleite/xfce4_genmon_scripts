#!/usr/bin/env bash
# by Alexandre Cerqueira Leite
# Depende do Top, Grep e Awk
# Use 3.00 seg de update 

readonly LSCPU=$(lscpu | grep -e "modelo" -e "CPU MHz")
readonly USO=$(top -bn1 | grep "CPU(s)" | awk '{print 100 - $8"%"}')

# Panel
INFO+="<txt>"
INFO+="<span weight='Bold' fgcolor='#FFFFFF'>CPU: </span>"
INFO+="<span fgcolor='#FFFFFF'>${USO}</span>"
INFO+="</txt><txtclick>xfce4-taskmanager</txtclick>"

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="CPUs:\n"
MORE_INFO+="${LSCPU}"
MORE_INFO+="</tool>"



# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"

