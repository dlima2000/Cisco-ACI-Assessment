#!/bin/bash
#Copyright (c) Logicalis
#file: /tmp/leaf-collect-v4.sh
#
#This is script is used by collect many information from Leaf Switches

DATA=`date +"%Y-%m-%d"`
FILENAME="/data/techsupport/collect-LEAF-$HOSTNAME-$DATA-Part1-system.txt"

echo
echo "Collecting data from switch: $HOSTNAME"

echo "show hostname"    >  $FILENAME
show hostname           >> $FILENAME

echo                    >> $FILENAME
echo "show version"     >> $FILENAME
show version            >> $FILENAME

echo                    >> $FILENAME
echo "show hardware"    >> $FILENAME
show hardware           >> $FILENAME

echo                    >> $FILENAME
echo "uptime"           >> $FILENAME
uptime                  >> $FILENAME

echo                    >> $FILENAME
echo "date"             >> $FILENAME
date                    >> $FILENAME

echo                    >> $FILENAME
echo "date -u"          >> $FILENAME
date -u                 >> $FILENAME

echo                    >> $FILENAME
echo "show clock"       >> $FILENAME
show clock              >> $FILENAME

echo                    >> $FILENAME
echo "show ntp peers"   >> $FILENAME
show ntp peers          >> $FILENAME

echo                        >> $FILENAME
echo "show ntp peer-status" >> $FILENAME
show ntp peer-status        >> $FILENAME

echo                    >> $FILENAME
echo "acidiag avread"   >> $FILENAME
acidiag avread          >> $FILENAME

echo                    >> $FILENAME
echo "acidiag fnvread"  >> $FILENAME
acidiag fnvread         >> $FILENAME

echo                      >> $FILENAME
echo "acidiag fnvreadex"  >> $FILENAME
acidiag fnvreadex         >> $FILENAME

echo                      >> $FILENAME
echo "cat /etc/timezone"  >> $FILENAME
cat /etc/timezone         >> $FILENAME

echo                      >> $FILENAME
echo "cat /etc/timestamp" >> $FILENAME
cat /etc/timestamp        >> $FILENAME

echo                        >> $FILENAME
echo "cat /etc/resolv.conf" >> $FILENAME
cat /etc/resolv.conf        >> $FILENAME

echo                     >> $FILENAME
echo "ip addr"           >> $FILENAME
ip addr                  >> $FILENAME

echo                     >> $FILENAME
echo "ip addr show eth0" >> $FILENAME
ip addr show eth0        >> $FILENAME

echo                         >> $FILENAME
echo "show interface mgmt 0" >> $FILENAME
show interface mgmt 0        >> $FILENAME

echo                                  >> $FILENAME
echo "show ip interface vrf mgmt:inb" >> $FILENAME
show ip interface vrf mgmt:inb        >> $FILENAME

echo "moquery -c topSystem" >> $FILENAME
moquery -c topSystem        >> $FILENAME
echo                        >> $FILENAME

echo                    >> $FILENAME
echo "df -hT"           >> $FILENAME
df -hT                  >> $FILENAME 2>&1

echo                    >> $FILENAME
echo "show snmp"        >> $FILENAME
show snmp               >> $FILENAME

echo                     >> $FILENAME
echo "show snmp summary" >> $FILENAME
show snmp summary        >> $FILENAME

echo
echo "---- Part 1/8 Completed ----"
echo

####################################################

DATA=`date +"%Y-%m-%d"`
FILENAME="/data/techsupport/collect-LEAF-$HOSTNAME-$DATA-Part2-enviro.txt"

echo "show module"  >  $FILENAME
show module         >> $FILENAME
echo                >> $FILENAME

echo "show environment" >> $FILENAME
show environment        >> $FILENAME
echo                    >> $FILENAME

echo "show environment fan" >> $FILENAME
show environment fan        >> $FILENAME
echo

echo "show environment power" >> $FILENAME
show environment power        >> $FILENAME
echo                          >> $FILENAME

echo "show diagnostic result module all" >> $FILENAME
show diagnostic result module all        >> $FILENAME
echo                                     >> $FILENAME

echo 'vsh -c "show boot sup-1"' >> $FILENAME
vsh -c "show boot sup-1"        >> $FILENAME
echo                            >> $FILENAME

echo 'vsh -c "show boot sup-2"' >> $FILENAME
vsh -c "show boot sup-2"        >> $FILENAME
echo                            >> $FILENAME

echo "show proc cpu sort"       >> $FILENAME
show proc cpu sort              >> $FILENAME
echo                            >> $FILENAME

echo "vsh -c 'show processes cpu history'" >> $FILENAME
vsh -c 'show processes cpu history'        >> $FILENAME
echo                                       >> $FILENAME

#Get Switch Memory Utilization
echo "show system resources"      >> $FILENAME
show system resources             >> $FILENAME
echo                              >> $FILENAME

echo "free -g"                    >> $FILENAME
free -g                           >> $FILENAME
echo                              >> $FILENAME

echo
echo "---- Part 2/8 Completed ----"
echo

####################################################

