locals {
  tags = merge({
      provisioned-by        = "terraform"
      Workspace             = lower(terraform.workspace)
      class-of-business     = var.class-of-business
      application-name      = var.application-name
      business-impact       = var.business-impact
      operating-environment = var.operating-environment
      support-group         = var.support-group
      cost-center           = var.cost-center
      security-zone         = var.security-zone
      data-classification   = var.data-classification
  })
  
  host_name = var.host_name
}
