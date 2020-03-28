provider "aws" {
  region              = var.aws_region
  allowed_account_ids = [var.aws_id]
  profile             = "pets"
}

data "aws_availability_zones" "az" {}

module "vpc" {
  source = "./modules/vpc"
}