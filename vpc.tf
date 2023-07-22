module "vpc" {
  source = "./modules/vpc"
  cidr-range = var.cidr-range
  vpc-name = var.vpc-name
  public-cidr = var.public-cidr
  private-cidr = var.private-cidr
  az = var.az
  igw-name = var.igw-name
  igw_cidr = var.igw_cidr
  sg-name = var.sg-name
  rt-name = var.rt-name
  in = var.in
}