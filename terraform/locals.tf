locals {
  vpc_cidr        = lookup(var.environment_cidrs, var.environment)
  public_subnets  = [cidrsubnet(local.vpc_cidr, 8, 1), cidrsubnet(local.vpc_cidr, 8, 2)]
  private_subnets = [cidrsubnet(local.vpc_cidr, 8, 3), cidrsubnet(local.vpc_cidr, 8, 4)]
}
