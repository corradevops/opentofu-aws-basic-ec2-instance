data "aws_availability_zones" "available" {}

locals {
  name     = "${var.project}-${var.environment}-${basename(path.cwd)}"
  region   = var.aws-region
  profile  = var.aws-profile
  userdata = var.user-data

  tags = {
    Name        = "${var.project}-${var.environment}-${basename(path.cwd)}"
    Created-by  = var.createdby
    Initiator   = var.initiator
    Account     = var.project
    Contact     = var.initiator
    Environment = "${var.project}-${var.environment}"
    Task        = var.task
  }
}

data "template_file" "user_data" {
  template = file(local.userdata)
}

module "ec2instance" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  name                        = local.name
  ami                         = var.ami-image
  key_name                    = var.key-name
  instance_type               = var.instance-type
  subnet_id                   = var.subnet
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data.rendered
  user_data_replace_on_change = true
  enable_volume_tags          = false
  root_block_device = [
    {
      encrypted   = false
      volume_type = "gp3"
      throughput  = 200
      volume_size = var.root_volume_size
      tags = {
        Name = var.root_volume_name
      }
    },
  ]
  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp3"
      volume_size = var.ebs_volume_size
      throughput  = 200
      encrypted   = false
      tags = {
        MountPoint = var.ebs_mount_point
      }
    }
  ]
  tags = local.tags
}
