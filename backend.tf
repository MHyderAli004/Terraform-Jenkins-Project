terraform {
  backend "s3" {
    bucket = "terraform-jenkins-state-ali-1147"
    key    = "terraform/terraform.tfstate"
    region = "ap-south-2"
  }
}
