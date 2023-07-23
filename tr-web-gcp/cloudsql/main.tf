resource "google_sql_database_instance" "db_instance" {
  name             = "web-app-db-instance"
  database_version = "MYSQL_5_7"
  region           = var.region
  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "db" {
  name     = "web-app-db"
  instance = google_sql_database_instance.db_instance.name
}

output "connection_name" {
  description = "The Cloud SQL connection name."
  value       = google_sql_database_instance.db_instance.connection_name
}
