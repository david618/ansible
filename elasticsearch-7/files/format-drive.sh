#!/bin/bash

# Find first unpartition drive
datadrive="None"
for disk in $(lsblk -e 2 | grep disk | cut -d ' ' -f1); do
  a=$(blkid | grep -v PTTYPE | grep ${disk})
  if [[ -z ${a} ]]; then
    datadrive=${disk}
    break
  fi
done

#echo "datadrive: $datadrive"

if [ "$datadrive" == "None" ]; then
   echo "None"
   exit 0
fi 

# Partition the Drive
gdisk /dev/${datadrive} << EOF
n




w
Y
EOF

# Find the Partition
partition=$(lsblk -l | grep ${datadrive} | grep part | cut -d' ' -f1)
#echo "partition: $partition"

# Format the Partition
mkfs -t xfs -n ftype=1 /dev/${partition}

blkid=$(blkid | grep ${partition})
#echo $blkid

uuid=$(echo $blkid | awk -F'"' '$0=$2')
echo $uuid

