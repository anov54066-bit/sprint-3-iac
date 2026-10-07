# Terraform module homework

Две ВМ (web и api) в подсети default-ru-central1-a, у api — диски logs/backup. Белых IP нет.

## Запуск

```bash
export YC_TOKEN="..."
export YC_CLOUD_ID="..."
export YC_FOLDER_ID="..."

terraform init

# dev
terraform plan  -var-file="terraform.tfvars.dev"
terraform apply -var-file="terraform.tfvars.dev"

# prod
terraform plan  -var-file="terraform.tfvars.prod"
terraform apply -var-file="terraform.tfvars.prod"

terraform destroy -var-file="terraform.tfvars.dev"