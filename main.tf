terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.52"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "qa_automation_vpc"
  cidr = "10.195.0.0/19"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.195.12.0/22", "10.195.16.0/22", "10.195.20.0/22","10.195.24.0/22","10.195.28.0/22"]
  public_subnets  = ["10.195.4.0/23", "10.195.6.0/23", "10.195.8.0/23"]

  enable_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "qa"
  }
}

output "nat_ip_addresss" {
  description = "The IP's associated with the NAT Gateways created by this module"
  value = module.vpc.nat_public_ips
}