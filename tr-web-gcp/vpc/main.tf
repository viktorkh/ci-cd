resource "google_compute_network" "vpc_network" {
  name                    = "web-app-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  name          = "web-app-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.self_link
}

output "vpc_network_name" {
  description = "The name of the VPC network."
  value       = google_compute_network.vpc_network.name
}

output "vpc_subnetwork_name" {
  description = "The name of the VPC subnetwork."
  value       = google_compute_subnetwork.vpc_subnetwork.name
}
