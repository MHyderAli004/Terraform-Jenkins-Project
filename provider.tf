variable "Terraform-Jenkins" {
  type    = string
  default = "ap-south-2"
}

provider "aws" {
  region = var.Terraform-Jenkins
}
