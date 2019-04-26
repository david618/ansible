#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    echo "$0 ResourceGroup [start|deallocate]"
    exit 2
fi

RG=$1
ACTION=$2

if [ "${ACTION}" != "start" ] && [  "${ACTION}" != "deallocate" ]; then
  echo "Valid actions are start or deallocate"
  exit 3
fi

MCRG=$(az aks list --resource-group ${RG} | jq --raw-output '.[0].nodeResourceGroup')

for node in $(az vm list -g ${MCRG} | jq --raw-output .[].name | grep aks); do
  echo ${node}
  az vm ${ACTION} -g ${MCRG} --name ${node} > ${node}.out 2>&1 &
done
