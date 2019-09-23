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
  description = "Centos ami"
  default = ["sg-06e8b0b20f44cf322"]
}

variable "subnet_name" {
  description = "Subnet name"
  default = "subnet-d52b2dfd"
}


# create VMs

resource "aws_instance" "nfs" {
  ami           = "${var.ami_name}"
  instance_type = "t2.micro"
  vpc_security_group_ids = "${var.sg_name}"
  subnet_id = "${var.subnet_name}"
  key_name = "${var.ssh_keyname}"
  

  root_block_device {
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


# Output private DNS info


output "master01" {
  value = "${aws_instance.master01.private_dns}"
}
output "master02" {
  value = "${aws_instance.master02.private_dns}"
}
output "master03" {
  value = "${aws_instance.master03.private_dns}"
}

output "infra01" {
  value = "${aws_instance.infra01.private_dns}"
}
output "infra02" {
  value = "${aws_instance.infra02.private_dns}"
}
output "infra03" {
  value = "${aws_instance.infra03.private_dns}"
}

output "node01" {
  value = "${aws_instance.node01.private_dns}"
}
output "node02" {
  value = "${aws_instance.node02.private_dns}"
}
output "node03" {
  value = "${aws_instance.node03.private_dns}"
}

output "nfs" {
  value = "${aws_instance.nfs.private_dns}"
}

output "lb" {
  value = "${aws_instance.lb.private_dns}"
}


