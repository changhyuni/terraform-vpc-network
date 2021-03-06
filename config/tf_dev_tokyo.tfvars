#################################################################################
# Base
#################################################################################

region = "ap-northeast-1"

azs = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]

azs_nat_gateway_count = 1

#################################################################################
# Shared VPC
#################################################################################

vpc_shared = {
  name            = "# shared-vpc"
  group_id        = "shared"
  cidr            = "10.100.0.0/16"
  public_subnets  = ["10.100.32.0/20", "10.100.96.0/20", "10.100.160.0/20"]
  private_subnets = ["10.100.0.0/19", "10.100.64.0/19", "10.100.128.0/19"]
  tags = {
    "Group" = "shared"
  }
}


#################################################################################
# Dev VPC
#################################################################################

vpc_dev = {
  name            = "# dev-vpc"
  group_id        = "dev"
  cidr            = "10.101.0.0/16"
  public_subnets  = ["10.101.32.0/20", "10.101.96.0/20", "10.101.160.0/20"]
  private_subnets = ["10.101.0.0/19", "10.101.64.0/19", "10.101.128.0/19"]
  tags = {
    "Group" = "dev"
  }
}

#################################################################################
# VPN IPSec
#################################################################################

vpn_ipsec = {
  enable           = true
  name             = "aaron-house"
  static_routes    = ["192.168.0.0/16"]
  remote_device_ip = "218.39.165.105" # Aaron Router
  tags             = {}
}

#################################################################################
# Others
#################################################################################
tags = {
  "Terraform"   = true
  "Environment" = "Development"
}
