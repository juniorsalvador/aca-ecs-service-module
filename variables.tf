variable "region" {}

variable "service_name" {}

variable "container_image" {
  type        = string
  description = "Imagem com tag para deployment  da aplicaçao no ECS"
}

variable "cluster_name" {}

variable "vpc_id" {}

variable "private_subnets" {
  type = list(string)
}

variable "service_port" {}

variable "service_cpu" {}

variable "service_memory" {}

variable "service_listener" {}

variable "service_task_execution_role" {}

variable "service_launch_type" {
  type = list(object({
    capacity_provider = string
    weight            = number
  }))
  default = [{
    capacity_provider = "SPOT"
    weight            = 100
  }]
}

variable "service_task_count" {}

variable "service_hosts" {}

variable "service_healthcheck" {
  type = map(any)
}

variable "environment_variables" {
  type = list(any)
}

variable "capabilities" {
  type = list(any)
}

variable "scale_type" {}

variable "task_minimum" {}

variable "task_maximum" {}

### Autoscaling de CPU

variable "scale_out_cpu_threshold" {}

variable "scale_out_adjustment" {}

variable "scale_out_comparison_operator" {}

variable "scale_out_statistic" {}

variable "scale_out_period" {}

variable "scale_out_evaluation_periods" {}

variable "scale_out_cooldown" {}

variable "scale_in_cpu_threshold" {}

variable "scale_in_adjustment" {}

variable "scale_in_comparison_operator" {}

variable "scale_in_statistic" {}

variable "scale_in_period" {}

variable "scale_in_evaluation_periods" {}

variable "scale_in_cooldown" {}

### Tracking CPU

variable "scale_tracking_cpu" {
  default = 80
}

### Tracking Requests

variable "alb_arn" {
  default = null
}

variable "scale_tracking_requests" {
  default = 0
}

variable "efs_volumes" {
  type = list(object({
    volume_name : string
    file_system_id : string
    file_system_root : string
    mount_point : string
    read_only : bool
  }))
  default     = []
  description = "Volumes para serem montados no ECS"
}

variable "secrets" {
  type = list(object({
    name : string
    valueFrom : string
  }))
  description = "Lista de secrets do parameter store ou do secrets manager"
  default     = []
}