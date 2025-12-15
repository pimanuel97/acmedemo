resource "google_project" "non_prod_network_prj" {
  name            = "Acme Non-Production Network"
  project_id      = "acme-non-prod-network"
#  billing_account = var.gcp-billing-acc-id
}
