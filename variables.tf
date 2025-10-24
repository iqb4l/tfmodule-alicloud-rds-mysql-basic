variable "instance_name" {
  type        = string
  description = "RDS instance name"
}

variable "engine_version" {
  type        = string
  description = "MySQL engine version"
  default     = "8.0"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
}

variable "category" {
  type        = string
  description = "DB instance category (Basic, HighAvailability, AlwaysOn)"
  default     = "Basic"
}

variable "storage_type" {
  type        = string
  description = "Storage type (cloud_essd, cloud_ssd)"
  default     = "cloud_essd"
}

variable "instance_storage" {
  type        = number
  description = "Instance storage in GB"
}

variable "instance_charge_type" {
  type        = string
  description = "Instance charge type"
  default     = "Postpaid"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "vswitch_id" {
  type        = string
  description = "VSwitch ID for primary instance"
}

variable "zone_id" {
  type        = string
  description = "Primary zone ID"
}

variable "zone_id_slave_a" {
  type        = string
  description = "Secondary zone ID for high availability"
  default     = null
}

variable "create_security_group" {
  type        = bool
  description = "Whether to create a security group"
  default     = true
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs (used if not creating new)"
  default     = []
}

variable "security_group_rules" {
  type = list(object({
    type        = string
    cidr_ip     = string
    port_range  = optional(string)
    ip_protocol = optional(string)
    nic_type    = optional(string)
    policy      = optional(string)
    priority    = optional(number)
    description = optional(string)
  }))
  description = "Security group rules"
  default     = []
}

variable "ip_whitelist" {
  type        = list(string)
  description = "IP whitelist for RDS access"
  default     = []
}

variable "backup_period" {
  type        = list(string)
  description = "Backup period days"
  default     = ["Monday", "Wednesday", "Friday"]
}

variable "backup_time" {
  type        = string
  description = "Backup time window"
  default     = "02:00Z-03:00Z"
}

variable "backup_retention_period" {
  type        = number
  description = "Backup retention period in days"
  default     = 7
}

variable "log_backup_retention_period" {
  type        = number
  description = "Log backup retention period in days"
  default     = 7
}

variable "maintain_time" {
  type        = string
  description = "Maintenance window"
  default     = "03:00Z-04:00Z"
}

variable "high_availability" {
  type        = string
  description = "High availability mode"
  default     = "Auto"
}

variable "readonly_instance_count" {
  type        = number
  description = "Number of read-only instances"
  default     = 0
}

variable "ro_instance_type" {
  type        = string
  description = "Read-only instance type"
  default     = null
}

variable "ro_instance_storage" {
  type        = number
  description = "Read-only instance storage"
  default     = null
}

variable "ro_zone_ids" {
  type        = list(string)
  description = "Zone IDs for read-only instances"
  default     = []
}

variable "ro_vswitch_ids" {
  type        = string
  description = "VSwitch IDs for read-only instances"
  default     = null
}

variable "enable_proxy" {
  type        = bool
  description = "Whether to enable RDS proxy"
  default     = false
}

variable "proxy_vswitch_id" {
  type        = string
  description = "VSwitch ID for proxy"
  default     = null
}

variable "proxy_instance_num" {
  type        = number
  description = "Number of proxy instances"
  default     = 2
}

variable "proxy_connection_prefix" {
  type        = string
  description = "Proxy connection prefix"
  default     = ""
}

variable "proxy_port" {
  type        = number
  description = "Proxy port"
  default     = 3306
}

variable "proxy_read_write_mode" {
  type        = string
  description = "Proxy read/write mode"
  default     = "ReadWrite"
}

variable "proxy_max_delay_time" {
  type        = number
  description = "Maximum delay time for read-only instances"
  default     = 30
}

variable "proxy_features" {
  type        = string
  description = "Proxy features"
  default     = "TransactionReadSqlRouteOptimizeStatus:1;ConnectionPersist:1;ReadWriteSpliting:1"
}

variable "proxy_distribution_type" {
  type        = string
  description = "Read-only instance distribution type"
  default     = "Standard"
}

variable "proxy_primary_weight" {
  type        = number
  description = "Weight for primary instance in proxy"
  default     = 100
}

variable "proxy_ro_weight" {
  type        = number
  description = "Weight for read-only instances in proxy"
  default     = 100
}

variable "databases" {
  type        = list(string)
  description = "List of databases to create"
  default     = []
}

variable "character_set" {
  type        = string
  description = "Character set for databases"
  default     = "utf8mb4"
}

variable "enable_public_connection" {
  type        = bool
  description = "Whether to enable public connection"
  default     = false
}

variable "public_connection_prefix" {
  type        = string
  description = "Public connection prefix"
  default     = ""
}

variable "public_connection_port" {
  type        = string
  description = "Public connection port"
  default     = "3306"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the RDS instance"
  default     = {}
}

variable "type" {
  description = "Privilege type of account. Normal: Common privilege. Super: High privilege.Default to Normal."
  type        = string
  default     = "Super"
}

variable "privilege" {
  description = "The privilege of one account access database."
  type        = string
  default     = "ReadWrite"
}

variable "create_account" {
  description = "Whether to create a new account. If true, the `account_name` should not be empty."
  type        = bool
  default     = true
}

variable "create_database" {
  description = "Whether to create multiple databases. If true, the `databases` should not be empty."
  type        = bool
  default     = true
}

variable "account_name" {
  description = "Name of a new database account. It should be set when create_account = true."
  type        = string
  default     = ""
}