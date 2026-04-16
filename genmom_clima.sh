#!/usr/bin/env bash
# by Alexandre Cerqueira Leite
# Depende do pacote Curl
# Use 1800.00 seg de update 

readonly CLIMA=$(curl -s wttr.in/?format="+%t+%c")
readonly CLIMATIP=$(curl -s -H "Accept-Language: pt-br" wttr.in?format="+%l\n\n+%C+%c\n+Temp:%20%t\n+S.Termica:%20%f\n+Vento:%20%w\n+Chuva:%20%p\n+Umidade:%20%h\n+Indice%20UV:%20%u\n+Pressao:%20%P\\n")

# Panel
INFO+="<txt>"
INFO+="<span weight='Bold' fgcolor='#FFFFFF'>Clima:</span>"
INFO+="<span fgcolor='#FFFFFF'>${CLIMA}</span>"
INFO+="</txt>"

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="Clima: "
MORE_INFO+="${CLIMATIP}"
MORE_INFO+="</tool>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"
