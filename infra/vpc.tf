module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = local.vpc_name
  cidr = "10.0.0.0/16"

  azs             = local.azs
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets

  enable_nat_gateway     = local.enable_nat_gateway
  enable_vpn_gateway     = local.enable_vpn_gateway
  one_nat_gateway_per_az = local.one_nat_gateway_per_az

  enable_dns_hostnames = local.enable_dns_hostnames
  enable_dns_support   = local.enable_dns_support

  tags = local.vpc_tags
  public_subnet_tags = {
    Name                                        = "Public Subnets"
    "kubernetes.io/role/elb"                    = 1
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }
  private_subnet_tags = {
    Name                                        = "private-subnets"
    "kubernetes.io/role/internal-elb"           = 1
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }
}
