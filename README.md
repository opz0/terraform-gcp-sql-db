# Terraform-google-mssql
# Terraform Google Cloud Mssql Module
## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#examples)
- [License](#license)
- [Author](#author)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Introduction
This project deploys a Google Cloud infrastructure using Terraform to create Mssql .
## Usage
To use this module, you should have Terraform installed and configured for GCP. This module provides the necessary Terraform configuration for creating GCP resources, and you can customize the inputs as needed. Below is an example of how to use this module:

# Example: mssql

```hcl
   module "mssql" {
    source                  = "cypik/mssql/google"
    version                 = "1.0.2"
    name                    = "app"
    user_name               = "mssql"
    db_name                 = "testdb"
    environment             = "test"
    user_password           = "foobar"
    random_instance_name    = true
    deletion_protection     = false
    sql_server_audit_config = var.sql_server_audit_config
}
```
This example demonstrates how to create various GCP resources using the provided modules. Adjust the input values to suit your specific requirements.

## Examples
For detailed examples on how to use this module, please refer to the [Examples](https://github.com/cypik/terraform-google-mssql/tree/master/example) directory within this repository.

## Author
Your Name Replace **MIT** and **Cypik** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the **MIT** License - see the [LICENSE](https://github.com/cypik/terraform-google-mssql/blob/master/LICENSE) file for details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.9.5 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >=6.1.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.2.3 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >=6.1.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.3 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.6.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | cypik/labels/google | 1.0.2 |

## Resources

| Name | Type |
|------|------|
| [google_sql_database.additional_databases](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.additional_users](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [google_sql_user.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [null_resource.module_depends_on](https://registry.terraform.io/providers/hashicorp/null/3.2.3/docs/resources/resource) | resource |
| [random_id.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_password.additional_passwords](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_password.root-password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_password.user-password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activation_policy"></a> [activation\_policy](#input\_activation\_policy) | The activation policy for the master instance.Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`. | `string` | `"ALWAYS"` | no |
| <a name="input_active_directory_config"></a> [active\_directory\_config](#input\_active\_directory\_config) | Active domain that the SQL instance will join. | `map(string)` | `{}` | no |
| <a name="input_additional_databases"></a> [additional\_databases](#input\_additional\_databases) | A list of databases to be created in your cluster | <pre>list(object({<br>    name      = string<br>    charset   = string<br>    collation = string<br>  }))</pre> | `[]` | no |
| <a name="input_additional_users"></a> [additional\_users](#input\_additional\_users) | A list of users to be created in your cluster. A random password would be set for the user if the `random_password` variable is set. | <pre>list(object({<br>    name            = string<br>    password        = string<br>    random_password = bool<br>  }))</pre> | `[]` | no |
| <a name="input_availability_type"></a> [availability\_type](#input\_availability\_type) | The availability type for the master instance.This is only used to set up high availability for the MSSQL instance. Can be either `ZONAL` or `REGIONAL`. | `string` | `"ZONAL"` | no |
| <a name="input_backup_configuration"></a> [backup\_configuration](#input\_backup\_configuration) | The database backup configuration. | <pre>object({<br>    binary_log_enabled             = bool<br>    enabled                        = bool<br>    point_in_time_recovery_enabled = bool<br>    start_time                     = string<br>    transaction_log_retention_days = string<br>    retained_backups               = number<br>    retention_unit                 = string<br>  })</pre> | <pre>{<br>  "binary_log_enabled": null,<br>  "enabled": true,<br>  "point_in_time_recovery_enabled": null,<br>  "retained_backups": null,<br>  "retention_unit": null,<br>  "start_time": null,<br>  "transaction_log_retention_days": null<br>}</pre> | no |
| <a name="input_connector_enforcement"></a> [connector\_enforcement](#input\_connector\_enforcement) | Enforce that clients use the connector library | `bool` | `false` | no |
| <a name="input_create_timeout"></a> [create\_timeout](#input\_create\_timeout) | The optional timeout that is applied to limit long database creates. | `string` | `"30m"` | no |
| <a name="input_data_cache_enabled"></a> [data\_cache\_enabled](#input\_data\_cache\_enabled) | Whether data cache is enabled for the instance. Defaults to false. Feature is only available for ENTERPRISE\_PLUS tier and supported database\_versions | `bool` | `false` | no |
| <a name="input_database_flags"></a> [database\_flags](#input\_database\_flags) | The database flags for the master instance. See [more details](https://cloud.google.com/sql/docs/sqlserver/flags) | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | The database version to use: SQLSERVER\_2017\_STANDARD, SQLSERVER\_2017\_ENTERPRISE, SQLSERVER\_2017\_EXPRESS, or SQLSERVER\_2017\_WEB | `string` | `"SQLSERVER_2017_STANDARD"` | no |
| <a name="input_db_charset"></a> [db\_charset](#input\_db\_charset) | The charset for the default database | `string` | `""` | no |
| <a name="input_db_collation"></a> [db\_collation](#input\_db\_collation) | The collation for the default database. Example: 'en\_US.UTF8' | `string` | `""` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the database to be created. | `string` | `""` | no |
| <a name="input_delete_timeout"></a> [delete\_timeout](#input\_delete\_timeout) | The optional timeout that is applied to limit long database deletes. | `string` | `"30m"` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Used to block Terraform from deleting a SQL Instance. | `bool` | `true` | no |
| <a name="input_deletion_protection_enabled"></a> [deletion\_protection\_enabled](#input\_deletion\_protection\_enabled) | Enables protection of an instance from accidental deletion protection across all surfaces (API, gcloud, Cloud Console and Terraform). | `bool` | `false` | no |
| <a name="input_deny_maintenance_period"></a> [deny\_maintenance\_period](#input\_deny\_maintenance\_period) | The Deny Maintenance Period fields to prevent automatic maintenance from occurring during a 90-day time period. See [more details](https://cloud.google.com/sql/docs/sqlserver/maintenance) | <pre>list(object({<br>    end_date   = string<br>    start_date = string<br>    time       = string<br>  }))</pre> | `[]` | no |
| <a name="input_disk_autoresize"></a> [disk\_autoresize](#input\_disk\_autoresize) | Configuration to increase storage size. | `bool` | `true` | no |
| <a name="input_disk_autoresize_limit"></a> [disk\_autoresize\_limit](#input\_disk\_autoresize\_limit) | The maximum size to which storage can be auto increased. | `number` | `0` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | The disk size for the master instance. | `number` | `10` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | The disk type for the master instance. | `string` | `"PD_SSD"` | no |
| <a name="input_edition"></a> [edition](#input\_edition) | The edition of the instance, can be ENTERPRISE or ENTERPRISE\_PLUS. | `string` | `null` | no |
| <a name="input_enable_default_db"></a> [enable\_default\_db](#input\_enable\_default\_db) | Enable or disable the creation of the default database | `bool` | `true` | no |
| <a name="input_enable_default_user"></a> [enable\_default\_user](#input\_enable\_default\_user) | Enable or disable the creation of the default user | `bool` | `true` | no |
| <a name="input_encryption_key_name"></a> [encryption\_key\_name](#input\_encryption\_key\_name) | The full path to the encryption key used for the CMEK disk encryption | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Additional tags for the resource. | `map(string)` | `{}` | no |
| <a name="input_follow_gae_application"></a> [follow\_gae\_application](#input\_follow\_gae\_application) | A Google App Engine application whose zone to remain in. Must be in the same region as this instance. | `string` | `null` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of the instance. The supported values are SQL\_INSTANCE\_TYPE\_UNSPECIFIED, CLOUD\_SQL\_INSTANCE, ON\_PREMISES\_INSTANCE and READ\_REPLICA\_INSTANCE. Set to READ\_REPLICA\_INSTANCE when primary\_instance\_name is provided | `string` | `"CLOUD_SQL_INSTANCE"` | no |
| <a name="input_ip_configuration"></a> [ip\_configuration](#input\_ip\_configuration) | The ip configuration for the Cloud SQL instances. | <pre>object({<br>    authorized_networks = optional(list(map(string)), [])<br>    ipv4_enabled        = optional(bool)<br>    private_network     = optional(string)<br>    allocated_ip_range  = optional(string)<br>    ssl_mode            = optional(string)<br>  })</pre> | <pre>{<br>  "allocated_ip_range": null,<br>  "authorized_networks": [],<br>  "ipv4_enabled": true,<br>  "private_network": null,<br>  "ssl_mode": null<br>}</pre> | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_maintenance_window_day"></a> [maintenance\_window\_day](#input\_maintenance\_window\_day) | The day of week (1-7) for the master instance maintenance. | `number` | `1` | no |
| <a name="input_maintenance_window_hour"></a> [maintenance\_window\_hour](#input\_maintenance\_window\_hour) | The hour of day (0-23) maintenance window for the master instance maintenance. | `number` | `23` | no |
| <a name="input_maintenance_window_update_track"></a> [maintenance\_window\_update\_track](#input\_maintenance\_window\_update\_track) | The update track of maintenance window for the master instance maintenance.Can be either `canary` or `stable`. | `string` | `"canary"` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'info@cypik.com'. | `string` | `"info@cypik.com"` | no |
| <a name="input_master_instance_name"></a> [master\_instance\_name](#input\_master\_instance\_name) | Name of the master instance if this is a failover replica. Required for creating failover replica instance. Not needed for master instance. When removed, next terraform apply will promote this failover failover replica instance as master instance | `string` | `null` | no |
| <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on) | List of modules or resources this module depends on. | `list(any)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the resource. Provided by the client when the resource is created. | `string` | `"test"` | no |
| <a name="input_pricing_plan"></a> [pricing\_plan](#input\_pricing\_plan) | The pricing plan for the master instance. | `string` | `"PER_USE"` | no |
| <a name="input_random_instance_name"></a> [random\_instance\_name](#input\_random\_instance\_name) | Sets random suffix at the end of the Cloud SQL resource name | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | The region of the Cloud SQL resources | `string` | `"us-central1"` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `"https://github.com/cypik/terraform-google-mssql"` | no |
| <a name="input_root_password"></a> [root\_password](#input\_root\_password) | MSSERVER password for the root user. If not set, a random one will be generated and available in the root\_password output variable. | `string` | `""` | no |
| <a name="input_secondary_zone"></a> [secondary\_zone](#input\_secondary\_zone) | The preferred zone for the secondary/failover instance, it should be something like: `us-central1-a`, `us-east1-c`. | `string` | `null` | no |
| <a name="input_sql_server_audit_config"></a> [sql\_server\_audit\_config](#input\_sql\_server\_audit\_config) | SQL server audit config settings. | `map(string)` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | The tier for the master instance. | `string` | `"db-custom-2-3840"` | no |
| <a name="input_time_zone"></a> [time\_zone](#input\_time\_zone) | The time zone for SQL instance. | `string` | `null` | no |
| <a name="input_update_timeout"></a> [update\_timeout](#input\_update\_timeout) | The optional timeout that is applied to limit long database updates. | `string` | `"30m"` | no |
| <a name="input_user_labels"></a> [user\_labels](#input\_user\_labels) | The key/value labels for the master instances. | `map(string)` | `{}` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | The name of the default user | `string` | `""` | no |
| <a name="input_user_password"></a> [user\_password](#input\_user\_password) | The password for the default user. If not set, a random one will be generated and available in the generated\_user\_password output variable. | `string` | `""` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone for the master instance. | `string` | `"us-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_name"></a> [connection\_name](#output\_connection\_name) | The connection name of the master instance to be used in connection strings |
| <a name="output_first_ip_address"></a> [first\_ip\_address](#output\_first\_ip\_address) | The first IPv4 address of the addresses assigned. |
| <a name="output_generated_user_passwords"></a> [generated\_user\_passwords](#output\_generated\_user\_passwords) | List of auto-generated passwords |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | The IPv4 addresses assigned for the master instance |
| <a name="output_name"></a> [name](#output\_name) | The instance name for the master instance |
| <a name="output_primary"></a> [primary](#output\_primary) | The `google_sql_database_instance` resource representing the primary instance |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | The private IP address assigned for the master instance |
| <a name="output_root_password"></a> [root\_password](#output\_root\_password) | MSSERVER password for the root user. If not set, a random one will be generated and available in the root\_password output variable. |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | The URI of the master instance |
| <a name="output_server_ca_cert"></a> [server\_ca\_cert](#output\_server\_ca\_cert) | The CA certificate information used to connect to the SQL instance via SSL |
| <a name="output_service_account_email_address"></a> [service\_account\_email\_address](#output\_service\_account\_email\_address) | The service account email address assigned to the master instance |
<!-- END_TF_DOCS -->