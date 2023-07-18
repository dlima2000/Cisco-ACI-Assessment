#!/bin/bash
#file: apic-collect.sh
#
# Parameters: CSV file with APIC objects to collect
# Usage: ./apic-collect.sh apic.csv
#
input=$1  # CSV file
declare -i count=0
timestamp=`date +%Y%m%d_%H%M%S`
[ ! -f $input ] && { echo "$input file not found"; exit 99; }
while IFS=, read -r attr description
do
    ((count++))
    printf "Collecting $count - $attr - $description\n"
    moquery -c $attr        > /tmp/collect-apic-$HOSTNAME-$timestamp-p$count-$attr.txt
    moquery -c $attr -o xml > /tmp/collect-apic-$HOSTNAME-$timestamp-p$count-$attr.xml
    moquery -c $attr -x 'rsp-subtree=children' -o xml > /tmp/collect-apic-$HOSTNAME-$timestamp-p$count-$attr-children.xml
done < $input
printf "\n\nFinished!!!\n"
printf "\n\nPlease, take note the TIMESTAMP: $HOSTNAME-$timestamp"
#EOF: apic-collect.sh
