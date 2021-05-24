output "project_id" {
    value = mongodbatlas_cluster.this.id
}

output "name" {
    value = mongodbatlas_cluster.this.name
}

output "provider_instance_size_name" {
    value = mongodbatlas_cluster.this.provider_instance_size_name
}

output "cluster_type" {
    value = mongodbatlas_cluster.this.cluster_type
}

output "disk_size_gb" {
    value = mongodbatlas_cluster.this.disk_size_gb
}

output "mongodb_major_version" {
    value = mongodbatlas_cluster.this.mongo_db_major_version
}

output "provider_backup_enabled" {
    value = mongodbatlas_cluster.this.provider_backup_enabled
}

output "pit_enabled" {
    value = mongodbatlas_cluster.this.pit_enabled
}

output "provider_volume_type" {
    value = mongodbatlas_cluster.this.provider_volume_type
}

output "provider_region_name" {
    value = mongodbatlas_cluster.this.provider_region_name
}

output "replication_specs" {
    value = mongodbatlas_cluster.this.replication_specs
}

output "advanced_configutation" {
    value = mongodbatlas_cluster.this.*.advanced_configuration
}