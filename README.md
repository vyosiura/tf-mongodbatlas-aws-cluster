## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_mongodbatlas"></a> [mongodbatlas](#requirement\_mongodbatlas) | 0.9.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_mongodbatlas"></a> [mongodbatlas](#provider\_mongodbatlas) | 0.9.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [mongodbatlas_cluster.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/0.9.1/docs/resources/cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_analytics_nodes"></a> [analytics\_nodes](#input\_analytics\_nodes) | Quantidade de nós que servirão para analytics. Nós de analytics tem menos capacidade de os nós de leitura, mas contem a tag ANALYTICS para utilizar no readPreferenceTags | `number` | `1` | no |
| <a name="input_auto_scale_disk_gb_enabled"></a> [auto\_scale\_disk\_gb\_enabled](#input\_auto\_scale\_disk\_gb\_enabled) | Habilita o auto scaling de storage | `bool` | `true` | no |
| <a name="input_auto_scaling_compute_enabled"></a> [auto\_scaling\_compute\_enabled](#input\_auto\_scaling\_compute\_enabled) | Habilita o auto scaling da máquina. Default: false | `bool` | `false` | no |
| <a name="input_auto_scaling_compute_scale_down_enabled"></a> [auto\_scaling\_compute\_scale\_down\_enabled](#input\_auto\_scaling\_compute\_scale\_down\_enabled) | Habilita o scale down. Apenas habilitado se a variável  `auto_scaling_compute_enabled` está habilitada. Default: false | `bool` | `false` | no |
| <a name="input_backing_provider_name"></a> [backing\_provider\_name](#input\_backing\_provider\_name) | Provider for a cluster multi-tenancy. Defalt null | `any` | `null` | no |
| <a name="input_bi_connector"></a> [bi\_connector](#input\_bi\_connector) | Habilita ou não o bi\_connector. Default: false | `bool` | `false` | no |
| <a name="input_bi_connector_config"></a> [bi\_connector\_config](#input\_bi\_connector\_config) | Configurações do BI connector. Map com os atributos enabled = true e read\_preference = analytics | `list` | <pre>[<br>  {<br>    "enabled": true,<br>    "read_preference": "analytics"<br>  }<br>]</pre> | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do cluster | `any` | `null` | no |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | Tipo do cluster. Possíveis valores: `SHARDED`, `REPLICASET`, `GEOSHARDED`. Default: REPLICASET | `string` | `"REPLICASET"` | no |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input\_disk\_size\_gb) | Tamanho inicial do disco. PAra ver o limite de storage/tamanho de instância, cheque a documentação do Atlas | `number` | `10` | no |
| <a name="input_electable_nodes"></a> [electable\_nodes](#input\_electable\_nodes) | Quantidade de nós que podem ser eleitos. Valores possíveis: 3, 5 e 7 Default: 3 | `number` | `3` | no |
| <a name="input_encryption_at_rest_provider"></a> [encryption\_at\_rest\_provider](#input\_encryption\_at\_rest\_provider) | Utiliza uma chave do cloud provider para gerenciar a criptografia do storage | `any` | `null` | no |
| <a name="input_fail_index_key_too_long"></a> [fail\_index\_key\_too\_long](#input\_fail\_index\_key\_too\_long) | Caso true, caso o valor do campo que é indexado seja maior que 1024 bytes retornará erro. Caso false, o documento será inserido/atualizado mas não será indexado | `bool` | `true` | no |
| <a name="input_javascript_enabled"></a> [javascript\_enabled](#input\_javascript\_enabled) | Caso true, habilita o servidor a executar rotinas em javascript | `bool` | `true` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Tags para o cluster. Especificar no formato de lista de maps sendo as chaves: `key` e `value` cada map | `list` | `[]` | no |
| <a name="input_minimum_enabled_tls_protocol"></a> [minimum\_enabled\_tls\_protocol](#input\_minimum\_enabled\_tls\_protocol) | Caso configurado, habilita a versão mínima que o TLS aceita para estabelecer conexões | `any` | `null` | no |
| <a name="input_mongodb_major_version"></a> [mongodb\_major\_version](#input\_mongodb\_major\_version) | Major version da engine do Mongo. Default: 4.4 | `string` | `"4.4"` | no |
| <a name="input_no_table_scan"></a> [no\_table\_scan](#input\_no\_table\_scan) | Caso true, nenhuma operação que performance table\_scan será permitida | `bool` | `false` | no |
| <a name="input_num_shards"></a> [num\_shards](#input\_num\_shards) | Especifica se o cluster é uma replicaset ou sharding. Caso >1, especifica a quantidade de shards no cluster. Default: 1 | `number` | `1` | no |
| <a name="input_oplog_size_mb"></a> [oplog\_size\_mb](#input\_oplog\_size\_mb) | Tamanho do oplog em MB. Caso não seja configurado, o próprio Atlas utiliza 5% da capacidade total do disco como oplog | `any` | `null` | no |
| <a name="input_pit_enabled"></a> [pit\_enabled](#input\_pit\_enabled) | Habilita o Continuous Cloud Backup. Default: true | `bool` | `true` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Id do projeto onde o cluster será criado. Groups e Projects no Atlas são a mesma coisa | `string` | `null` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nome do projeto onde o cluster será criado | `any` | `null` | no |
| <a name="input_provider_auto_scaling_compute_max_instance_size"></a> [provider\_auto\_scaling\_compute\_max\_instance\_size](#input\_provider\_auto\_scaling\_compute\_max\_instance\_size) | Instância máxima que o auto scaling pode atingir. Obrigatório caso a variável auto\_scaling\_compute\_enabled seja true | `any` | `null` | no |
| <a name="input_provider_auto_scaling_compute_min_instance_size"></a> [provider\_auto\_scaling\_compute\_min\_instance\_size](#input\_provider\_auto\_scaling\_compute\_min\_instance\_size) | Instância mínima que o auto scaling pode atingir. Obrigatório caso a variável auto\_scaling\_compute\_scale\_down\_enabled seja true | `any` | `null` | no |
| <a name="input_provider_backup_enabled"></a> [provider\_backup\_enabled](#input\_provider\_backup\_enabled) | Habilita o Cloud provider Backup | `bool` | `true` | no |
| <a name="input_provider_disk_iops"></a> [provider\_disk\_iops](#input\_provider\_disk\_iops) | Quantidade de iops provisionada para o cluster | `any` | `null` | no |
| <a name="input_provider_instance_size_name"></a> [provider\_instance\_size\_name](#input\_provider\_instance\_size\_name) | Tamanho das instâncias no cluster. Olhar a docs do Atlas para mais info. Default: M10 | `string` | `"M10"` | no |
| <a name="input_provider_name"></a> [provider\_name](#input\_provider\_name) | Nome do cloud provider | `string` | `"AWS"` | no |
| <a name="input_provider_region_name"></a> [provider\_region\_name](#input\_provider\_region\_name) | Região em que o cluster será criado | `string` | `"US_EAST_1"` | no |
| <a name="input_provider_volume_type"></a> [provider\_volume\_type](#input\_provider\_volume\_type) | Tipo de volume que será utilizado. Possíveis valores: `STANDARD` e `PROVISIONED`. Default: STANDARD | `string` | `"STANDARD"` | no |
| <a name="input_read_only_nodes"></a> [read\_only\_nodes](#input\_read\_only\_nodes) | Quantidade de nós que servirão apenas para leitura. Esses nodes não pode ser elegíveis a virar uma réplica primária | `number` | `0` | no |
| <a name="input_replication_specs"></a> [replication\_specs](#input\_replication\_specs) | Específica as configurações multi-região do cluster, nós de analytics e quantidade de nodes por região/cluster. DOCUMENTAR BEM ESSE CARA AQUI | `list` | `[]` | no |
| <a name="input_sample_refresh_interval_bi_connector"></a> [sample\_refresh\_interval\_bi\_connector](#input\_sample\_refresh\_interval\_bi\_connector) | Intervalo de tempo em segundos que o bi connector faz a atualizações dos documentos para criar o schema relacional. Só é utilizado caso o bi connector esteja configurado | `any` | `null` | no |
| <a name="input_sample_size_bi_connector"></a> [sample\_size\_bi\_connector](#input\_sample\_size\_bi\_connector) | Número de documentos que o bi connector utiliza para pegar informações do schema. Só é utilizado caso o bi connector esteja configurado | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_advanced_configutation"></a> [advanced\_configutation](#output\_advanced\_configutation) | n/a |
| <a name="output_cluster_type"></a> [cluster\_type](#output\_cluster\_type) | n/a |
| <a name="output_disk_size_gb"></a> [disk\_size\_gb](#output\_disk\_size\_gb) | n/a |
| <a name="output_mongodb_major_version"></a> [mongodb\_major\_version](#output\_mongodb\_major\_version) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_pit_enabled"></a> [pit\_enabled](#output\_pit\_enabled) | n/a |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | n/a |
| <a name="output_provider_backup_enabled"></a> [provider\_backup\_enabled](#output\_provider\_backup\_enabled) | n/a |
| <a name="output_provider_instance_size_name"></a> [provider\_instance\_size\_name](#output\_provider\_instance\_size\_name) | n/a |
| <a name="output_provider_region_name"></a> [provider\_region\_name](#output\_provider\_region\_name) | n/a |
| <a name="output_provider_volume_type"></a> [provider\_volume\_type](#output\_provider\_volume\_type) | n/a |
| <a name="output_replication_specs"></a> [replication\_specs](#output\_replication\_specs) | n/a |
