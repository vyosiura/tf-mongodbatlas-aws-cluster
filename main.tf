#  Criar o cluster de mongodb

locals {
    default_region_specs = [{
        num_shards      = 1
        regions_specs   = [{
            region_name             = var.provider_region_name
            electable_nodes         = var.electable_nodes
            priority                = 7
            read_only_nodes         = var.read_only_nodes
            analytics_nodes         = var.analytics_nodes
        }]
    }]
    replication_specs   = length(var.replication_specs) == 0 ? local.default_region_specs : var.replication_specs
}


resource "mongodbatlas_cluster" "this" {
    project_id                                              = var.project_id
    provider_name                                           = var.provider_name
    name                                                    = var.cluster_name
    provider_instance_size_name                             = var.provider_instance_size_name
    auto_scaling_disk_gb_enabled                            = var.auto_scale_disk_gb_enabled
    auto_scaling_compute_enabled                            = var.auto_scaling_compute_enabled
    auto_scaling_compute_scale_down_enabled                 = var.auto_scaling_compute_enabled ? var.auto_scaling_compute_scale_down_enabled : false
    
    dynamic "bi_connector_config" {
        for_each = var.bi_connector ? var.bi_connector_config : []

        content {
            enabled         = bi_connector_config.value["enabled"]
            read_preference = bi_connector_config.value["read_preference"]
        }
    }
    cluster_type                                            = var.cluster_type
    disk_size_gb                                            = var.disk_size_gb
    encryption_at_rest_provider                             = var.encryption_at_rest_provider
    mongo_db_major_version                                  = var.mongodb_major_version
    num_shards                                              = var.num_shards
    pit_enabled                                             = var.pit_enabled
    provider_backup_enabled                                 = var.provider_backup_enabled
    backing_provider_name                                   = var.backing_provider_name
    provider_disk_iops                                      = var.provider_disk_iops
    provider_volume_type                                    = var.provider_volume_type
    provider_region_name                                    = var.provider_region_name
    provider_auto_scaling_compute_max_instance_size         = var.provider_auto_scaling_compute_max_instance_size
    provider_auto_scaling_compute_min_instance_size         = var.provider_auto_scaling_compute_min_instance_size
    dynamic "replication_specs" {
        for_each        = local.replication_specs

        content {
            num_shards  =  replication_specs.value["num_shards"]

            dynamic "regions_config" {

                for_each = replication_specs.value["regions_specs"]
        
                content {
                    region_name         = regions_config.value["region_name"]
                    electable_nodes     = regions_config.value["electable_nodes"]
                    priority            = regions_config.value["priority"]
                    read_only_nodes     = regions_config.value["read_only_nodes"]
                    analytics_nodes     = regions_config.value["analytics_nodes"]
                }
            }
        }
    }
    advanced_configuration  {
        fail_index_key_too_long                 = var.fail_index_key_too_long
        javascript_enabled                      = var.javascript_enabled
        minimum_enabled_tls_protocol            = var.minimum_enabled_tls_protocol
        no_table_scan                           = var.no_table_scan
        oplog_size_mb                           = var.oplog_size_mb
        sample_size_bi_connector                = var.sample_size_bi_connector
        sample_refresh_interval_bi_connector    = var.sample_refresh_interval_bi_connector
    }

    dynamic "labels" {
        for_each = var.labels

        content {
            key     = labels.value["key"]
            value   = labels.value["value"]
        }
    }
}

