variable "aws_region" {
  description = "AWS region"
  type        = string  # means this variable will only accept text values (like "ap-south-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string) #this variable is a list of text values (many strings inside [ ]).
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  type        = list(string)
}

variable "data_subnet_cidrs" {
  description = "Data subnet CIDRs"
  type        = list(string)
}

variable "environment" {
  description = "Environment (dev/prod)"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string) #it’s a map (like a dictionary or object) with string keys and values.
  default     = {} #If you don’t give any tags, it will be empty — and Terraform won’t fail.
}
