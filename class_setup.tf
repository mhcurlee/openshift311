provider "aws" {
  region = "us-east-1"
}


#  vars section

variable "ssh_keyname" {
  description = "key name to use for SSH access"
  default = "myssh"
}

variable "ami_name" {
  description = "Centos ami"
  default = "ami-02eac2c0129f6376b"
}

variable "sg_name" {
  description = "Security Group name"
  default = ["sg-06e8b0b20f44cf322"]
}

variable "subnet_name" {
  description = "Subnet name"
  default = "subnet-d52b2dfd"
}

variable "r53_zone_id" {
description = "Route53 zone id"
default = "Z1EEQ05I8FZVXC"

}

variable "r53_domain" {
description = "Route53 domain name"
default = "gocurlee.com"

}


# create VMs

resource "aws_instance" "nfs" {
  ami           = "${var.ami_name}"
  instance_type = "t2.micro"
  vpc_security_group_ids = "${var.sg_name}"
  subnet_id = "${var.subnet_name}"
  key_name = "${var.ssh_keyname}"
  

  root_block_device {
    volume_size = "40"  
    delete_on_termination = "true"
  }

  tags = {
    Name = "nfs"
  }
}

resource "aws_instance" "lb" {
  ami           = "${var.ami_name}"
  instance_type = "t2.micro"
  vpc_security_group_ids = "${var.sg_name}"
  subnet_id = "${var.subnet_name}"
  key_name = "${var.ssh_keyname}"
  

  root_block_device {
    delete_on_termination = "true"
  }

  tags = {
    Name = "lb"
  }
}


resource "aws_instance" "ansible" {
  ami           = "${var.ami_name}"
  instance_type = "t2.micro"
  vpc_security_group_ids = "${var.sg_name}"
  subnet_id = "${var.subnet_name}"
  key_name = "${var.ssh_keyname}"

  root_block_device {
    delete_on_termination = "true"
  }

  tags = {
    Name = "ansible"
  }
}


# Master nodes
resource "aws_instance" "master01" {
  ami           = "${var.ami_name}"
  instance_type = "t2.medium"
  vpc_security_group_ids = "${var.sg_name}"
  subnet_id = "${var.subnet_name}"
  key_name = "${var.ssh_keyname}"
  

  root_block_device {
    volume_size = "40"
    delete_on_termination = "true"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "80"
    volume_type = "standard"
    delete_on_termination = "true"
  }

  tags = {
    Name = "master01"
  }


}


resource "aws_instance" "master02" {
  ami           = "${var.ami_name}"
  instance_type = "t2.medium"
  vpc_security_group_ids = "${var.sg_name}"
  subnet_id = "${var.subnet_name}"
  key_name = "${var.ssh_keyname}"
  
  
  root_block_device {
    volume_size = "40"
    delete_on_termination = "true"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "80"
    volume_type = "standard"
    delete_on_termination = "true"
  }

  tags = {
    Name = "master02"
  }


}



resource "aws_instance" "master03" {
  ami           = "${var.ami_name}"
  instance_type = "t2.medium"
  vpc_security_group_ids = "${var.sg_name}"
  subnet_id = "${var.subnet_name}"
  key_name = "${var.ssh_keyname}"
  
  
  root_block_device {
    volume_size = "40"
    delete_on_termination = "true"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "80"
    volume_type = "standard"
    delete_on_termination = "true"
  }

  tags = {
    Name = "master03"
  }


}



## Infra/Routing nodes

resource "aws_instance" "infra01" {
  ami           = "${var.ami_name}"
  instance_type = "t2.medium"
  vpc_security_group_ids = "${var.sg_name}"
  subnet_id = "${var.subnet_name}"
  key_name = "${var.ssh_keyname}"
  
  
  root_block_device {
    volume_size = "40"
    delete_on_termination = "true"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "80"
    volume_type = "standard"
    delete_on_termination = "true"
  }

  tags = {
    Name = "infra01"
  }


}


resource "aws_instance" "infra02" {
  ami           = "${var.ami_name}"
  instance_type = "t2.medium"
  vpc_security_group_ids = "${var.sg_name}"
  subnet_id = "${var.subnet_name}"
  key_name = "${var.ssh_keyname}"
  
  
  root_block_device {
    volume_size = "40"
    delete_on_termination = "true"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "80"
    volume_type = "standard"
    delete_on_termination = "true"
  }

  tags = {
    Name = "infra02"
  }


}



resource "aws_instance" "infra03" {
  ami           = "${var.ami_name}"
  instance_type = "t2.medium"
  vpc_security_group_ids = "${var.sg_name}"
  subnet_id = "${var.subnet_name}"
  key_name = "${var.ssh_keyname}"
  
  
  root_block_device {
    volume_size = "40"
    delete_on_termination = "true"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "80"
    volume_type = "standard"
    delete_on_termination = "true"
  }

  tags = {
    Name = "infra03"
  }


}




