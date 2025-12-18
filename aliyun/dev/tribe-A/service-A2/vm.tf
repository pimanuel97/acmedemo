variable "name" {
  default = "acme-dev-service-A2"
}

variable "instance_type" {
  default = "ecs.n4.small"
}

variable "image_id" {
  default = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
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
  availability_zone = data.alicloud_zones.zone_avail.zones.0.id
  security_groups   = [ "sg-t4n08sv86fk9pia0sjys" ]

  # series III
  instance_type              = var.instance_type
  system_disk_category       = "cloud_efficiency"
  system_disk_name           = var.name
  system_disk_description    = "System Disk"
  image_id                   = var.image_id
  instance_name              = var.name
  vswitch_id                 = "vsw-t4nbb3nwn5980sgzts8b7"
  internet_max_bandwidth_out = 10
}
