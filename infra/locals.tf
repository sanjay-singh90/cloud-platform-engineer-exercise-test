locals {
  cluster_name                  = var.cluster_name
  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access
  vpc_id                        = module.vpc.vpc_id
  subnet_ids                    = module.vpc.private_subnets
  enable_irsa                   = var.enable_irsa
  eks_tags                      = var.eks_tags
  vpc_name                      = var.vpc_name
  azs                           = var.azs
  private_subnets               = var.private_subnets
  public_subnets                = var.public_subnets
  enable_nat_gateway            = var.enable_nat_gateway
  enable_vpn_gateway            = var.enable_vpn_gateway
  one_nat_gateway_per_az        = var.one_nat_gateway_per_az
  enable_dns_hostnames          = var.enable_dns_hostnames
  enable_dns_support            = var.enable_dns_support
  vpc_tags                      = var.vpc_tags
}
