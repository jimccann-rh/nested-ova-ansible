#!/bin/bash
#ansible-playbook -i hosts main.yml --extra-var version="8" --extra-var='{"target_hosts": [nested8-myjobname-host.vpshere.local,nested8-myjobname-host1.vsphere.local]}'
#ansible-playbook -i hosts main.yml --extra-var version="8" --extra-var='{"target_hosts": [nested8-myjobname1-host.vpshere.local,nested8-myjobname2-host.vpshere.local]}' --extra-var='{"target_vcs": [nested8-myjobname-VC.vpshere.local]}' --extra-var testingesxi=true --extra-var testingvc=true
#ansible-playbook -i hosts main.yml --extra-var version="8" --extra-var='{"target_hosts": [nested8-myjobname1-host.vpshere.local,nested8-myjobname2-host.vpshere.local]}' --extra-var='{"target_vcs": [nested8-myjobname-VC.vpshere.local]}' --extra-var testingesxi=false --extra-var testingvc=false


echo "https://github.com/jimccann-rh/nested-ova-ansible"

echo "@@@ GOING TO DELETE NESTED VM'S IN 5 SECONDS"
sleep 10

echo "ansible-playbook -i hosts main.yml --extra-var version="8" --extra-var='{"target_hosts": [nested8-myjobname1-host.vpshere.local,nested8-myjobname2-host.vpshere.local]}' --extra-var='{"target_vcs": [nested8-myjobname-VC.vpshere.local]}' --extra-var removevsphere=true -t removevsphere"
echo 'ansible-playbook -i hosts main.yml --extra-var version="7" --extra-var='{"target_hosts": [nested7-myjobname1-host.vpshere.local,nested7-myjobname2-host.vpshere.local]}' --extra-var='{"target_vcs": [nested7-myjobname-VC.vpshere.local]}' --extra-var removevsphere=true -t removevsphere'

echo "@@@"
time  ANSIBLE_LOG_PATH=/tmp/dynamic_$(date +"%d%m%Y_%H%M%S").log ansible-playbook -i hosts main.yml --extra-var version="8" --extra-var='{"target_hosts": [nested8-myjobname1-host.vpshere.local,nested8-myjobname2-host.vpshere.local]}' --extra-var='{"target_vcs": [nested8-myjobname-VC.vpshere.local]}' --extra-var removevsphere=true -t removevsphere
echo "@@@"
time  ANSIBLE_LOG_PATH=/tmp/dynamic_$(date +"%d%m%Y_%H%M%S").log ansible-playbook -i hosts main.yml --extra-var version="7" --extra-var='{"target_hosts": [nested7-myjobname1-host.vpshere.local,nested7-myjobname2-host.vpshere.local]}' --extra-var='{"target_vcs": [nested7-myjobname-VC.vpshere.local]}' --extra-var removevsphere=true -t removevsphere

echo "@@@ GOING TO CREATE NESTED VSPHERE ENVIRONMENT"
echo 'ansible-playbook -i hosts main.yml --extra-var version="8" --extra-var='{"target_hosts": [nested8-myjobname1-host.vpshere.local,nested8-myjobname2-host.vpshere.local]}' --extra-var='{"target_vcs": [nested8-myjobname-VC.vpshere.local]}' --extra-var esximemory="65536" --extra-var esxicpu="16" '
echo 'ansible-playbook -i hosts main.yml --extra-var version="7" --extra-var='{"target_hosts": [nested7-myjobname1-host.vpshere.local]}' --extra-var='{"target_vcs": [nested7-myjobname-VC.vpshere.local]}' --extra-var esximemory="65536" --extra-var esxicpu="16"'

echo "@@@"
time  ANSIBLE_LOG_PATH=/tmp/dynamic_$(date +"%d%m%Y_%H%M%S").log ansible-playbook -i hosts main.yml --extra-var version="8" --extra-var='{"target_hosts": [nested8-myjobname1-host.vpshere.local,nested8-myjobname2-host.vpshere.local]}' --extra-var='{"target_vcs": [nested8-myjobname-VC.vpshere.local]}' --extra-var esximemory="65536" --extra-var esxicpu="16"

echo "@@@"
time  ANSIBLE_LOG_PATH=/tmp/dynamic_$(date +"%d%m%Y_%H%M%S").log ansible-playbook -i hosts main.yml --extra-var version="7" --extra-var='{"target_hosts": [nested7-myjobname1-host.vpshere.local]}' --extra-var='{"target_vcs": [nested7-myjobname-VC.vpshere.local]}' --extra-var esximemory="65536" --extra-var esxicpu="16"

#echo "@@@ RERUN SCRIPT FOR CONFIRMING ENVIRONMENT"
#
#echo "@@@"
time ansible-playbook -i hosts main.yml --extra-var version="8" --extra-var='{"target_hosts": [nested8-myjobname1-host.vpshere.local,nested8-myjobname2-host.vpshere.local]}' --extra-var='{"target_vcs": [nested8-myjobname-VC.vpshere.local]}' --extra-var esximemory="65536" --extra-var esxicpu="16"
#
#echo "@@@"
time ansible-playbook -i hosts main.yml --extra-var version="7" --extra-var='{"target_hosts": [nested7-myjobname1-host.vpshere.local]}' --extra-var='{"target_vcs": [nested7-myjobname-VC.vpshere.local]}' --extra-var esximemory="65536" --extra-var esxicpu="16"

echo "@@@ DONE"



echo "### CRONJOB"
time ansible-playbook -i hosts main.yml --extra-var createcron=true --extra-var version="8" --extra-var='{"target_hosts": [nested8-myjobname1-host.vpshere.local]}' --extra-var='{"target_vcs": [nested8-myjobname-VC.vpshere.local]}' --extra-var esximemory="65536" --extra-var esxicpu="16"




time ansible-playbook -i hosts main.yml --extra-var vc_fact_password="thepassword" --extra-var createcron=true --extra-var version="8" --extra-var='{"target_hosts": [nested8-myjobname1-host.vpshere.local]}' --extra-var='{"target_vcs": [nested8-myjobname-VC.vpshere.local]}' --extra-var esximemory="65536" --extra-var esxicpu="16"

