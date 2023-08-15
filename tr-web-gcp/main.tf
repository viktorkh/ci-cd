provider "google" {
  #credentials = file("path/to/your/gcp_credentials.json")
  project = var.project_id
  #"ccoe-dev-qa01"
  region = var.region
}


module "vpc" {
  source = "./modules/vpc"
  region = var.region
}

module "compute_instance" {
  source = "./modules/compute_instance"
  #region              = var.region
  vpc_network_name = module.vpc.vpc_network_name
  vpc_network_id   = module.vpc.vpc_network_id
  vpc_subnet_name  = module.vpc.vpc_subnet_name
  zone             = var.zone
}

module "sql_database" {
  source           = "./modules/sql_database"
  region           = var.region
  vpc_network_id   = module.vpc.vpc_network_id
  vpc_network_name = module.vpc.vpc_network_name
  depends_on       = [module.vpc.vpc_private_ip, module.vpc.vpc_private_ip_address, module.vpc.vpc_private_service_connection]
}



