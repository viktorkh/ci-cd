output "vpc_network_name" {
    value = google_compute_network.vpc_network.name 
}


output "vpc_network_id" {
    value = google_compute_network.vpc_network.id 
}

output "vpc_subnet_name" {
    value = google_compute_subnetwork.private_subnet.name 
}

output "vpc_private_ip" {
    value = google_compute_address.private_ip
}

output "vpc_private_ip_address" {
  value = google_compute_global_address.private_ip_address
}
output "vpc_private_service_connection" {
    value = google_service_networking_connection.private_service_connection
}