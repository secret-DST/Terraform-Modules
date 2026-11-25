terraform {
  required_version = "~> 1.15.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

module "example" {
  source        = "./module-1"
  ami           = var.ami
  instance_type = var.instance_type
}

module "example2" {
  source        = "./module-2"
  ami           = var.ami
  instance_type = var.instance_type
}


