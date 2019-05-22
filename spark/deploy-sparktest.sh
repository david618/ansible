#!/bin/bash

cd ~
tar cvzf sparktest-files.tgz sparktest/target/sparktest*.jar sparktest/target/dependency-jars/* sparktest/log4j2conf.xml
cd -

sudo yum -y install ansible

export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook -i hosts playbooks/deploy_sparktest-files.yaml

