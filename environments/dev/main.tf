provider "aws" {
  region = "ap-northeast-1"
}

module "network" {
  source = "../../modules/network"

  network_identifier = var.network_identifier
  vpc_cidr           = var.vpc_cidr
  environment        = var.environment
}
