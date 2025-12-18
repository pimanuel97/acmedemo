data "alicloud_zones" "acme_zone_avail" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vswitch" "acme_aliyun_dev_net_private" {
  vswitch_name = "aliyun-dev-net-private"
  cidr_block   = "10.11.1.0/24"
  vpc_id       = alicloud_vpc.acme_dev_network.id
  zone_id      = data.alicloud_zones.acme_zone_avail.zones.0.id
}

resource "alicloud_vswitch" "acme_aliyun_dev_net_public" {
  vswitch_name = "aliyun-dev-net-private"
  cidr_block   = "10.11.2.0/24"
  vpc_id       = alicloud_vpc.acme_dev_network.id
  zone_id      = data.alicloud_zones.acme_zone_avail.zones.0.id
}
