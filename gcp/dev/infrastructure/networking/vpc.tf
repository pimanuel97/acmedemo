data "google_project" "project" {
  project_id = "acme-dev-network"
}

module "acme_gcp_dev_network" {
  source  = "terraform-google-modules/network/google"
  version = "~> 9.1"

  project_id   = data.google_project.project.number
  network_name = "vpc-gcp-dev"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "gcp-dev-net-private"
      subnet_ip     = "10.12.1.0/24"
      subnet_region = "asia-southeast1"
    },
    {
      subnet_name   = "gcp-dev-net-public"
      subnet_ip     = "10.12.2.0/24"
      subnet_region = "asia-southeast1"
      subnet_private_access = "true"
    },
  ]
}

resource "google_compute_shared_vpc_host_project" "host" {
  project = data.google_project.project.number
}
