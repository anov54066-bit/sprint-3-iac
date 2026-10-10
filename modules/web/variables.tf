variable "vm_spec" {
  description = "Параметры ВМ web"
  type = object({
    cores     = number
    memory    = number
    disk_size = number
    boot_disk = string
  })
}

variable "ssh_public_key" {
  description = "Публичный SSH-ключ"
  type        = string
}

variable "ssh_username" {
  description = "Имя пользователя для SSH"
  type        = string
}

variable "subnet_name" {
  description = "Имя существующей подсети"
  type        = string
}

variable "platform_id" {
  description = "Платформа ВМ"
  type        = string
}