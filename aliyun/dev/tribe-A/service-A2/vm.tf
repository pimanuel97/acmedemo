variable "name" {
  default = "acme-dev-service-A2"
}

variable "instance_type" {
  default = "ecs.n4.small"
}

variable "image_id" {
  default = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
}

data "alicloud_vpcs" "vpc" {
  cidr_block = "10.11.0.0/16"
  status     = "Available"
}

# Create a new ECS instance for a VPC
resource "alicloud_security_group" "group" {
  security_group_name = var.name
  description         = "acme-service-A2-access"
  vpc_id              = alicloud_vpc.vpc.id
}

data "alicloud_zones" "zone_avail" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
  available_instance_type     = var.instance_type
}


data "alicloud_vswitches" "vswitch" {
  name_regex = "aliyun-dev-net-public"
}

resource "alicloud_instance" "service_A2_vm1" {
  availability_zone = data.alicloud_zones.default.zones.0.id
  security_groups   = alicloud_security_group.group.*.id

  # series III
  instance_type              = var.instance_type
  system_disk_category       = "cloud_efficiency"
  system_disk_name           = var.name
  system_disk_description    = "System Disk"
  image_id                   = var.image_id
  instance_name              = var.name
  vswitch_id                 = alicloud_vswitches.0.vswitch.id
  internet_max_bandwidth_out = 10
}
