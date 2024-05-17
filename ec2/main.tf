resource "aws_iam_role" "ec2_ssm_role" {
  name               = "ec2_ssm"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "ec2_ssm_attachment" {
  name = "ec2_ssm-attach"
  roles      = [aws_iam_role.ec2_ssm_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}


resource "aws_iam_instance_profile" "ec2_ssm_iam_profile" {
  name = "ec2_ssm_iam_profile"
  role = aws_iam_role.ec2_ssm_role.name
}

data "template_file" "web_user_data_template" {
  template = file("${path.module}/${var.web-server_script}")
}

resource "aws_instance" "web_ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.web_server_subnet_id
  security_groups             = ["${var.ec2_webserver_sg_id}"]
  user_data                   = data.template_file.web_user_data_template.rendered
  associate_public_ip_address = false
  iam_instance_profile = aws_iam_instance_profile.ec2_ssm_iam_profile.name
  root_block_device {
    volume_type = "gp2"
    volume_size = 8
  }
  tags = {
    Name = var.ec2_webserver_name
  }
}


data "template_file" "app_user_data_template" {
  template = file("${path.module}/${var.app-server_script}")
}

resource "aws_instance" "app_ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.app_server_subnet_id
  security_groups             = ["${var.ec2_appserver_sg_id}"]
  user_data                   = data.template_file.app_user_data_template.rendered
  associate_public_ip_address = false
  iam_instance_profile = aws_iam_instance_profile.ec2_ssm_iam_profile.name
  root_block_device {
    volume_type = "gp2"
    volume_size = 8
  }
  tags = {
    Name = var.ec2_appserver_name
  }
}


data "template_file" "db_user_data_template" {
  template = file("${path.module}/${var.db-server_script}")
}

resource "aws_instance" "db_ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.db_server_subnet_id
  security_groups             = ["${var.ec2_dbserver_sg_id}"]
  user_data                   = data.template_file.db_user_data_template.rendered
  associate_public_ip_address = false
  iam_instance_profile = aws_iam_instance_profile.ec2_ssm_iam_profile.name
  root_block_device {
    volume_type = "gp2"
    volume_size = 8
  }
  tags = {
    Name = var.ec2_dbserver_name
  }
}