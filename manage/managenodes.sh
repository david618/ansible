#!/bin/bash

# sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
# sudo sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'
# sudo yum -y install azure-cli
# sudo yum -y install jq



#ACTION="deallocate"
ACTION="start"


# Use Azure Metadata to lookup Resource Group
resourceGroup=$(curl -s -H Metadata:true http://169.254.169.254/metadata/instance?api-version=2017-08-01 | jq .compute.resourceGroupName --raw-output)


if [ -z "${resourceGroup}" ]; then
  echo "Couldn't find the Resource Group name using Azure Metadata"
  exit 1
fi

for i in $(seq 1 10); do
  name=a${i}
  az vm ${ACTION} --resource-group ${resourceGroup} --name ${resourceGroup}${name} > down_${name}.log 2>&1 &
done

for i in $(seq 41 43); do
  name=a${i}
  az vm ${ACTION} --resource-group ${resourceGroup} --name ${resourceGroup}${name} > down_${name}.log 2>&1 &
done

for i in $(seq 101 103); do
  name=a${i}
  az vm ${ACTION} --resource-group ${resourceGroup} --name ${resourceGroup}${name} > down_${name}.log 2>&1 &
done
