variable "instance_group_members" {
  description = "A list of instance self-links to include in the target pool."
  type        = list(string)
}

variable "region" {
  description = "The GCP region where the resources will be created (e.g., us-central1)."
  default     = "me-west1"
}