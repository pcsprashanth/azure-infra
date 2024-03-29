# environments/prod/terragrunt.hcl

terraform {
    source = "../../modules/network/resource-group/"
}

inputs = {
    environment = "prod"
    region      = "us-east-1"
    name = "my-resources-prod"
}