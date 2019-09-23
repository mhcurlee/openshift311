#  OpenShift 3.11 classroom README

##  prep phase
* deploy VMs
* deploy DNS records
* install ansble and git on Ansible node
* clone classroom repo onto Ansible node:  `git clone https://github.com/mhcurlee/openshift311_classroom.git`
* update the prep hosts file and run playbooks
* pull openshift-ansible from github:  `git clone https://github.com/openshift/openshift-ansible.git -b release-3.11`
* update openshift hosts/inventory file


## install phase
* run prereq playbook
* run deploy playbook using `-e openshift_disable_check=docker_image_availability,memory_availability,package_availability,disk_availability`
* setup/deploy app/ingress LB


