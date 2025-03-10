output "name" {
  value       = google_sql_database_instance.default.name
  description = "The instance name for the master instance"
}

output "ip_address" {
  value       = google_sql_database_instance.default.ip_address
  description = "The IPv4 addresses assigned for the master instance"
}

output "private_ip_address" {
  value       = google_sql_database_instance.default.private_ip_address
  description = "The private IP address assigned for the master instance"
}

output "first_ip_address" {
  value       = google_sql_database_instance.default.first_ip_address
  description = "The first IPv4 address of the addresses assigned."
}

output "connection_name" {
  value       = google_sql_database_instance.default.connection_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "self_link" {
  value       = google_sql_database_instance.default.self_link
  description = "The URI of the master instance"
}

output "server_ca_cert" {
  value       = google_sql_database_instance.default.server_ca_cert
  description = "The CA certificate information used to connect to the SQL instance via SSL"
}

output "service_account_email_address" {
  value       = google_sql_database_instance.default.service_account_email_address
  description = "The service account email address assigned to the master instance"
}

output "generated_user_passwords" {
  value       = [for pwd in random_password.user-password : pwd.result]
  sensitive   = true
  description = "List of auto-generated passwords"
}

output "root_password" {
  value       = coalesce(var.root_password, random_password.root-password.result)
  sensitive   = true
  description = "MSSERVER password for the root user. If not set, a random one will be generated and available in the root_password output variable."
}

output "primary" {
  value       = google_sql_database_instance.default
  sensitive   = true
  description = "The `google_sql_database_instance` resource representing the primary instance"
}