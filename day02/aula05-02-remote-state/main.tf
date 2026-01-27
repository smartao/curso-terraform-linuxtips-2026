# Nessa aula vamos pegar o IP de output de outro estado remoto (aula05-01-output) 
# e usar na configuração de um security group.
# coforme documentação oficial, isso não é uma boa recomendado
# https://developer.hashicorp.com/terraform/language/state/remote-state-data

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

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name       = "HelloWorld"
    Env        = "develop"
    Plataforma = data.aws_ami.ubuntu.platform_details
  }
}

data "terraform_remote_state" "aula_output" {
  backend = "s3"
  config = {
    bucket = "sergei-curso-linuxtips-2026"
    key    = "day02-aula0501-output"
    region = "us-east-1"
  }
}




# Fontes
# https://developer.hashicorp.com/terraform/language/values/outputs
# https://developer.hashicorp.com/terraform/language/state/remote-state-data