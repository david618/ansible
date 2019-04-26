# Ansible Install Elasticsearch

## Edit hosts file

Define nodes 
- master (must be an odd number 1,3,5); three is usually good.  These nodes will only be masters
- data (these are data nodes any number needed)

## Format drives

Assumes you have set the user's private key in .ssh/id_rsa.

The default playbook ```format-data-drive.yaml``` finds, formats, and mounts one data drive at ```/opt/elasticsearch```.  T

Run ```bash format-drives.sh```.

## Install elasticsearch

### Single Node

Run ```bash install-elasticsearch-one-node.sh``` if you want to install a single node elasticsearch.  Only one master should be specified in the hosts file.

### Multi-Node

Run ```bash install-elasticsearch.sh```


## Start Elasticsearch

```
ansible-playbook --private-key /home/azureuser/dsetestkey -i hosts playbooks/start-elasticsearch.yaml
```

The ```--private-key``` can be left blank if private key is loaded in ```.ssh/id_rsa```

You can check the nodes using a curl command:  ```curl a61:9200/_cat/nodes```

## Stop Elasticsearch

```
ansible-playbook -i hosts playbooks/stop-elasticsearch.yaml
```
