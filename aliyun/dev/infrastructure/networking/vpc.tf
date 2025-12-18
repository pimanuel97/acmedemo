resource "alicloud_vpc" "acme_dev_network" {
  description = "ACME Dev Network"
  cidr_block  = "10.11.0.0/16"
  vpc_name    = "acme_dev_network"
  enable_ipv6 = true
}