resource "aws_instance" "node01" {
  ami           = "${var.ami_name}"
  instance_type = "t2.medium"
  vpc_security_group_ids = "${var.sg_name}"
  subnet_id = "${var.subnet_name}"
  key_name = "${var.ssh_keyname}"
  
  
  root_block_device {
    volume_size = "40"
    delete_on_termination = "true"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "80"
    volume_type = "standard"
    delete_on_termination = "true"
  }

  tags = {
    Name = "node01"
  }


}


resource "aws_instance" "node02" {
  ami           = "${var.ami_name}"
  instance_type = "t2.medium"
  vpc_security_group_ids = "${var.sg_name}"
  subnet_id = "${var.subnet_name}"
  key_name = "${var.ssh_keyname}"
  
  
  root_block_device {
    volume_size = "40"
    delete_on_termination = "true"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "80"
    volume_type = "standard"
    delete_on_termination = "true"
  }

  tags = {
    Name = "node02"
  }


}



resource "aws_instance" "node03" {
  ami           = "${var.ami_name}"
  instance_type = "t2.medium"
  vpc_security_group_ids = "${var.sg_name}"
  subnet_id = "${var.subnet_name}"
  key_name = "${var.ssh_keyname}"
  
  
  root_block_device {
    volume_size = "40"
    delete_on_termination = "true"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "80"
    volume_type = "standard"
    delete_on_termination = "true"
  }

  tags = {
    Name = "node03"
  }


}


#  Create DNS records
resource "aws_route53_record" "ansible" {
  zone_id = "${var.r53_zone_id}"
  name    = "ansible.${var.r53_domain}"
  type    = "A"
  ttl = "60"
  records = [ "${aws_instance.ansible.public_ip}"]
  
  }


resource "aws_route53_record" "nfs" {
  zone_id = "${var.r53_zone_id}"
  name    = "nfs.${var.r53_domain}"
  type    = "A"
  ttl = "60"
  records = [ "${aws_instance.nfs.private_ip}"]
  
  }

resource "aws_route53_record" "master-local" {
  zone_id = "${var.r53_zone_id}"
  name    = "master-local.${var.r53_domain}"
  type    = "A"
  ttl = "60"
  records = [ "${aws_instance.lb.private_ip}"]
  
  }


resource "aws_route53_record" "master" {
  zone_id = "${var.r53_zone_id}"
  name    = "master.${var.r53_domain}"
  type    = "A"
  ttl = "60"
  records = [ "${aws_instance.lb.public_ip}"]
  
  }

resource "aws_route53_record" "wildcard" {
  zone_id = "${var.r53_zone_id}"
  name    = "*.apps.${var.r53_domain}"
  type    = "A"
  ttl = "60"
  records = [ "${aws_instance.infra01.public_ip}", "${aws_instance.infra02.public_ip}", "${aws_instance.infra03.public_ip}"]
  
  }



# Output private DNS info


output "master01" {
  value = "${aws_instance.master01.public_dns}"
}

output "prep_data" {
  value = <<EOT


[ocp]
${aws_instance.master01.private_dns}
${aws_instance.master02.private_dns}
${aws_instance.master03.private_dns}
${aws_instance.infra01.private_dns}
${aws_instance.infra02.private_dns}
${aws_instance.infra03.private_dns}
${aws_instance.node01.private_dns}
${aws_instance.node02.private_dns}
${aws_instance.node03.private_dns}

[nfs]
${aws_instance.nfs.private_dns}


EOT

}

output "openshift_data" {
value = <<EOT


[masters]
${aws_instance.master01.private_dns}
${aws_instance.master02.private_dns}
${aws_instance.master03.private_dns}

[etcd]
${aws_instance.master01.private_dns}
${aws_instance.master02.private_dns}
${aws_instance.master03.private_dns}

[nodes]
${aws_instance.master01.private_dns} openshift_node_group_name="node-config-master"
${aws_instance.master02.private_dns} openshift_node_group_name="node-config-master"
${aws_instance.master03.private_dns} openshift_node_group_name="node-config-master"

${aws_instance.infra01.private_dns} openshift_node_group_name="node-config-infra"
${aws_instance.infra02.private_dns} openshift_node_group_name="node-config-infra"
${aws_instance.infra03.private_dns} openshift_node_group_name="node-config-infra"

${aws_instance.node01.private_dns} openshift_node_group_name="node-config-compute"
${aws_instance.node02.private_dns} openshift_node_group_name="node-config-compute"
${aws_instance.node03.private_dns} openshift_node_group_name="node-config-compute"

[lb]
${aws_instance.lb.private_dns}

EOT
}
