# environments/dev/terragrunt.hcl
inputs = {
    environment = "dev"
    region      = "us-west-2"
}

terraform {
    source = "../../modules//"
}