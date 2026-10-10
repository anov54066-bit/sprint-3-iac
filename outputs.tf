output "disk_ids" {
  description = "ID дополнительных дисков, подключённых к api"
  value       = module.api.disk_ids
}

output "private_ips" {
  description = "Внутренние IP-адреса виртуальных машин"
  value = {
    api_vm = module.api.private_ip
    web_vm = module.web.private_ip
  }
}