DATA=`date +"%Y-%m-%d"`
FILENAME="/data/techsupport/collect-LEAF-$HOSTNAME-$DATA-Part3-neighb.txt"
FILENAMELLDP="/data/techsupport/collect-LEAF-$HOSTNAME-$DATA-Part3-lldpAdjEp.xml"
FILENAMECDP="/data/techsupport/collect-LEAF-$HOSTNAME-$DATA-Part3-cdpAdjEp.xml"

echo "show lldp neighbors"   >  $FILENAME
show lldp neighbors          >> $FILENAME
echo                         >> $FILENAME

echo "show cdp neighbors"    >> $FILENAME
show cdp neighbors           >> $FILENAME
echo                         >> $FILENAME

echo "show lldp neighbors detail" >> $FILENAME
show lldp neighbors detail        >> $FILENAME
echo                              >> $FILENAME

echo "show cdp neighbors detail"  >> $FILENAME
show cdp neighbors detail         >> $FILENAME
echo                              >> $FILENAME

moquery -c lldpAdjEp  -o xml      > $FILENAMELLDP
moquery -c cdpAdjEp   -o xml      > $FILENAMECDP

echo
echo "---- Part 3/8 Completed ----"
echo

####################################################

DATA=`date +"%Y-%m-%d"`
FILENAME="/data/techsupport/collect-LEAF-$HOSTNAME-$DATA-Part4-interf.txt"

echo "show interface"             >  $FILENAME
show interface                    >> $FILENAME
echo                              >> $FILENAME

echo "show interface status"      >> $FILENAME
show interface status             >> $FILENAME
echo                              >> $FILENAME

echo "show interface description" >> $FILENAME
show interface description        >> $FILENAME
echo                              >> $FILENAME

echo "show interface switchport"  >> $FILENAME
show interface switchport         >> $FILENAME
echo                              >> $FILENAME

echo "show fex"                   >> $FILENAME
show fex                          >> $FILENAME
echo                              >> $FILENAME

echo "show fex detail"            >> $FILENAME
show fex detail                   >> $FILENAME
echo                              >> $FILENAME

echo "show vpc"                   >> $FILENAME
show vpc                          >> $FILENAME
echo                              >> $FILENAME

echo "show vpc brief"             >> $FILENAME
show vpc brief                    >> $FILENAME
echo                              >> $FILENAME

echo "show port-channel summary"  >> $FILENAME
show port-channel summary         >> $FILENAME
echo                              >> $FILENAME

echo "show port-channel traffic"  >> $FILENAME
show port-channel traffic         >> $FILENAME
echo                              >> $FILENAME

echo "show port-channel usage"    >> $FILENAME
show port-channel usage           >> $FILENAME
echo                              >> $FILENAME

echo "show port-channel capacity" >> $FILENAME
show port-channel capacity        >> $FILENAME
echo                              >> $FILENAME

echo "show port-channel extended" >> $FILENAME
show port-channel extended        >> $FILENAME
echo                              >> $FILENAME

echo
echo "---- Part 4/8 Completed ----"
echo

####################################################

DATA=`date +"%Y-%m-%d"`
FILENAME="/data/techsupport/collect-LEAF-$HOSTNAME-$DATA-Part5-route.txt"

echo "show vrf"  >  $FILENAME
show vrf         >> $FILENAME
echo             >> $FILENAME

echo "show ip int brief vrf overlay-1" >> $FILENAME
show ip int brief vrf overlay-1        >> $FILENAME
echo                                   >> $FILENAME

echo "show ip int brief vrf all"       >> $FILENAME
show ip int brief vrf all              >> $FILENAME
echo                                   >> $FILENAME

echo "show ip route vrf all"           >> $FILENAME
show ip route vrf all                  >> $FILENAME
echo                                   >> $FILENAME

echo "show ip ospf neighbors vrf all"  >> $FILENAME
show ip ospf neighbors vrf all         >> $FILENAME
echo                                   >> $FILENAME

echo "show ip ospf route vrf all"      >> $FILENAME
show ip ospf route vrf all             >> $FILENAME
echo                                   >> $FILENAME

echo "show ip ospf neighbors vrf overlay-1" >> $FILENAME
show ip ospf neighbors vrf overlay-1        >> $FILENAME
echo                                        >> $FILENAME

echo "show ip interface vrf overlay-1 | egrep -A 1 status" >> $FILENAME
show ip interface vrf overlay-1 | egrep -A 1 status        >> $FILENAME
echo                                                       >> $FILENAME

echo "show bgp all summary vrf all"   >> $FILENAME
show bgp all summary vrf all          >> $FILENAME
echo                                  >> $FILENAME

echo "show bgp all neighbors vrf all" >> $FILENAME
show bgp all neighbors vrf all        >> $FILENAME
echo                                  >> $FILENAME

echo "show vlan extended"             >> $FILENAME
show vlan extended                    >> $FILENAME
echo                                  >> $FILENAME

echo 'vsh -c "show vlan all-ports"'   >> $FILENAME
vsh -c "show vlan all-ports"          >> $FILENAME
echo                                  >> $FILENAME

