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