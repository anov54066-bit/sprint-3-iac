output "private_ip" {
  description = "Внутренний IP ВМ web"
  value       = yandex_compute_instance.web.network_interface[0].ip_address
}

output "instance_id" {
  description = "ID ВМ web"
  value       = yandex_compute_instance.web.id
}