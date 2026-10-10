terraform {
  required_version = ">= 1.5.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.100"
    }
  }
}

provider "yandex" {
  # Токен и cloud/folder id берутся из окружения:
  # YC_TOKEN, YC_CLOUD_ID, YC_FOLDER_ID
}