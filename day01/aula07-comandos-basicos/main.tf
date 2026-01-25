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

resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

# Fontes
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
# https://github.com/gomex/descomplicando_terraform_turma_2024/tree/main/dia_01/aula_07_comandos_basicos