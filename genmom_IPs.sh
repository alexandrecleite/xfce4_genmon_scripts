#!/usr/bin/env bash
# by Alexandre Cerqueira Leite
# Depende do Curl, Grep e Cut
# Use 600.00 seg de update 

#Pegando IPs
readonly IFACE=$(ip -4 a | grep -E "^[0-9]" | grep -e "LOWER_UP" | grep -v "lo" | cut -d" " -f2 | sed 's/://')
readonly INT=$(hostname -I | cut -d" " -f1)
readonly INT6=$(ip a | grep "inet6 fe80" | cut -d" " -f6)
readonly EXT=$(curl -s -4 ifconfig.me)
readonly EXT6=$(curl -s ifconfig.me)

# Panel
INFO+="<txt>"
INFO+="<span weight='Bold' fgcolor='#FFFFFF'>Rede: </span>"
INFO+="<span fgcolor='#FFFFFF'>${INT}</span>"
INFO+="</txt><txtclick>gufw</txtclick>"

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="Interface: ${IFACE}\n\n"
MORE_INFO+="IP Local: ${INT}\n"
MORE_INFO+="IPv6 Local: ${INT6}\n\n"
MORE_INFO+="IP Externo: ${EXT}\n"
MORE_INFO+="IPv6 Externo: ${EXT6}"

MORE_INFO+="</tool>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"



