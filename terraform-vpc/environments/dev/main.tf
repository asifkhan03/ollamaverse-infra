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
