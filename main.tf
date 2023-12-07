#Instance deployment
module "ec2-Instance" {
  source                          = "app.terraform.io/Motiva-ServiceNow/ec2-Instance/aws"
  version                         = "1.0.7"
  ami                             = var.golden_image_AMI_id
  instance_type                   = var.instance_type
  key_name                        = var.key_name
  vpc_security_group_ids          = [data.aws_security_group.windows_sg.id]
  cpu_credits                     = "unlimited"
  associate_public_ip_address     = false
  subnet_id                       = var.subnet_id
  enable_volume_tags              = var.enable_volume_tags
  # DOMAIN AUTO_JOIN!! the machine should join the domain by using tags
  iam_instance_profile            = var.iam_instance_profile 
  tags = merge({"windows_ad_join" = "${var.windows_ad_join}",
                "os_platform"     = "Windows",
                "ad_name"         = var.ad_name,
                "Patch_Group"     = var.patch_group,
                "backup_schedule" = var.backupplan,
                "Name"            = "${var.is_non_standard_vm ? var.non_standard_host_name : local.host_name}",
                "host_name"       = "${var.is_non_standard_vm ? var.non_standard_host_name : local.host_name}"
              }, local.tags)

  volume_tags                     = merge({"Name": "${var.is_non_standard_vm ? var.non_standard_host_name : local.host_name}-data-disk"}, local.tags)
  root_block_device               = [{
    volume_size                   = var.root_volume_size
    volume_type                   = var.root_volume_type
    iops                          = var.root_iops
    throughput                    = var.root_throughput
    delete_on_termination         = true
  }]
  ebs_block_device                = var.ebs_block_device
}
