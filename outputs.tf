output "instance_id" {
  value = alicloud_db_instance.rds.id
}

output "connection_string" {
  value = alicloud_db_instance.rds.connection_string
}

output "port" {
  value = alicloud_db_instance.rds.port
}

output "public_connection_string" {
  value = var.enable_public_connection ? alicloud_db_connection.public[0].connection_string : null
}