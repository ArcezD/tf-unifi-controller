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

resource "aws_network_interface" "nic" {
  subnet_id       = aws_subnet.public_subnet.id
  private_ips     = [var.ec2_private_ip]
  security_groups = [aws_security_group.unifi_access.id]
}

resource "aws_eip" "public_ip" {
  vpc                       = true
  network_interface         = aws_network_interface.nic.id
  associate_with_private_ip = var.ec2_private_ip
}

resource "aws_instance" "unifi_controller" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type

  key_name = var.ec2_key_pair_name

  user_data = file("unifi.sh")

  network_interface {
    network_interface_id = aws_network_interface.nic.id
    device_index         = 0
  }

  root_block_device {
    volume_size           = "30"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name        = var.ec2_instance_name
    Environment = var.environment
  }
}