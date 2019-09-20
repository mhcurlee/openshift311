# Notes

### Setup Ansible host 

Copy SSH key to Ansible node

sudo yum install -y centos-release-ansible26.noarch
sudo yum install -y ansible git
git clone https://github.com/mhcurlee/openshift311_classroom.git



### Required servers

* nfs
* ansible
* master01
* master02
* master03
* infra01
* infra02
* infra03
* node01
* node02
* node03


###  Add Load Balancers

Master LB:
TCP 80,443  ==> LB [ master01, master02, master03 ]

Infra/Routing LB:
TCP 80,443  ==> LB [ infra01, infra02, infra03 ]




###  Add DNS for Master LB:

openshift.gocurlee.com
openshift.local.gocurlee.com


Add DNS for Infra/Routing
*.apps.gocurlee.com



### Deploy cluster

Clone OpenShift playbooks



