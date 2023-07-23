output "db_connection_name" {
  description = "The Cloud SQL connection name."
  value       = module.cloudsql.connection_name
}
