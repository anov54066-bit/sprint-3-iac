module "web" {
  source = "./modules/web"

  vm_spec        = var.vm_specification["web"]
  ssh_public_key = var.ssh_public_key
  ssh_username   = var.ssh_username
  subnet_name    = var.subnet_name
  platform_id    = var.platform_id
}

module "api" {
  source = "./modules/api"

  vm_spec          = var.vm_specification["api"]
  ssh_public_key   = var.ssh_public_key
  ssh_username     = var.ssh_username
  subnet_name      = var.subnet_name
  platform_id      = var.platform_id
  extra_disk_names = var.extra_disk_names
  extra_disk_type  = var.extra_disk_type
  extra_disk_size  = var.extra_disk_size
}