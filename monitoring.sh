#!/bin/bash

os=$(uname -a)

pcpu=$(cat /proc/cpuinfo | sed '/physical id/!d' | uniq -c | wc -l)

vcpu=$(nproc --a)

ram_total=$(free -m | sed '/Mem/!d' | awk '{print $2}')
ram_used=$(free -m | sed '/Mem/!d' | awk '{print $3}')
ram_usage=$(printf "%.2f" $(echo "scale=4;$ram_used/$ram_total*100" | bc))
ram_info="${ram_used}/${ram_total}MB ($ram_usage%%)"

disk_total=$(df -BM | sed '/dev\/map/!d' | awk '{sum += $2} END {print sum}')
disk_used=$(df -BM | sed '/dev\/map/!d' | awk '{sum += $3} END {print sum}')
disk_usage=$(printf "%.2f" $(echo "scale=4;$disk_used/$disk_total*100" | bc))
disk_info="${disk_used}/${disk_total}MB ($disk_usage%%)"

cpu_unused=$(iostat -c | awk 'FNR==4 {print $6}')
cpu_used=$(printf "%.2f" $(echo "100-$cpu_unused" | bc))
cpu_info="${cpu_used}%%"

last_boot_date=$(who -b | awk '{print $3}')
last_boot_time=$(who -b | awk '{print $4}')
last_boot="$last_boot_date $last_boot_time"

lvm_mapper=$(cat /etc/fstab | sed '/\/dev\/mapper\//!d' | wc -l)
lvm_usage=$(if [ $lvm_mapper > 0 ]
			then
				echo "Yes"
			else
				echo "No"
			fi)

connections="$(netstat -ant | sed '/ESTABLISHED/!d' | wc -l) ESTABLISHED"

users=$(who | sed '/pts/!d' | wc -l)

ipv4=$(ip addr | grep inet | grep enp | sed 's/\// /g' | awk '{print $2}')
mac=$(ip addr | sed '/ether/!d' | awk '{print $2}')
network="IP $ipv4 ($mac)"

sudoes="$(echo "($(find /var/log/sudo -type f | wc -l)-1)/8" | bc) cmd"

printf "\t#Architecture : $os\n"
printf "\t#CPU physical : $pcpu\n"
printf "\t#vCPU : $vcpu\n"
printf "\t#Memory Usage : $ram_info\n"
printf "\t#Disk Usage : $disk_info\n"
printf "\t#CPU load : $cpu_info\n"
printf "\t#Last boot : $last_boot\n"
printf "\t#LVM use : $lvm_usage\n"
printf "\t#Connections TCP : $connections\n"
printf "\t#User log : $users\n"
printf "\t#Network : $network\n"
printf "\t#Sudo : $sudoes\n"