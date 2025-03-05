resource "aws_instance" "this" {
  #for_each = var.instances # terraform will give us a variable called each
  ami                    = "ami-09c813fb71547fc4f" # This is our devops-practice AMI ID
  vpc_security_group_ids = [aws_security_group.docker_practice.id]
  instance_type          = "t3.micro"
 # 20GB is not enough
   root_block_device {
    volume_size = 50  # Set root volume size to 50GB
    volume_type = "gp3"  # Use gp3 for better performance (optional)
  }

  user_data = file("userdata.sh")
  tags = {
    Name    = "docker"
    Purpose = "docekr-practice"
  }
}

resource "aws_security_group" "docker_practice" {
  name        = "docker_practice"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "docker_practice"
  }
}
output "ec2-info" {
    value = aws_instance.this.public_ip
}