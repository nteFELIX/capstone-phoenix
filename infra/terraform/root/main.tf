module "network" {
  source       = "../modules/network"
  project_name = var.project_name
  region       = var.avail_zone
}

module "security_group" {
  source       = "../modules/security_group"
  project_name = var.project_name
  my_ip        = var.my_ip
  vpc_id       = module.network.vpc_id
}

module "compute" {
  source             = "../modules/compute"
  project_name       = var.project_name
  region             = var.avail_zone
  instance_type      = var.instance_type
  ami_id             = var.ami_id
  key_name           = var.key_name
  worker_count       = var.worker_count
  subnet_id          = module.network.subnet_id
  security_group_id  = module.security_group.security_group_id
}