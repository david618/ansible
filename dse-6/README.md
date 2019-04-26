# Ansible Install DSE

## Edit hosts file

Define solr (aka dse) nodes and the opscenter node.

## Format drives

Edit format-drives.sh and set the path to the private-key.

The default playbook ```format-data-drive.yaml``` finds, formats, and mounts one data drive at ```/var/lib/cassandra```.

There are some alternative examples ```playbook/format-drives-azure.yaml```.  This formats 4 drives; it may require some tweaking for the install.

Run ```bash format-drives.sh```.

## Install datastax

Edit ```playbook/install_dse.yaml```.  Update the username/password for your Datastax Academy account. 

Edit ```install_dse.sh```.  Set the private-key as needed.

Run ```bash install-dse.sh```.
