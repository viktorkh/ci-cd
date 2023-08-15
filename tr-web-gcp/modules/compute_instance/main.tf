resource "google_compute_instance" "vm" {
  name         = "my-vm"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network    = var.vpc_network_name
    subnetwork = var.vpc_subnet_name
    # access_config {
    #   // No external IP address is assigned to the VM.

    # }
  }
  zone = var.zone
}
