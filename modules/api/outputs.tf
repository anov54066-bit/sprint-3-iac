output "private_ip" {
  description = "Внутренний IP ВМ api"
  value       = yandex_compute_instance.api.network_interface[0].ip_address
}

output "instance_id" {
  description = "ID ВМ api"
  value       = yandex_compute_instance.api.id
}

output "disk_ids" {
  description = "ID дополнительных дисков"
  value = {
    for name, disk in yandex_compute_disk.extra_disks : name => disk.id
  }
}