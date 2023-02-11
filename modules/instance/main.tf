resource "aws_instance" "this" {
  instance_type = var.instance_type
  ami           = data.aws_ami.awslinux.id

  key_name = "hillel-test"

  root_block_device {
    volume_size = var.root_block_size
  }

  user_data = <<EOF
          #!/usr/bin/env bash
          yum install -y docker
          systemctl enable docker
          systemctl start docker
          usermod -aG docker ec2-user
          aws ecr get-login-password --region=us-east-1 | docker login --username AWS --password-stdin 507676015690.dkr.ecr.us-east-1.amazonaws.com
          docker run -d --name app -p 8080:80 507676015690.dkr.ecr.us-east-1.amazonaws.com/react-realworld-app:test
  EOF
  iam_instance_profile   = var.instance_profile
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = var.instance_name
    Test = "Test"
  }

  lifecycle {
    ignore_changes = [user_data]
  }
}

resource "aws_security_group_rule" "this" {
  security_group_id = var.security_group_id
  description       = var.security_group_description

  type        = var.security_group_type
  from_port   = var.security_group_from_port
  to_port     = var.security_group_to_port
  protocol    = var.security_group_to_protocol
  cidr_blocks = var.security_group_cidr_blocks
}