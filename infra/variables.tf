variable "region" {
  type        = string
  description = "Name of the region to select"
  default     = "us-east-1"
}
variable "vpc_name" {
  type        = string
  description = "Name to be used on all the resources as identifier"
}

variable "public_subnets" {
  type        = list(string)
  description = "A list of public subnets inside the VPC"
  default     = ["10.0.0.0/18", "10.0.64.0/18"]
}

variable "private_subnets" {
  type        = list(string)
  description = "A list of private subnets inside the VPC"
  default     = ["10.0.128.0/18", "10.0.192.0/18"]
}

variable "azs" {
  type        = list(string)
  description = "A list of availability zones specified as argument to this module"
  default     = ["us-east-1a", "us-east-1b"]
}
variable "enable_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = "false"
}
variable "enable_vpn_gateway" {
  type        = bool
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC"
  default     = "false"
}

variable "one_nat_gateway_per_az" {
  type        = bool
  description = "Should be true if you want only one NAT Gateway per availability zone"
  default     = "false"
}
variable "enable_dns_hostnames" {
  type        = bool
  description = "Should be true to enable DNS hostnames in the VPC"
  default     = "true"
}
variable "enable_dns_support" {
  type        = bool
  description = "Should be true to enable DNS support in the VPC"
  default     = "true"
}
variable "vpc_tags" {
  type = map(string)
  default = {
    Terraform   = "true"
    Environment = "sample"
  }
}
variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "cluster_endpoint_private_access" {
  type        = bool
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled"
  default     = "true"
}
variable "cluster_endpoint_public_access" {
  type        = bool
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
  default     = "false"
}
variable "enable_irsa" {
  type        = bool
  description = "Determines whether to create an OpenID Connect Provider for EKS to enable IRSA"
  default     = "true"
}
variable "eks_tags" {
  type = map(string)
  default = {
    Environment = "sample"
  }
}