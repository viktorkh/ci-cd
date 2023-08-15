 
resource "google_sql_database_instance" "instance" {
  name             = "private-ip-sql-instance"
  region           = var.region
  database_version = "MYSQL_8_0"

 # depends_on = [module.vpc.google_service_networking_connection]
  #[google_service_networking_connection.private_service_connection]

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = "false"
      private_network = var.vpc_network_id
    }
  }
  # set `deletion_protection` to true, will ensure that one cannot accidentally delete this instance by
  # use of Terraform whereas `deletion_protection_enabled` flag protects this instance at the GCP level.
  deletion_protection = false
}