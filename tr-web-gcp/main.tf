provider "google" {
  #credentials = file("<path_to_gcp_credentials_file>")
  project     = "<your_gcp_project_id>"
  region      = "me-west11"
}

module "vpc" {
  source = "./vpc"
}

module "ec2" {
  source              = "./ec2"
  vpc_network_name    = module.vpc.vpc_network_name
  vpc_subnetwork_name = module.vpc.vpc_subnetwork_name
  region              = "me-west1"
}

module "cloudsql" {
  source = "./cloudsql"
}

module "lb" {
  source = "./lb"

  instance_group_members = [module.ec2.instance_self_link]
  region                 = "me-west1"
}

output "instance_ip" {
  description = "The public IP address of the EC2 instance."
  value       = module.ec2.instance_ip
}