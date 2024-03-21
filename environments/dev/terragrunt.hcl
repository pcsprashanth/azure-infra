# environments/dev/terragrunt.hcl

terraform {
    source = "../../modules/network/"
}

inputs = {
    environment = "dev"
    region      = "us-west-2"
}