resource "alicloud_resource_manager_resource_group" "aliyun_dev_infrastructure" {
  resource_group_name = "aliyun-dev-infrastructure"
  display_name        = "aliyun-dev-infrastructure"
}

resource "alicloud_resource_manager_resource_group" "aliyun_dev_tribe_a" {
  resource_group_name = "aliyun-dev-tribe-a"
  display_name        = "aliyun-dev-tribe-a"
}

resource "alicloud_resource_manager_resource_group" "aliyun_dev_tribe_b" {
  resource_group_name = "aliyun-dev-tribe-b"
  display_name        = "aliyun-dev-tribe-b"
}

