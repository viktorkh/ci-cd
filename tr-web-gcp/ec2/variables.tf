variable "vpc_network_name" {
  description = "The name of the VPC network."
}

variable "vpc_subnetwork_name" {
  description = "The name of the VPC subnetwork."
}

variable "region" {
  description = "The GCP region where the resources will be created (e.g., us-central1)."
}
# Add any other variables needed for the EC2 instance configuration.
