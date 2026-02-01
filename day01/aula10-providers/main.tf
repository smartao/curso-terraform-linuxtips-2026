data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "ubuntu_west" {
  most_recent = true
  provider    = aws.west

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}



resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
    Env  = "develop"
  }
}

resource "aws_instance" "web_west" {
  ami           = data.aws_ami.ubuntu_west.id
  instance_type = "t3.micro"
  provider      = aws.west

  tags = {
    Name = "HelloWorld2"
    Env  = "develop"
  }
}

# Fontes
# https://developer.hashicorp.com/terraform/tutorials/configuration-language/configure-providers#provider-aliasing