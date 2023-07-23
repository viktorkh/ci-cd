resource "google_compute_instance" "web_server" {
  name         = "web-server-instance"
  machine_type = "n1-standard-1"
  zone         = var.region
  tags         = ["web-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = var.vpc_network_name
    subnetwork = var.vpc_subnetwork_name
  }

  # Add any other configuration needed for the EC2 instance.
}

output "instance_self_link" {
  description = "The self-link of the EC2 instance."
  value       = google_compute_instance.web_server.self_link
}

output "instance_ip" {
  description = "The public IP address of the EC2 instance."
  value       = google_compute_instance.web_server.network_interface[0].network_ip
}
# output "instance_private_ip" {
#   description = "The private/internal IP address of the EC2 instance."
#   value       = google_compute_instance.web_server.network_interface[0].network_ip
# }


# Add any other resources and configurations specific to the EC2 module.
