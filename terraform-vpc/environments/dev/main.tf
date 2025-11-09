terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  
}

module "vpc" {
  source              = "../../modules/vpc"
  environment         = "dev"
  project             = "ollamaverse"
  aws_region          = "ap-south-1"
  vpc_cidr            = "10.10.0.0/16"
  public_subnet_cidrs = ["10.10.0.0/20", "10.10.16.0/20", "10.10.32.0/20"]
  private_subnet_cidrs = ["10.10.48.0/20", "10.10.64.0/20", "10.10.80.0/20"]
  data_subnet_cidrs    = ["10.10.96.0/20", "10.10.112.0/20", "10.10.128.0/20"]
  tags = {
    Owner = "Asif"
  }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "data_subnet_ids" {
  value = module.vpc.data_subnet_ids
}
