#!/bin/bash

sudo yum -y install ansible

export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook -i hosts playbooks/deploy_sparktest-files.yaml

