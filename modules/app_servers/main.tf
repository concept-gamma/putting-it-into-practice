data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-*.*-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "web_servers" {
  count = 3
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [ var.security_group_id ]
  subnet_id = var.subnet_id[count.index]
  associate_public_ip_address = true

  key_name = var.key_name

  tags = {
    Name = "app_server_00${count.index +1}"
  }
}