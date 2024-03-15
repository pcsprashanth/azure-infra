# modules/network/variables.tf
variable "environment" {
    description = "The name of the environment"
    type        = string
}

variable "region" {
    description = "The region where resources should be created"
    type        = string
}