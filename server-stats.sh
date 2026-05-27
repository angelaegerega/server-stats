#!/bin/bash

cpu_usage=$(top -bn1 | grep "Cpu(s)")
echo "CPU Usage: $cpu_usage"

mem_usage=$(free -h | grep "Mem:")
total_mem=$(echo $mem_usage | awk '{print $2}')
used_mem=$(echo $mem_usage | awk '{print $3}')
free_mem=$(echo $mem_usage | awk '{print $4}')
percentage=$(free | grep Mem | awk '{printf "%.1f", $3/$2 * 100}')
echo "Total Memory: $total_mem"
echo "Used Memory: $used_mem ($percentage%)"
echo "Free Memory: $free_mem"

disk_usage=$(df -h /)
total_disk_usage=$(echo $disk_usage | awk '{print $2}')
used=$(echo $disk_usage | awk '{print $3}')
free=$(echo $disk_usage | awk '{print $4}')
percentage=$(echo $disk_usage | awk '{print $5}')
echo "Total Disk Space: $total_disk_usage"
echo "Used Disk Space: $used ($percentage)"
echo "Free Disk Space: $free"

echo "Top 5 Processes by CPU Usage:"
echo "--------------------------------"
top -bn1 | head -12 | tail -5

echo "Top 5 Processes by Memory Usage:"
echo "--------------------------------"
top -bn1 -o %MEM | head -12 | tail -5



