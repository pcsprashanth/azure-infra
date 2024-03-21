# environments/dev/terragrunt.hcl

terraform {
    source = "../../modules/"
}

inputs = {
    environment = "dev"
    region      = "us-west-2"
}