echo 'vsh -c "show vlan summary"'     >> $FILENAME
vsh -c "show vlan summary"            >> $FILENAME
echo                                  >> $FILENAME

echo
echo "---- Part 5/8 Completed ----"
echo

####################################################

DATA=`date +"%Y-%m-%d"`
FILENAME="/data/techsupport/collect-LEAF-$HOSTNAME-$DATA-Part6-others.txt"

echo "show bgp process vrf overlay-1"               >  $FILENAME
show bgp process vrf overlay-1                      >> $FILENAME
echo                                                >> $FILENAME

echo "show bgp vpnv4 unicast summary vrf overlay-1" >> $FILENAME
show bgp vpnv4 unicast summary vrf overlay-1        >> $FILENAME
echo                                                >> $FILENAME

echo "show bgp vpnv6 unicast summary vrf overlay-1" >> $FILENAME
show bgp vpnv6 unicast summary vrf overlay-1        >> $FILENAME
echo                                                >> $FILENAME

echo "show bgp ipv4 unicast vrf all"                >> $FILENAME
show bgp ipv4 unicast vrf all                       >> $FILENAME
echo                                                >> $FILENAME

echo "show bgp process vrf all"                     >> $FILENAME
show bgp process vrf all                            >> $FILENAME
echo                                                >> $FILENAME

echo "show system internal epm vlan all"            >> $FILENAME
show system internal epm vlan all                   >> $FILENAME
echo                                                >> $FILENAME

echo "show zoning-rule"                             >> $FILENAME
show zoning-rule                                    >> $FILENAME
echo                                                >> $FILENAME

echo "show zoning-filter"                           >> $FILENAME
show zoning-filter                                  >> $FILENAME
echo                                                >> $FILENAME

echo "show system internal policy-mgr stats"        >> $FILENAME
show system internal policy-mgr stats               >> $FILENAME
echo                                                >> $FILENAME

echo "show logging ip access-list internal packet-log deny" >> $FILENAME
show logging ip access-list internal packet-log deny        >> $FILENAME
echo                                                        >> $FILENAME

echo "contract_parser.py"                                   >> $FILENAME
contract_parser.py                                          >> $FILENAME
echo                                                        >> $FILENAME

echo 'vsh_lc -c "show platform internal hal health-stats"'  >> $FILENAME
vsh_lc -c "show platform internal hal health-stats"         >> $FILENAME
echo                                                        >> $FILENAME

#check if have PBR (l4-l7)
echo "show service redir info"                              >> $FILENAME
show service redir info                                     >> $FILENAME
echo                                                        >> $FILENAME

echo
echo "---- Part 6/8 Completed ----"
echo

####################################################

DATA=`date +"%Y-%m-%d"`
FILENAME="/data/techsupport/collect-LEAF-$HOSTNAME-$DATA-Part7-endpoint.txt"

echo "show endpoint detail"  >  $FILENAME
show endpoint detail         >> $FILENAME
echo                         >> $FILENAME

echo "show endpoint"         >> $FILENAME
show endpoint                >> $FILENAME
echo                         >> $FILENAME

echo "show endpoint summary" >> $FILENAME
show endpoint summary        >> $FILENAME
echo                         >> $FILENAME

echo
echo "---- Part 7/8 Completed ----"
echo

####################################################

DATA=`date +"%Y-%m-%d"`
FILENAME="/data/techsupport/collect-LEAF-$HOSTNAME-$DATA-Part8-faultInst.txt"

echo
echo "Get all Active Faults [ moquery -c faultInst ] (1/4)"

echo "moquery -c faultInst"  >  $FILENAME
moquery -c faultInst         >> $FILENAME

FILENAME="/data/techsupport/collect-LEAF-$HOSTNAME-$DATA-Part8-faultInst-code.txt"
echo "Get all Active Faults [ moquery -c faultInst ] (2/4)"
echo 'moquery -c faultInst | egrep -e "^code" | sort | uniq -c'  >  $FILENAME
moquery -c faultInst | egrep -e "^code" | sort | uniq -c         >> $FILENAME

FILENAME="/data/techsupport/collect-LEAF-$HOSTNAME-$DATA-Part8-faultInst-descr.txt"
echo "Get all Active Faults [ moquery -c faultInst ] (3/4)"
echo 'moquery -c faultInst | egrep -e "^descr" | sort | uniq -c' >  $FILENAME
moquery -c faultInst | egrep -e "^descr" | sort | uniq -c        >> $FILENAME

FILENAME="/data/techsupport/collect-LEAF-$HOSTNAME-$DATA-Part8-faultInst.xml"
echo "Get all Active Faults [ moquery -c faultInst ] (4/4)"
echo 'moquery -c faultInst -o xml' >  $FILENAME
moquery -c faultInst -o xml        >> $FILENAME

echo
echo "---- Part 8/8 Completed ----"
echo
echo

####################################################

FILENAMES1="/data/techsupport/collect-LEAF-$HOSTNAME"
echo
echo "FINISHED"
echo "-------------------"
echo "Please copy all output files starting with string: $FILENAMES1 ..."
echo
### scp $FILENAMES1* admin@10.122.17.202:/tmp/.
