module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = local.cluster_name
  cluster_version = "1.27"

  cluster_endpoint_private_access = local.cluster_endpoint_private_access
  cluster_endpoint_public_access  = local.cluster_endpoint_public_access

  vpc_id     = local.vpc_id
  subnet_ids = local.subnet_ids

  enable_irsa = local.enable_irsa

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

   cluster_security_group_additional_rules = {
    ingress_nodes_ephemeral_ports_tcp = {
      description                = "Nodes on ephemeral ports"
      protocol                   = "tcp"
      from_port                  = 1025
      to_port                    = 65535
      type                       = "ingress"
      source_node_security_group = true
    }
  }
  node_security_group_additional_rules = {
    ingress_self_all = {
      description = "Node to node all ports/protocols"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      self        = true
    }
    ingress_alb = {
    description = "ALB Access"
    protocol    = "tcp"
    from_port   = 30957
    to_port     = 30957
    type        = "ingress"
    source_security_group_id = aws_security_group.alb.id
    }
    egress_self_all = {
      description = "Node to node all ports/protocols"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "egress"
      self        = true
    }
  }

  eks_managed_node_group_defaults = {
    disk_size = 30
  }

  eks_managed_node_groups = {
    general = {
      desired_size = 3
      min_size     = 3
      max_size     = 3

      labels = {
        role = "general"
      }

      instance_types = ["t3.micro"]
      capacity_type  = "ON_DEMAND"
    }
  }

  tags = local.eks_tags
}