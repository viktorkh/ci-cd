terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "rds" {
  source = "./modules/rds"
}

module "alb" {
  source = "./modules/alb"
}

module "ec2" {
  source = "./modules/ec2"
  alb_target_group_arn = module.alb.target_group_arn
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "rds_instance_id" {
  value = module.rds.rds_instance_id
}
