resource "google_project" "host_project" {
  name            = "Acme Non-Production Network"
  project_id      = "acme-non-prod-network"
  billing_account = var.gcp-billing-acc-id
}
