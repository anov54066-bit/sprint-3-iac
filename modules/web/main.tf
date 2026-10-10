data "yandex_vpc_subnet" "default_subnet" {
  name = var.subnet_name
}

resource "yandex_compute_instance" "web" {
  name        = "web"
  platform_id = var.platform_id
  zone        = data.yandex_vpc_subnet.default_subnet.zone

  resources {
    cores  = var.vm_spec.cores
    memory = var.vm_spec.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_spec.boot_disk
      size     = var.vm_spec.disk_size
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.default_subnet.id
    nat       = false
  }

  metadata = {
    ssh-keys = "${var.ssh_username}:${var.ssh_public_key}"
  }
}