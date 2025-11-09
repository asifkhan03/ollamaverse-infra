terraform {
  backend "s3" {
    bucket         = "terraform-state-asif-demo"
    key            = "environments/dev/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

