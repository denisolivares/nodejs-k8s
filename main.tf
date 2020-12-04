# Create a new instance of the latest Ubuntu 20.04 on an
# t3.micro node with an AWS Tag naming it "HelloWorld"
provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = "us-east-1a"

  tags = {
    Name = "Default subnet for us-east-1a"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_default_vpc.default.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  ingress {
    protocol  = 6
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

# Jenkins
  ingress {
    protocol  = 6
    from_port = 8080
    to_port   = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

# k8s
  ingress {
    protocol  = 6
    from_port = 7080
    to_port   = 7080
    cidr_blocks = ["0.0.0.0/0"]
  }

# Kubernetes API server
  ingress {
    protocol  = 6
    from_port = 6443
    to_port   = 6443
    self      = true
  }

# etcd server client API
  ingress {
    protocol  = 6
    from_port = 2379
    to_port   = 2380
    self      = true
  }

# Kubelet API
  ingress {
    protocol  = 6
    from_port = 10250
    to_port   = 10250
    self      = true
  }

# kube-scheduler
  ingress {
    protocol  = 6
    from_port = 10251
    to_port   = 10251
    self      = true
  }

# kube-controller-manager
  ingress {
    protocol  = 6
    from_port = 10252
    to_port   = 10252
    self      = true
  }

# NodePort Services
  ingress {
    protocol  = 6
    from_port = 30000
    to_port   = 32767
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_key_pair" "dos_key" {
  key_name   = "dos_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAotNqnL+73iXTMqI5hjVlzDN3pfccGiuHUaitr2yGspE1QdMknv5Aq8NBMoX7ZDvKyAznQgJ/sT9D+STGYtmtYAZ4OP2YJ98IjQJT0GyvgmweIW+RcQBOlNheDJ1wIRB048LSeRuhrIJ9mkXL6zYHYjI13rRZnh+YNraIZ86CPofJ6InOUhaSwLdNpufKnnmAxQpXpQCLkgdgzcmbXfm8HWRBxzuj0JT/2IbOnEefeHck8MjGMPpW9kV+QPMLOjvB3QFdIJ6hWfyBObRpscbfI/Oq3+bqUj2QpWxfaeJRUUEBcNK6/j6ljgarKzij4YakpPnlV7C6xgO+lHf6Df9ByQ== rsa-key-20201028"
}

resource "aws_instance" "k8sControlPlane" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = "dos_key"
  subnet_id     = aws_default_subnet.default_az1.id
  user_data = file("./userdata/bootstrap-k8sControlPlane")

  tags = {
    Name = "k8sControlPlane"
  }
}

resource "aws_instance" "k8sEndPoint" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name = "dos_key"
  subnet_id     = aws_default_subnet.default_az1.id
  user_data = file("./userdata/bootstrap-k8sEndpoint")


  tags = {
    Name = "k8sEndPoint"
  }
}