variable "extra_disk_names" {
  description = "Список имён дополнительных дисков для ВМ api"
  type        = list(string)
  default     = ["logs", "backup"]
}

variable "extra_disk_type" {
  description = "Тип дополнительных дисков"
  type        = string
  default     = "network-hdd"

  validation {
    condition     = contains(["network-hdd", "network-ssd"], var.extra_disk_type)
    error_message = "extra_disk_type должен быть network-hdd или network-ssd"
  }
}

variable "extra_disk_size" {
  description = "Размер дополнительных дисков в ГБ"
  type        = number
  default     = 20

  validation {
    condition     = var.extra_disk_size > 1
    error_message = "extra_disk_size должен быть больше 1 ГБ"
  }
}

variable "vm_specification" {
  description = "Параметры виртуальных машин web и api"
  type = map(object({
    cores     = number
    memory    = number
    disk_size = number
    boot_disk = string
  }))
  default = {
    web = {
      cores     = 2
      memory    = 2
      disk_size = 10
      boot_disk = "fd845dr9j4h2aaq1m6ko"
    }
    api = {
      cores     = 2
      memory    = 2
      disk_size = 10
      boot_disk = "fd845dr9j4h2aaq1m6ko"
    }
  }

  validation {
    condition = alltrue([
      for vm in values(var.vm_specification) :
      vm.cores == 2 &&
      (vm.memory == 2 || vm.memory == 4) &&
      vm.disk_size > 1
    ])
    error_message = "Only available 2 cores, 2 memory or 4 memory and disk must be > 1gb"
  }
}

variable "ssh_public_key" {
  description = "Публичный SSH-ключ для обеих ВМ"
  type        = string
}

variable "subnet_name" {
  description = "Имя существующей подсети в Яндекс Облаке"
  type        = string
  default     = "default-ru-central1-a"
}

variable "platform_id" {
  description = "Платформа вычислительных ресурсов Яндекс Облака"
  type        = string
  default     = "standard-v2"
}

variable "ssh_username" {
  description = "Имя пользователя для SSH-ключа в metadata"
  type        = string
  default     = "ubuntu"
}