# environments/prod/terragrunt.hcl

terraform {
    source = "../../modules/network/resource-group/"
}

inputs = {
    environment = "prod"
    region      = "eastus"
    name = "my-resources-prod"
}