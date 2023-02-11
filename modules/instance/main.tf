resource "aws_instance" "this" {
  instance_type = var.instance_type
  ami           = data.aws_ami.awslinux.id

  key_name = "hillel-test"

  root_block_device {
    volume_size = var.root_block_size
  }

  user_data              = data.local_file.user_data.content
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