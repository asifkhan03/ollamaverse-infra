terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0" # required version of the aws provider
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
  vpc_cidr            = "10.10.0.0/16"
  public_subnet_cidrs = ["10.10.0.0/20", "10.10.16.0/20", "10.10.32.0/20"]
  private_subnet_cidrs = ["10.10.48.0/20", "10.10.64.0/20", "10.10.80.0/20"]
  data_subnet_cidrs    = ["10.10.96.0/20", "10.10.112.0/20", "10.10.128.0/20"]
  tags = {
    Owner = "Asif"
  }
}