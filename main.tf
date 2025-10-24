# IP Whitelist Template
resource "alicloud_rds_whitelist_template" "whitelist" {
  count         = length(var.ip_whitelist) > 0 ? 1 : 0
  ip_white_list = join(",", var.ip_whitelist)
  template_name = "${var.instance_name}-whitelist"
}

# RDS Primary Instance
resource "alicloud_db_instance" "rds" {
  instance_name            = var.instance_name
  engine                   = "MySQL"
  engine_version           = var.engine_version
  instance_type            = var.instance_type
  category                 = var.category
  db_instance_storage_type = var.storage_type
  instance_storage         = var.instance_storage
  instance_charge_type     = var.instance_charge_type
  
  # Network configuration
  vswitch_id      = var.vswitch_id
  zone_id         = var.zone_id
  #zone_id_slave_a = var.zone_id_slave_a
  
  # Security configuration
  template_id_list   = length(var.ip_whitelist) > 0 ? [alicloud_rds_whitelist_template.whitelist[0].id] : []

  # Maintenance window
  maintain_time = var.maintain_time
  
}

# Public connection
resource "alicloud_db_connection" "public" {
  count             = var.enable_public_connection ? 1 : 0
  instance_id       = alicloud_db_instance.rds.id
  connection_prefix = var.public_connection_prefix
  port              = var.public_connection_port
}