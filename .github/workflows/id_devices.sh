#!/bin/bash

list=( $(xcrun xctrace list devices | awk "NF" | awk "/== Devices ==/{f=1;next} /== Simulators ==/{f=0} f" | awk '{print substr($NF, 2, length($NF) - 2)}') )
str='-destination "id='
result=''
if [ "$(uname -m)" = "arm64" ]; then i=1; else i=0; fi
for ((i;i<${#list[@]};i++));
do
    result+=$str;
    result+=${list[$i]};
    result+='" ';
done
echo $result