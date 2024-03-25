# environments/dev/terragrunt.hcl

terraform {
    source = "../../modules/network/resource-group/"
}

inputs = {
    environment = "dev"
    region      = "westus2"
    name        = "my-resources-dev"
}