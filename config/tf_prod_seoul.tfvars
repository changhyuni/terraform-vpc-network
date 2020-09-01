#################################################################################
# Base
#################################################################################

region = "ap-northeast-2"

azs = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]

azs_nat_gateway_count = 1

#################################################################################
# Shared VPC
#################################################################################

vpc_shared = {
  name            = "# shared-vpc"
  group_id        = "shared"
  cidr            = "10.0.0.0/16"
  public_subnets  = ["10.0.32.0/20", "10.0.96.0/20", "10.0.160.0/20"]
  private_subnets = ["10.0.0.0/19", "10.0.64.0/19", "10.0.128.0/19"]
  tags = {
    "Group" = "shared"
  }
}

#################################################################################
# Dev VPC
#################################################################################

vpc_dev = {
  name            = "# dev-vpc",
  group_id        = "dev"
  cidr            = "10.10.0.0/16",
  public_subnets  = ["10.10.32.0/20", "10.10.96.0/20", "10.10.160.0/20"]
  private_subnets = ["10.10.0.0/19", "10.10.64.0/19", "10.10.128.0/19"]
  tags = {
    "Group" = "dev"
  }
}

#################################################################################
# VPN IPSec
#################################################################################

vpn_in_shared = {
  enable           = true
  name             = "aaron-house"
  static_routes    = ["192.168.0.0/16"]
  remote_device_ip = "221.153.201.54" # Aaron's Router
  tags             = {}
}

#################################################################################
# Others
#################################################################################
tags = {
  "Terraform"   = true
  "Environment" = "Production"
}
