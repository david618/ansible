#!/bin/bash

cd ~
tar cvzf rttest-files.tgz rttest/target/rttest-full.jar rttest/target/rttest.jar rttest/target/lib/* rttest/sendPlanes 
cd -

sudo yum -y install ansible

export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook -i hosts playbooks/setup_testservers.yaml

