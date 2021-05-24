variable "project_id" {
    description = "Id do projeto onde o cluster será criado. Groups e Projects no Atlas são a mesma coisa"
    type        = string
    default     = null
}

variable "project_name" {
    description = "Nome do projeto onde o cluster será criado"
    default     = null
}

variable "provider_name" {
    description = "Nome do cloud provider"
    default     = "AWS" 
}

variable "cluster_name" {
    description = "Nome do cluster"
    default     = null 
}

variable "provider_instance_size_name" {
    description = "Tamanho das instâncias no cluster. Olhar a docs do Atlas para mais info. Default: M10"
    default     = "M10"
}

variable "auto_scale_disk_gb_enabled" {
    description = "Habilita o auto scaling de storage"
    default     = true 
}

variable "auto_scaling_compute_enabled" {
    description = "Habilita o auto scaling da máquina. Default: false"
    default     = false 
}

variable "auto_scaling_compute_scale_down_enabled" {
    description = "Habilita o scale down. Apenas habilitado se a variável  `auto_scaling_compute_enabled` está habilitada. Default: false"
    default     = false 
}

variable "bi_connector" {
    description = "Habilita ou não o bi_connector. Default: false"
    default     = false 
}

variable "bi_connector_config" {
    description = "Configurações do BI connector. Map com os atributos enabled = true e read_preference = analytics"
    default     = [{
        enabled         = true
        read_preference = "analytics"
    }]
}

variable "cluster_type" {
    description = "Tipo do cluster. Possíveis valores: `SHARDED`, `REPLICASET`, `GEOSHARDED`. Default: REPLICASET"
    default     = "REPLICASET" 
}

variable "disk_size_gb" {
    description = "Tamanho inicial do disco. PAra ver o limite de storage/tamanho de instância, cheque a documentação do Atlas"
    default     = 10
}

variable "encryption_at_rest_provider" {
    description = "Utiliza uma chave do cloud provider para gerenciar a criptografia do storage"
    default     = null 
}

variable "mongodb_major_version" {
    description = "Major version da engine do Mongo. Default: 4.4"
    default     = "4.4" 
}

variable "num_shards" {
    description = "Especifica se o cluster é uma replicaset ou sharding. Caso >1, especifica a quantidade de shards no cluster. Default: 1"
    default     = 1 
}

variable "pit_enabled" {
    description = "Habilita o Continuous Cloud Backup. Default: true"
    default     = true
}

variable "provider_backup_enabled" {
    description = "Habilita o Cloud provider Backup"
    default     = true 
}

variable "backing_provider_name" {
    description = "Provider for a cluster multi-tenancy. Defalt null"
    default     = null 
}

variable "provider_disk_iops" {
    description = "Quantidade de iops provisionada para o cluster"
    default     = null
}

variable "provider_region_name" {
    description = "Região em que o cluster será criado"
    default     = "US_EAST_1" 
}

variable "provider_volume_type" {
    description = "Tipo de volume que será utilizado. Possíveis valores: `STANDARD` e `PROVISIONED`. Default: STANDARD"
    default     = "STANDARD" 
}

variable "provider_auto_scaling_compute_max_instance_size" {
    description = "Instância máxima que o auto scaling pode atingir. Obrigatório caso a variável auto_scaling_compute_enabled seja true"
    default     = null
}

variable "provider_auto_scaling_compute_min_instance_size" {
    description = "Instância mínima que o auto scaling pode atingir. Obrigatório caso a variável auto_scaling_compute_scale_down_enabled seja true"
    default     = null
}

variable "replication_specs" {
    description = "Específica as configurações multi-região do cluster, nós de analytics e quantidade de nodes por região/cluster. DOCUMENTAR BEM ESSE CARA AQUI"
    default     = []
}

variable "electable_nodes" {
    description = "Quantidade de nós que podem ser eleitos. Valores possíveis: 3, 5 e 7 Default: 3"
    default     = 3 
}

variable "read_only_nodes" {
    description = "Quantidade de nós que servirão apenas para leitura. Esses nodes não pode ser elegíveis a virar uma réplica primária"
    default     = 0
}

variable "analytics_nodes" {
    description = "Quantidade de nós que servirão para analytics. Nós de analytics tem menos capacidade de os nós de leitura, mas contem a tag ANALYTICS para utilizar no readPreferenceTags"
    default     = 1 
}

variable "fail_index_key_too_long" {
    description = "Caso true, caso o valor do campo que é indexado seja maior que 1024 bytes retornará erro. Caso false, o documento será inserido/atualizado mas não será indexado"
    default     = true 
}

variable "javascript_enabled" {
    description = "Caso true, habilita o servidor a executar rotinas em javascript"
    default     = true 
}

variable "minimum_enabled_tls_protocol" {
    description = "Caso configurado, habilita a versão mínima que o TLS aceita para estabelecer conexões"
    default     = null 
}

variable "no_table_scan" {
    description = "Caso true, nenhuma operação que performance table_scan será permitida"
    default     = false 
}

variable "oplog_size_mb" {
    description = "Tamanho do oplog em MB. Caso não seja configurado, o próprio Atlas utiliza 5% da capacidade total do disco como oplog"
    default     = null 
}

variable "sample_size_bi_connector" {
    description = "Número de documentos que o bi connector utiliza para pegar informações do schema. Só é utilizado caso o bi connector esteja configurado"
    default     = null 
}

variable "sample_refresh_interval_bi_connector" {
    description = "Intervalo de tempo em segundos que o bi connector faz a atualizações dos documentos para criar o schema relacional. Só é utilizado caso o bi connector esteja configurado"
    default     = null 
}

variable "labels" {
    description = "Tags para o cluster. Especificar no formato de lista de maps sendo as chaves: `key` e `value` cada map"
    default     = []
}