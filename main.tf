module "vpc" {
  source = "./modules/vpc"

  My-VPC-04-11       = var.My-VPC-04-11
  My-VPC-04-11-cidr  = var.My-VPC-04-11-cidr
  My-vpc-subnet-cidr = var.My-vpc-subnet-cidr
}
