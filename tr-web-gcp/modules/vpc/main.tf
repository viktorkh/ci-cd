

resource "google_compute_network" "vpc_network" {
  name                    = "private-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = "private-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.self_link
}


resource "google_compute_global_address" "private_ip_address" {
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc_network.id
}



resource "google_compute_address" "private_ip" {
  name   = "private-instance-ip"
  region = var.region
}

resource "google_service_networking_connection" "private_service_connection" {
  network                 = google_compute_network.vpc_network.name
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}




resource "google_compute_network_peering_routes_config" "peering_routes" {
  peering              = google_service_networking_connection.private_service_connection.peering
  network              = google_compute_network.vpc_network.name
  import_custom_routes = true
  export_custom_routes = true
}

 