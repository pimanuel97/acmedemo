resource "google_project" "acme_dev_network_project" {
  name            = "Acme Dev Network"
  project_id      = "acme-dev-network"
  billing_account = var.gcp-billing-acc-id
}
